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
	"yixiang.co/go-mall/app/service/express_service"
	"yixiang.co/go-mall/pkg/app"
	"yixiang.co/go-mall/pkg/constant"
	"yixiang.co/go-mall/pkg/util"
)


// 快递api
type ExpressController struct {
}


// @Title 快递列表
// @Description 快递列表
// @Success 200 {object} app.Response
// @router / [get]
func (e *ExpressController) GetAll(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
	)
	enabled := com.StrTo(c.DefaultQuery("enabled","-1")).MustInt()
	name := c.DefaultQuery("blurry","")
	expressService := express_service.Express{
		Enabled: enabled,
		Name: name,
		PageSize: util.GetSize(c),
		PageNum: util.GetPage(c),
	}
	vo := expressService.GetAll()
	appG.Response(http.StatusOK,constant.SUCCESS,vo)
}

// @Title 快递添加
// @Description 快递添加
// @Success 200 {object} app.Response
// @router / [post]
func (e *ExpressController) Post(c *gin.Context)  {
	var (
		model models.YshopExpress
		appG = app.Gin{C: c}
	)

	paramErr := app.BindAndValidate(c,&model)
	if paramErr != nil {
		appG.Response(http.StatusBadRequest,paramErr.Error(),nil)
		return
	}

	expressService := express_service.Express{
		M: &model,
	}

	if err := expressService.Insert(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)

}

// @Title 快递修改
// @Description 快递修改
// @Success 200 {object} app.Response
// @router / [put]
func (e *ExpressController) Put(c *gin.Context)  {
	var (
		model models.YshopExpress
		appG = app.Gin{C: c}
	)
	httpCode, errCode := app.BindAndValid(c,&model)
	if errCode != constant.SUCCESS {
		appG.Response(httpCode,errCode,nil)
		return
	}
	expressService := express_service.Express{
		M: &model,
	}

	if err := expressService.Save(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)
}

// @Title 快递删除
// @Description 快递删除
// @Success 200 {object} app.Response
// @router /:id [delete]
func (e *ExpressController) Delete(c *gin.Context) {
	var (
		ids []int64
		appG = app.Gin{C: c}
	)
	id := com.StrTo(c.Param("id")).MustInt64()
	ids = append(ids, id)
	expressService := express_service.Express{Ids: ids}

	if err := expressService.Del(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)
}

