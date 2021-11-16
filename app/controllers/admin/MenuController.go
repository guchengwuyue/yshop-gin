/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package admin

import (
	"github.com/astaxie/beego/logs"
	"github.com/gin-gonic/gin"
	"github.com/unknwon/com"
	"net/http"
	"yixiang.co/go-mall/app/models"
	"yixiang.co/go-mall/app/service/menu_service"
	"yixiang.co/go-mall/pkg/app"
	"yixiang.co/go-mall/pkg/constant"
	"yixiang.co/go-mall/pkg/jwt"
)

// 菜单api
type MenuController struct {
}

// @Title 菜单列表
// @Description 菜单列表
// @Success 200 {object} app.Response
// @router / [get]
func (e *MenuController) GetAll(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
	)
	name := c.DefaultQuery("blurry","")
	enabled := com.StrTo(c.DefaultQuery("enabled","-1")).MustInt()
	menuService := menu_service.Menu{Name: name,Enabled: enabled}
	vo := menuService.GetAll()
	appG.Response(http.StatusOK,constant.SUCCESS,vo)
}

// @Title 菜单添加
// @Description 菜单添加
// @Success 200 {object} app.Response
// @router / [post]
func (e *MenuController) Post(c *gin.Context) {
	var (
		model models.SysMenu
		appG = app.Gin{C: c}
	)
	httpCode, errCode := app.BindAndValid(c,&model)
	if errCode != constant.SUCCESS {
		appG.Response(httpCode,errCode,nil)
		return
	}
	menuService := menu_service.Menu{
		M: &model,
	}

	if err := menuService.Insert(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)
}

// @Title 菜单修改
// @Description 菜单修改
// @Success 200 {object} app.Response
// @router / [put]
func (e *MenuController) Put(c *gin.Context) {
	var (
		model models.SysMenu
		appG = app.Gin{C: c}
	)
	httpCode, errCode := app.BindAndValid(c,&model)
	if errCode != constant.SUCCESS {
		appG.Response(httpCode,errCode,nil)
		return
	}
	menuService := menu_service.Menu{
		M: &model,
	}

	if err := menuService.Save(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)
}

// @Title 菜单删除
// @Description 菜单删除
// @Success 200 {object} app.Response
// @router / [delete]
func (e *MenuController) Delete(c *gin.Context) {
	var (
		ids []int64
		appG = app.Gin{C: c}
	)
	c.BindJSON(&ids)
	menuService := menu_service.Menu{Ids: ids}

	if err := menuService.Del(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)
}

// @Title 菜单构建
// @Description 菜单构建
// @Success 200 {object} app.Response
// @router /build [get]
func (e *MenuController) Build(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
	)
	uid, _ := jwt.GetAdminUserId(c)
	menuService := menu_service.Menu{Uid: uid}
	logs.Info(uid)
	menus := menuService.BuildMenus()
	appG.Response(http.StatusOK,constant.SUCCESS,menus)
}

// @Title 菜单树形
// @Description 菜单树形
// @Success 200 {object} app.Response
// @router /tree [get]
func (e *MenuController) GetTree(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
	)
	menuService := menu_service.Menu{}
	vo := menuService.GetTree()
	appG.Response(http.StatusOK,constant.SUCCESS,vo)
}
