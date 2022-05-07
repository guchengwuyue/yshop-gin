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
	"yixiang.co/go-mall/app/service/canvas_service"
	"yixiang.co/go-mall/pkg/app"
	"yixiang.co/go-mall/pkg/constant"
)


// 画布api
type CanvasController struct {
}

// @Title 画布
// @Description 画布
// @Success 200 {object} app.Response
// @router / [get]
func (e *CanvasController) Get(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
	)
	terminal := com.StrTo(c.DefaultQuery("terminal","3")).MustInt()
	canvasService := canvas_service.Canvas {
		Terminal: terminal,
	}
	vo := canvasService.Get()
	appG.Response(http.StatusOK,constant.SUCCESS,vo)
}



// @Title 画布添加/修改
// @Description 画布添加/修改
// @Success 200 {object} app.Response
// @router / [post]
func (e *CanvasController) Post(c *gin.Context)  {
	var (
		model models.YshopStoreCanvas
		appG = app.Gin{C: c}
	)
	paramErr := app.BindAndValidate(c,&model)
	if paramErr != nil {
		appG.Response(http.StatusBadRequest,paramErr.Error(),nil)
		return
	}

	canvasService := canvas_service.Canvas{
		M: &model,
	}

	if err := canvasService.Save(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)

}



