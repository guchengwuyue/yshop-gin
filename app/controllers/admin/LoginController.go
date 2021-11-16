/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
*/
package admin

import (
	"github.com/gin-gonic/gin"
	"github.com/mojocn/base64Captcha"
	"image/color"
	"net/http"
	"time"
	"yixiang.co/go-mall/app/models/dto"
	"yixiang.co/go-mall/app/models/vo"
	"yixiang.co/go-mall/app/service/user_service"
	"yixiang.co/go-mall/pkg/app"
	"yixiang.co/go-mall/pkg/constant"
	"yixiang.co/go-mall/pkg/jwt"
	"yixiang.co/go-mall/pkg/logging"
	"yixiang.co/go-mall/pkg/util"
)

// 登录api
type LoginController struct {
}

type CaptchaResult struct {
	Id          string `json:"id"`
	Base64Blob  string `json:"base_64_blob"`
	VerifyValue string `json:"code"`
}

// 设置自带的store
var store = base64Captcha.DefaultMemStore


// @Title 登录
// @Description 登录
// @Success 200 {object} app.Response
// @router /admin/login [post]
func (e *LoginController) Login(c *gin.Context) {
	var (
		authUser dto.AuthUser
		appG = app.Gin{C: c}
	)

	//body, _ := ioutil.ReadAll(c.Request.Body)
	//logging.Info(string(body))

	httpCode, errCode := app.BindAndValid(c,&authUser)
	logging.Info(authUser)
	if errCode != constant.SUCCESS {
		appG.Response(httpCode,errCode,nil)
		return
	}


	userService := user_service.User{Username: authUser.Username}
	currentUser, err := userService.GetUserOneByName()
	if err != nil {
		appG.Response(http.StatusInternalServerError,constant.ERROR_NOT_EXIST_USER,nil)
		return
	}

	//校验验证码
	if !store.Verify(authUser.Id, authUser.Code, true) {
		appG.Response(http.StatusInternalServerError,constant.ERROR_CAPTCHA_USER,nil)
		return
	}
	if !util.ComparePwd(currentUser.Password, []byte(authUser.Password)) {
		appG.Response(http.StatusInternalServerError,constant.ERROR_PASS_USER,nil)
		return
	}
	token, _ := jwt.GenerateToken(currentUser, time.Hour*24*100)
	var loginVO = new(vo.LoginVo)
	loginVO.Token = token
	loginVO.User = currentUser
	appG.Response(http.StatusOK,constant.SUCCESS,loginVO)

}

// @Title 获取用户信息
// @Description 获取用户信息
// @Success 200 {object} app.Response
// @router /info [get]
func (e *LoginController) Info(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
	)
	appG.Response(http.StatusOK,constant.SUCCESS, jwt.GetAdminDetailUser(c))
}

// @Title 退出登录
// @Description 退出登录
// @Success 200 {object} app.Response
// @router /logout [delete]
func (e *LoginController) Logout(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
	)
	err := jwt.RemoveUser(c)
	if err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_LOGOUT_USER,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)
}

// @Title 获取验证码
// @Description 获取验证码
// @router /captcha [get]
func (e *LoginController) Captcha(c *gin.Context) {
	GenerateCaptcha(c)
}

// 生成图形化验证码  ctx *context.Context
func GenerateCaptcha(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
		driver base64Captcha.Driver
		driverString base64Captcha.DriverMath
	)

	// 配置验证码信息
	captchaConfig := base64Captcha.DriverMath{
		Height:          38,
		Width:           110,
		NoiseCount:      0,
		ShowLineOptions: 0,
		BgColor: &color.RGBA{
			R: 3,
			G: 102,
			B: 214,
			A: 125,
		},
		Fonts: []string{"wqy-microhei.ttc"},
	}

	// 自定义配置，如果不需要自定义配置，则上面的结构体和下面这行代码不用写
	driverString = captchaConfig
	driver = driverString.ConvertFonts()

	captcha := base64Captcha.NewCaptcha(driver, store)
	id, b64s, err := captcha.Generate()
	if err != nil {
		logging.Error(err.Error())
	}
	captchaResult := CaptchaResult{
		Id:         id,
		Base64Blob: b64s,
	}

	appG.Response(http.StatusOK,constant.SUCCESS,captchaResult)
}
