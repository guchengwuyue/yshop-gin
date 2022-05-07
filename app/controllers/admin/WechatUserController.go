/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package admin

import (
	"github.com/gin-gonic/gin"
	"net/http"
	dto2 "yixiang.co/go-mall/app/service/user_service/dto"
	"yixiang.co/go-mall/app/service/wechat_user_service"
	dto3 "yixiang.co/go-mall/app/service/wechat_user_service/dto"
	"yixiang.co/go-mall/pkg/app"
	"yixiang.co/go-mall/pkg/constant"
	"yixiang.co/go-mall/pkg/util"
)


// 微信用户 API
type WechatUserController struct {
}


// @Title 用户列表
// @Description 用户列表
// @Success 200 {object} app.Response
// @router / [get]
func (e *WechatUserController) GetAll(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
	)
	value := c.DefaultQuery("value","")
	myType := c.DefaultQuery("type","")
	userType := c.DefaultQuery("userType","")

	userService := wechat_user_service.User{
		Value: value,
		MyType: myType,
		UserType: userType,
		PageSize: util.GetSize(c),
		PageNum: util.GetPage(c),
	}

	vo := userService.GetUserAll()
	appG.Response(http.StatusOK,constant.SUCCESS,vo)
}


//
// @Title 用户编辑
// @Description 用户编辑
// @Success 200 {object} app.Response
// @router / [put]
func (e *WechatUserController) Put(c *gin.Context)  {
	var (
		model dto3.YshopUser
		appG  = app.Gin{C: c}
	)
	httpCode, errCode := app.BindAndValid(c,&model)
	if errCode != constant.SUCCESS {
		appG.Response(httpCode,errCode,nil)
		return
	}
	userService := wechat_user_service.User{
		Dto: &model,
	}

	if err := userService.Save(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)
}

//
// @Title 用户余额修改
// @Description 用户余额修改
// @Success 200 {object} app.Response
// @router / [post]
func (e *WechatUserController) Money(c *gin.Context)  {
	var (
		model dto2.UserMoney
		appG  = app.Gin{C: c}
	)
	httpCode, errCode := app.BindAndValid(c,&model)
	if errCode != constant.SUCCESS {
		appG.Response(httpCode,errCode,nil)
		return
	}
	userService := wechat_user_service.User{
		Money: &model,
	}

	if err := userService.SaveMony(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)
}






