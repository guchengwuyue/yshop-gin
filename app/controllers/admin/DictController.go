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
	"yixiang.co/go-mall/app/service/dict_service"
	"yixiang.co/go-mall/pkg/app"
	"yixiang.co/go-mall/pkg/constant"
	"yixiang.co/go-mall/pkg/util"
)


// 字典api
type DictController struct {
}


// @Title 获取字典列表
// @Description 获取字典列表
// @Success 200 {object} app.Response
// @router / [get]
func (e *DictController) GetAll(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
	)
	enabled := com.StrTo(c.DefaultQuery("enabled","-1")).MustInt()
	name := c.DefaultQuery("blurry","")
	dictService := dict_service.Dict{
		Enabled: enabled,
		Name: name,
		PageSize: util.GetSize(c),
		PageNum: util.GetPage(c),
	}
	vo := dictService.GetAll()
	appG.Response(http.StatusOK,constant.SUCCESS,vo)
}

// @Title 添加字典
// @Description 添加字典
// @Success 200 {object} app.Response
// @router / [post]
func (e *DictController) Post(c *gin.Context)  {
	var (
		model models.SysDict
		appG = app.Gin{C: c}
	)
	httpCode, errCode := app.BindAndValid(c,&model)
	if errCode != constant.SUCCESS {
		appG.Response(httpCode,errCode,nil)
		return
	}
	dictService := dict_service.Dict{
		M: &model,
	}

	if err := dictService.Insert(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)
}

// @Title 修改字典
// @Description 修改字典
// @Success 200 {object} app.Response
// @router / [put]
func (e *DictController) Put(c *gin.Context)  {
	var (
		model models.SysDict
		appG = app.Gin{C: c}
	)
	httpCode, errCode := app.BindAndValid(c,&model)
	if errCode != constant.SUCCESS {
		appG.Response(httpCode,errCode,nil)
		return
	}
	dictService := dict_service.Dict{
		M: &model,
	}

	if err := dictService.Save(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)
}

// @Title 删除字典
// @Description 删除字典
// @Success 200 {object} app.Response
// @router /:id [delete]
func (e *DictController) Delete(c *gin.Context) {
	var (
		ids []int64
		appG = app.Gin{C: c}
	)
	id := com.StrTo(c.Param("id")).MustInt64()
	ids = append(ids, id)

	dictService := dict_service.Dict{Ids: ids}
	if err := dictService.Del(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)
}
