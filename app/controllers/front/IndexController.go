/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
*/
package front

import (
	"github.com/gin-gonic/gin"
	"github.com/unknwon/com"
	"net/http"
	"yixiang.co/go-mall/app/service/canvas_service"
	"yixiang.co/go-mall/app/service/product_service"
	"yixiang.co/go-mall/pkg/app"
	"yixiang.co/go-mall/pkg/constant"
	productEnum "yixiang.co/go-mall/pkg/enums/product"
	"yixiang.co/go-mall/pkg/logging"
	"yixiang.co/go-mall/pkg/upload"
)

// index api
type IndexController struct {
}

// @Title 获取首页数据
// @Description 获取首页数据
// @Success 200 {object} app.Response
// @router /api/v1/getCanvas [get]
func (e *IndexController) GetIndex(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
	)

	productService := product_service.Product {
		Enabled: 1,
		PageNum: 0,
		PageSize: 6,
		Order: productEnum.STATUS_1,
	}

	vo1,_,_ := productService.GetList()

	productService.PageSize = 10
	productService.Order = productEnum.STATUS_2
	vo2,_,_ := productService.GetList()

	productService.PageSize = 6
	productService.Order = productEnum.STATUS_3
	vo3,_,_ := productService.GetList()

	productService.PageSize = 10
	productService.Order = productEnum.STATUS_4
	vo4,_,_ := productService.GetList()
	res := gin.H{
		"bastList" :vo1,
		"likeInfo" :vo2,
		"firstList" :vo3,
		"benefit" :vo4,

	}
	appG.Response(http.StatusOK,constant.SUCCESS,res)

}


// @Title 获取画布数据
// @Description 获取画布数据
// @Success 200 {object} app.Response
// @router /api/v1/getCanvas [get]
func (e *IndexController) GetCanvas(c *gin.Context) {
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


// @Title 上传图像
// @Description 上传图像
// @Success 200 {object} app.Response
// @router /upload [post]
func (e *IndexController) Upload(c *gin.Context) {
	appG := app.Gin{C: c}
	file, image, err := c.Request.FormFile("file")
	if err != nil {
		logging.Warn(err)
		appG.Response(http.StatusInternalServerError, constant.ERROR, nil)
		return
	}

	if image == nil {
		appG.Response(http.StatusBadRequest, constant.INVALID_PARAMS, nil)
		return
	}

	imageName := upload.GetImageName(image.Filename)
	fullPath := upload.GetImageFullPath()
	//savePath := upload.GetImagePath()
	src := fullPath + imageName

	if !upload.CheckImageExt(imageName) || !upload.CheckImageSize(file) {
		appG.Response(http.StatusBadRequest, constant.ERROR_UPLOAD_CHECK_IMAGE_FORMAT, nil)
		return
	}

	err = upload.CheckImage(fullPath)
	if err != nil {
		logging.Warn(err)
		appG.Response(http.StatusInternalServerError, constant.ERROR_UPLOAD_CHECK_IMAGE_FAIL, nil)
		return
	}

	if err := c.SaveUploadedFile(image, src); err != nil {
		logging.Warn(err)
		appG.Response(http.StatusInternalServerError, constant.ERROR_UPLOAD_SAVE_IMAGE_FAIL, nil)
		return
	}

	imageUrl := upload.GetImageFullUrl(imageName)
	//imageSaveUrl := avePath + imageName

	appG.Response(http.StatusOK, constant.SUCCESS, imageUrl)

}





