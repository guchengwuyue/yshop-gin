/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package admin

import (
	"github.com/gin-gonic/gin"
	"github.com/unknwon/com"
	"net/http"
	"yixiang.co/go-mall/app/models"
	dto2 "yixiang.co/go-mall/app/service/menu_service/dto"
	"yixiang.co/go-mall/app/service/role_service"
	"yixiang.co/go-mall/pkg/app"
	"yixiang.co/go-mall/pkg/constant"
	"yixiang.co/go-mall/pkg/logging"
	"yixiang.co/go-mall/pkg/util"
)


// 角色 API
type RoleController struct {
}

// @Title 获取单个角色
// @Description 获取单个角色
// @Param    id        path     int    true        "角色ID"
// @Success 200 {object} app.Response
// @router /:id [get]
func (e *RoleController) GetOne(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
	)
	id := com.StrTo(c.Param("id")).MustInt64()
	roleService := role_service.Role{
		Id: id,
	}
	vo := roleService.GetOneRole()
	appG.Response(http.StatusOK,constant.SUCCESS,vo)
}
//
// @Title 角色列表
// @Description 角色列表
// @Success 200 {object} app.Response
// @router / [get]
func (e *RoleController) GetAll(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
	)
	blurry := c.DefaultQuery("blurry","")
	roleService := role_service.Role{
		Name: blurry,
		PageSize: util.GetSize(c),
		PageNum: util.GetPage(c),
	}
	vo := roleService.GetAll()
	appG.Response(http.StatusOK,constant.SUCCESS,vo)
}

// @Title 角色添加
// @Description 角色添加
// @Success 200 {object} app.Response
// @router / [post]
func (e *RoleController) Post(c *gin.Context)  {
	var (
		model models.SysRole
		appG = app.Gin{C: c}
	)
	httpCode, errCode := app.BindAndValid(c,&model)
	if errCode != constant.SUCCESS {
		appG.Response(httpCode,errCode,nil)
		return
	}
	roleService := role_service.Role{
		M: &model,
	}

	if err := roleService.Insert(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)
}

// @router / [put]
func (e *RoleController) Put(c *gin.Context)  {
	var (
		model models.SysRole
		appG = app.Gin{C: c}
	)
	httpCode, errCode := app.BindAndValid(c,&model)
	if errCode != constant.SUCCESS {
		appG.Response(httpCode,errCode,nil)
		return
	}
	roleService := role_service.Role{
		M: &model,
	}

	if err := roleService.Save(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)
}

// @Title 角色删除
// @Description 角色删除
// @Success 200 {object} app.Response
// @router / [delete]
func (e *RoleController) Delete(c *gin.Context) {
	var (
		ids []int64
		appG = app.Gin{C: c}
	)
	c.BindJSON(&ids)
	roleService := role_service.Role{Ids: ids}

	if err := roleService.Del(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)
}

// @Title 角色菜单更新
// @Description 角色菜单更新
// @Success 200 {object} app.Response
// @router /menu [put]
func (e *RoleController) Menu(c *gin.Context)  {
	var (
		model dto2.RoleMenu
		appG  = app.Gin{C: c}
	)
	httpCode, errCode := app.BindAndValid(c,&model)
	logging.Info(model)
	if errCode != constant.SUCCESS {
		appG.Response(httpCode,errCode,nil)
		return
	}

	roleService := role_service.Role{Dto: model}
	if err := roleService.BatchRoleMenuAdd(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)

}