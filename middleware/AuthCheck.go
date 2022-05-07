package middleware

import (
	"github.com/gin-gonic/gin"
	"net/http"
	"regexp"
	"strings"
	"yixiang.co/go-mall/pkg/app"
	"yixiang.co/go-mall/pkg/constant"
	"yixiang.co/go-mall/pkg/jwt"
	"yixiang.co/go-mall/pkg/logging"
	"yixiang.co/go-mall/pkg/runtime"
)

const bearerLength = len("Bearer ")

func AppJwt() gin.HandlerFunc {
	return func(c *gin.Context) {
		var data interface{}
		var appG = app.Gin{C: c}

		mytoken := c.Request.Header.Get("Authorization")
		if len(mytoken) < bearerLength {
			appG.Response(http.StatusUnauthorized,constant.ERROR_AUTH,data)
			c.Abort()
			return
		}
		token := strings.TrimSpace(mytoken[bearerLength:])
		usr, err := jwt.ValidateToken(token)
		if err != nil {
			logging.Info(err)
			appG.Response(http.StatusUnauthorized,constant.ERROR_AUTH_CHECK_TOKEN_FAIL,data)
			c.Abort()
			return
		}

		c.Set(constant.APP_AUTH_USER, usr)

		c.Next()

	}
}

func Jwt() gin.HandlerFunc {
	return func(c *gin.Context) {
		var data interface{}
		var appG = app.Gin{C: c}

		url := c.Request.URL.Path

		method := strings.ToLower(c.Request.Method)
		//部署线上开启
		//prohibit := "post,put,delete"
		//if url != "/admin/auth/logout" && strings.Contains(prohibit,method) {
		//	ctx.Output.JSON(controllers.ErrMsg("演示环境禁止操作",40006),
		//		true,true)
		//	return
		//}

		mytoken := c.Request.Header.Get("Authorization")
		if len(mytoken) < bearerLength {
			appG.Response(http.StatusUnauthorized,constant.ERROR_AUTH,data)
			c.Abort()
			return
		}
		token := strings.TrimSpace(mytoken[bearerLength:])
		usr, err := jwt.ValidateToken(token)
		if err != nil {
			logging.Info(err)
			appG.Response(http.StatusUnauthorized,constant.ERROR_AUTH_CHECK_TOKEN_FAIL,data)
			c.Abort()
			return
		}

		c.Set(constant.ContextKeyUserObj, usr)
		//url排除
		if urlExclude(url) {
			c.Next()
			return
		}

		//casbin check
		cb := runtime.Runtime.GetCasbinKey(constant.YSHOP_CASBIN)

		for _, roleName := range usr.Roles {
			//超级管理员过滤掉
			if roleName == "admin" {
				break
			}
			logging.Info(roleName, url, method)
			res, err := cb.Enforce(roleName, url, method)
			if err != nil {
				logging.Error(err)
			}
			//logging.Info(res)

			if !res {
				appG.Response(http.StatusForbidden,constant.ERROR_AUTH_CHECK_FAIL,data)
				c.Abort()
				return
			}
		}

		c.Next()


	}
}


//url排除
func urlExclude(url string) bool {
	//公共路由直接放行
	reg := regexp.MustCompile(`[0-9]+`)
	newUrl := reg.ReplaceAllString(url, "*")
	var ignoreUrls = "/admin/menu/build,/admin/user/center,/admin/user/updatePass,/admin/auth/info," +
		"/admin/auth/logout,/admin/materialgroup/*,/admin/material/*,/shop/product/isFormatAttr/*"
	if strings.Contains(ignoreUrls, newUrl) {
		return true
	}

	return false
}