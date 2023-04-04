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
	"yixiang.co/go-mall/app/params/admin"
	"yixiang.co/go-mall/app/service/gen_service"
	"yixiang.co/go-mall/pkg/app"
	"yixiang.co/go-mall/pkg/constant"
	"yixiang.co/go-mall/pkg/util"
)

// 代码生成器api
type GenController struct {
}

// @Title 获取所有表
// @Description 获取所有表
// @Success 200 {object} app.Response
// @router /tools/gen/tables [get]
func (e *GenController) GetAllDBTables(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
	)
	enabled := com.StrTo(c.DefaultQuery("enabled", "-1")).MustInt()
	name := c.DefaultQuery("blurry", "")
	genService := gen_service.Gen{
		Enabled:  enabled,
		Name:     name,
		PageSize: util.GetSize(c),
		PageNum:  util.GetPage(c),
	}
	vo := genService.GetDBTablesAll()
	appG.Response(http.StatusOK, constant.SUCCESS, vo)
}

// @Title 导入数据库表
// @Description 导入数据库表
// @Success 200 {object} app.Response
// @router /tools/gen/import [post]
func (e *GenController) ImportTable(c *gin.Context) {
	var (
		param admin.GenTableParan
		appG  = app.Gin{C: c}
	)
	httpCode, errCode := app.BindAndValid(c, &param)
	if errCode != constant.SUCCESS {
		appG.Response(httpCode, errCode, nil)
		return
	}
	genService := gen_service.Gen{
		GenTableParan: &param,
	}

	if err := genService.Insert(); err != nil {
		appG.Response(http.StatusInternalServerError, constant.FAIL_ADD_DATA, nil)
		return
	}

	appG.Response(http.StatusOK, constant.SUCCESS, nil)

}

// @Title 获取已经导入的表
// @Description 获取已经导入的表
// @Success 200 {object} app.Response
// @router /tools/gen/systables [get]
func (e *GenController) GetAllTables(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
	)
	enabled := com.StrTo(c.DefaultQuery("enabled", "-1")).MustInt()
	name := c.DefaultQuery("blurry", "")
	genService := gen_service.Gen{
		Enabled:  enabled,
		Name:     name,
		PageSize: util.GetSize(c),
		PageNum:  util.GetPage(c),
	}
	vo := genService.GetTablesAll()
	appG.Response(http.StatusOK, constant.SUCCESS, vo)
}

// @Title 获取表的信息
// @Description 获取表的信息
// @Success 200 {object} app.Response
// @router /tools/gen/config/:name[get]
func (e *GenController) GetTableInfo(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
	)
	name := c.Param("name")
	genService := gen_service.Gen{
		Name: name,
	}
	vo := genService.GetTableInfo()
	appG.Response(http.StatusOK, constant.SUCCESS, vo)
}

// @Title 获取表的列信息
// @Description 获取表的列信息
// @Success 200 {object} app.Response
// @router /tools/gen/columns[get]
func (e *GenController) GetTableColumns(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
	)
	name := c.DefaultQuery("tableName", "")
	genService := gen_service.Gen{
		Name: name,
	}
	vo := genService.GetTableColumns()
	appG.Response(http.StatusOK, constant.SUCCESS, vo)
}

// @Title 保存配置
// @Description 保存配置
// @Success 200 {object} app.Response
// @router /gen/config [put]
func (e *GenController) ConfigPut(c *gin.Context) {
	var (
		model models.SysTables
		appG  = app.Gin{C: c}
	)
	httpCode, errCode := app.BindAndValid(c, &model)
	if errCode != constant.SUCCESS {
		appG.Response(httpCode, errCode, nil)
		return
	}
	genService := gen_service.Gen{
		Table: &model,
	}

	if err := genService.TableSave(); err != nil {
		appG.Response(http.StatusInternalServerError, constant.FAIL_ADD_DATA, nil)
		return
	}

	appG.Response(http.StatusOK, constant.SUCCESS, nil)
}

// @Title 保存列配置
// @Description 保存列配置
// @Success 200 {object} app.Response
// @router /gen/columns [put]
func (e *GenController) ColumnsPut(c *gin.Context) {
	var (
		model []models.SysColumns
		appG  = app.Gin{C: c}
	)
	if err := c.ShouldBindJSON(&model); err != nil {
		appG.Response(http.StatusInternalServerError, constant.FAIL_ADD_DATA, nil)
		return
	}

	genService := gen_service.Gen{
		Columns: model,
	}

	if err := genService.ColumnSave(); err != nil {
		appG.Response(http.StatusInternalServerError, constant.FAIL_ADD_DATA, nil)
		return
	}

	appG.Response(http.StatusOK, constant.SUCCESS, nil)
}

// @Title 代码预览
// @Description 代码预览
// @Success 200 {object} app.Response
// @router /tools/gen/preview [get]
func (e *GenController) Preview(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
	)
	name := c.Param("name")
	genService := gen_service.Gen{
		Name: name,
	}
	vo := genService.Preview()
	appG.Response(http.StatusOK, constant.SUCCESS, vo)
}

// @Title 代码生产
// @Description 代码生产
// @Success 200 {object} app.Response
// @router /tools/gen/code [get]
func (e *GenController) GenCode(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
	)
	name := c.Param("name")
	genService := gen_service.Gen{
		Name: name,
	}
	genService.GenCode()
	appG.Response(http.StatusOK, "代码已经成功生成在根目录template下", nil)
}
