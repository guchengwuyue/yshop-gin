/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package admin

import (
	"github.com/gin-gonic/gin"
	"github.com/ttlv/kdniao"
	"github.com/ttlv/kdniao/sdk"
	"github.com/unknwon/com"
	"net/http"
	"yixiang.co/go-mall/app/models"
	"yixiang.co/go-mall/app/service/article_service"
	"yixiang.co/go-mall/app/service/order_service"
	"yixiang.co/go-mall/app/service/order_service/dto"
	"yixiang.co/go-mall/pkg/app"
	"yixiang.co/go-mall/pkg/constant"
	"yixiang.co/go-mall/pkg/global"
	"yixiang.co/go-mall/pkg/util"
)


// order api
type OrderController struct {
}


// @Title 订单列表
// @Description 订单列表
// @Success 200 {object} app.Response
// @router / [get]
func (e *OrderController) GetAll(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
	)
	enabled := com.StrTo(c.DefaultQuery("enabled","-1")).MustInt()
	name := c.DefaultQuery("blurry","")
	orderService := order_service.Order{
		Enabled: enabled,
		Name: name,
		PageSize: util.GetSize(c),
		PageNum: util.GetPage(c),
		IntType: com.StrTo(c.Query("orderStatus")).MustInt(),
	}
	vo := orderService.GetAll()
	appG.Response(http.StatusOK,constant.SUCCESS,vo)
}

// @Title 文章添加
// @Description 文章添加
// @Success 200 {object} app.Response
// @router / [post]
func (e *OrderController) Post(c *gin.Context)  {
	var (
		model models.YshopWechatArticle
		appG = app.Gin{C: c}
	)

	paramErr := app.BindAndValidate(c,&model)
	if paramErr != nil {
		appG.Response(http.StatusBadRequest,paramErr.Error(),nil)
		return
	}

	articleService := article_service.Article{
		M: &model,
	}

	if err := articleService.Insert(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)

}

// @Title 订单修改
// @Description 订单修改
// @Success 200 {object} app.Response
// @router / [put]
func (e *OrderController) Put(c *gin.Context)  {
	var (
		model models.YshopStoreOrder
		appG = app.Gin{C: c}
	)
	httpCode, errCode := app.BindAndValid(c,&model)
	if errCode != constant.SUCCESS {
		appG.Response(httpCode,errCode,nil)
		return
	}
	orderService := order_service.Order{
		M: &model,
	}

	if err := orderService.Save(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)
}


// @Title 订单发货
// @Description 订单发货
// @Success 200 {object} app.Response
// @router / [put]
func (e *OrderController) Deliver(c *gin.Context)  {
	var (
		model models.YshopStoreOrder
		appG = app.Gin{C: c}
	)
	httpCode, errCode := app.BindAndValid(c,&model)
	if errCode != constant.SUCCESS {
		appG.Response(httpCode,errCode,nil)
		return
	}
	orderService := order_service.Order{
		M: &model,
	}

	if err := orderService.Deliver(); err != nil {
		global.YSHOP_LOG.Error(err)
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)
}


// @Title 订单快递查询
// @Description 订单快递查询
// @Success 200 {object} app.Response
// @router / [post]
func (e *OrderController) DeliverQuery(c *gin.Context)  {
	var (
		model dto.Express
		appG = app.Gin{C: c}
	)
	httpCode, errCode := app.BindAndValid(c,&model)
	if errCode != constant.SUCCESS {
		appG.Response(httpCode,errCode,nil)
		return
	}

	config := kdniao.NewKdniaoConfig(global.YSHOP_CONFIG.Express.EBusinessId, global.YSHOP_CONFIG.Express.AppKey)
	logger := kdniao.NewKdniaoLogger()

	expressQuerySdk := sdk.NewExpressQuery(config, logger)
	req := expressQuerySdk.GetRequest(model.LogisticCode)
	resp, err := expressQuerySdk.GetResponse(req)

	if err != nil {
		global.YSHOP_LOG.Error(err)
	}
	//
	if  resp.Success == false {
		appG.Response(http.StatusInternalServerError,resp.Reason,nil)
		return
	}


	appG.Response(http.StatusOK,constant.SUCCESS,resp.Traces)
}



// @Title 订单删除
// @Description 订单删除
// @Success 200 {object} app.Response
// @router /:id [delete]
func (e *OrderController) Delete(c *gin.Context) {
	var (
		ids []int64
		appG = app.Gin{C: c}
	)
	id := com.StrTo(c.Param("id")).MustInt64()
	ids = append(ids, id)
	orderService := order_service.Order{Ids: ids}

	if err := orderService.Del(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)
}

