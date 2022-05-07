/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
*/
package front

import (
	"github.com/gin-gonic/gin"
	"net/http"
	"yixiang.co/go-mall/app/service/cate_service"
	"yixiang.co/go-mall/pkg/app"
	"yixiang.co/go-mall/pkg/constant"
)

// category api
type CategoryController struct {
}




// @Title 获取树形数据
// @Description 获取树形数据
// @Success 200 {object} app.Response
// @router /api/v1/category [get]
func (e *CategoryController) GetCateList(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
	)
	cateService := cate_service.Cate{Enabled: 1}
	vo := cateService.GetAll()
	appG.Response(http.StatusOK,constant.SUCCESS,vo)

}






