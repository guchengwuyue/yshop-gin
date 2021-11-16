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
	"yixiang.co/go-mall/app/service/material_group_service"
	"yixiang.co/go-mall/pkg/app"
	"yixiang.co/go-mall/pkg/constant"
	"yixiang.co/go-mall/pkg/jwt"
)

// 素材分组api
type MaterialGroupController struct {
}


// @Title 素材分组列表
// @Description 素材分组列表
// @Success 200 {object} app.Response
// @router / [get]
func (e *MaterialGroupController) GetAll(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
	)
	name := c.DefaultQuery("blurry","")
	materialGroupService := material_group_service.MaterialGroup{
		Name: name,
	}
	vo := materialGroupService.GetAll()
	appG.Response(http.StatusOK,constant.SUCCESS,vo)
}

// @Title素材分组添加
// @Description素材分组添加
// @Success 200 {object} app.Response
// @router / [post]
func (e *MaterialGroupController) Post(c *gin.Context) {
	var (
		model models.SysMaterialGroup
		appG = app.Gin{C: c}
	)
	httpCode, errCode := app.BindAndValid(c,&model)
	if errCode != constant.SUCCESS {
		appG.Response(httpCode,errCode,nil)
		return
	}
	uid, _ := jwt.GetAdminUserId(c)
	model.CreateId = uid
	materialGroupService := material_group_service.MaterialGroup{
		M: &model,
	}

	if err := materialGroupService.Insert(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)

}

// @Title 素材分组修改
// @Description 素材分组修改
// @Success 200 {object} app.Response
// @router / [put]
func (e *MaterialGroupController) Put(c *gin.Context) {
	var (
		model models.SysMaterialGroup
		appG = app.Gin{C: c}
	)
	httpCode, errCode := app.BindAndValid(c,&model)
	if errCode != constant.SUCCESS {
		appG.Response(httpCode,errCode,nil)
		return
	}
	uid, _ := jwt.GetAdminUserId(c)
	model.CreateId = uid
	materialGroupService := material_group_service.MaterialGroup{
		M: &model,
	}

	if err := materialGroupService.Save(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)
}

// @Title 素材分组删除
// @Description 素材分组删除
// @Success 200 {object} app.Response
// @router /:id [delete]
func (e *MaterialGroupController) Delete(c *gin.Context) {
	var (
		ids []int64
		appG = app.Gin{C: c}
	)
	id := com.StrTo(c.Param("id")).MustInt64()
	ids = append(ids, id)
	materialGroupService := material_group_service.MaterialGroup{Ids: ids}

	if err := materialGroupService.Del(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)
}
