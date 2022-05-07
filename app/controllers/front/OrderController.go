/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
*/
package front

import (
	"github.com/gin-gonic/gin"
	"github.com/go-pay/gopay/wechat"
	"github.com/unknwon/com"
	"net/http"
	"yixiang.co/go-mall/app/params"
	"yixiang.co/go-mall/app/service/order_service"
	orderDto "yixiang.co/go-mall/app/service/order_service/dto"
	"yixiang.co/go-mall/app/service/pay_service"
	"yixiang.co/go-mall/pkg/app"
	"yixiang.co/go-mall/pkg/constant"
	"yixiang.co/go-mall/pkg/global"
	"yixiang.co/go-mall/pkg/jwt"
	"yixiang.co/go-mall/pkg/util"
)

// Order api
type OrderController struct {
}






//@Title 订单确认
//@Description 订单确认
//@Success 200 {object} app.Response
//@router /api/v1/order/confirm [post]
func (e *OrderController) Confirm(c *gin.Context) {
	var (
		param params.ConfirmOrderParam
		appG = app.Gin{C: c}
	)
	paramErr:= app.BindAndValidate(c,&param)
	if paramErr != nil {
		appG.Response(http.StatusBadRequest,paramErr.Error(),nil)
		return
	}

	uid,_ := jwt.GetAppUserId(c)
	user,_:= jwt.GetAppDetailUser(c)
	orderService := order_service.Order {
		CartId: param.CartId,
		Uid: uid,
		User: user,
	}
	vo,err := orderService.ConfirmOrder()
	if err != nil {
		appG.Response(http.StatusInternalServerError,err.Error(),nil)
		return
	}
	appG.Response(http.StatusOK,constant.SUCCESS,vo)

}

//@Title 订单计算
//@Description 订单计算
//@Success 200 {object} app.Response
//@router /api/v1/order/computed/:key [post]
func (e *OrderController) Compute(c *gin.Context) {
	var (
		param params.ComputeOrderParam
		appG = app.Gin{C: c}
	)
	paramErr:= app.BindAndValidate(c,&param)
	if paramErr != nil {
		appG.Response(http.StatusBadRequest,paramErr.Error(),nil)
		return
	}

	uid,_ := jwt.GetAppUserId(c)
	//user,_:= jwt.GetAppDetailUser(c)
	orderService := order_service.Order {
		Uid: uid,
		ComputeParam: &param,
		Key: c.Param("key"),
	}
	checkMap,err := orderService.Check()
	if err != nil {
		appG.Response(http.StatusInternalServerError,err.Error(),nil)
		return
	}
	if checkMap != nil {
		appG.Response(http.StatusOK,checkMap["msg"],checkMap)
		return
	}
	vo,err := orderService.ComputeOrder()
	if err != nil {
		appG.Response(http.StatusInternalServerError,err.Error(),nil)
		return
	}
	appG.Response(http.StatusOK,constant.SUCCESS,gin.H{
		"result": vo,
		"status": "NONE",
	})

}


//@Title 订单创建
//@Description 订单创建
//@Success 200 {object} app.Response
//@router /api/v1/order/create/:key [post]
func (e *OrderController) Create(c *gin.Context) {
	var (
		param params.OrderParam
		appG = app.Gin{C: c}
	)
	paramErr:= app.BindAndValidate(c,&param)
	if paramErr != nil {
		appG.Response(http.StatusBadRequest,paramErr.Error(),nil)
		return
	}

	uid,_ := jwt.GetAppUserId(c)
	//user,_:= jwt.GetAppDetailUser(c)
	key := c.Param("key")
	orderService := order_service.Order {
		Uid: uid,
		OrderParam: &param,
		Key: key,
	}
	order,err := orderService.CreateOrder()
	if err != nil {
		appG.Response(http.StatusInternalServerError,err.Error(),nil)
		return
	}

	global.YSHOP_LOG.Info(order)
	orderExtendDto := &orderDto.OrderExtend{
		Key: key,
		OrderId: order.OrderId,
	}
	returnMap := gin.H{
		"status": "SUCCESS",
		"result": orderExtendDto,
		"createTune": order.CreateTime,
	}

	appG.Response(http.StatusOK,constant.SUCCESS,returnMap)

}


//@Title 订单支付
//@Description 订单支付
//@Success 200 {object} app.Response
//@router /api/v1/order/pay [post]
func (e *OrderController) Pay(c *gin.Context) {
	var (
		param params.PayParam
		appG = app.Gin{C: c}
	)
	paramErr:= app.BindAndValidate(c,&param)
	if paramErr != nil {
		appG.Response(http.StatusBadRequest,paramErr.Error(),nil)
		return
	}

	uid,_ := jwt.GetAppUserId(c)
	orderExtendDto := &orderDto.OrderExtend{
		//Key: key,
		OrderId: param.Uni,
	}
	returnMap := gin.H{
		"status": "SUCCESS",
		"result": orderExtendDto,
	}

	newMap,err := pay_service.GoPay(returnMap,param.Uni,param.PayType,param.From,uid,orderExtendDto)
	if err != nil {
		appG.Response(http.StatusInternalServerError,err.Error(),nil)
		return
	}
	appG.Response(http.StatusOK,constant.SUCCESS,newMap)

}

//@Title 订单移步支付
//@Description 订单移步支付
//@Success 200 {object} app.Response
//@router /api/v1/order/notify [any]
func (e *OrderController) NotifyPay(c *gin.Context) {

	notifyReq, err := wechat.ParseNotifyToBodyMap(c.Request)
	//支付成功后处理
	if err != nil {
		global.YSHOP_LOG.Error(err)
	}

	global.YSHOP_LOG.Info(notifyReq)

}




//@Title 订单详情
//@Description 订单详情
//@Success 200 {object} app.Response
//@router /api/v1/order/detail/:key [get]
func (e *OrderController) OrderDetail(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
	)

	uid,_ := jwt.GetAppUserId(c)
	//user,_:= jwt.GetAppDetailUser(c)
	key := c.Param("key")
	orderService := order_service.Order {
		Uid: uid,
		//OrderParam: &param,
		OrderId: key,
	}
	order,_ := orderService.GetOrderInfo()

	newOrder := order_service.HandleOrder(order)


	appG.Response(http.StatusOK,constant.SUCCESS,newOrder)

}

// @Title 获取列表数据
// @Description 获取列表数据
// @Success 200 {object} app.Response
// @router /api/v1/order [get]
func (e *OrderController) GetList(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
	)
	uid,_ := jwt.GetAppUserId(c)
	orderService := order_service.Order {
		IntType: com.StrTo(c.Query("type")).MustInt(),
		PageNum: util.GetFrontPage(c),
		PageSize: util.GetFrontLimit(c),
		Uid: uid,
	}

	vo,total,page := orderService.GetList()
	appG.ResponsePage(http.StatusOK,constant.SUCCESS,vo,total,page)
}

//@Title 订单收货
//@Description 订单收货
//@Success 200 {object} app.Response
//@router /api/v1/order/take [post]
func (e *OrderController) TakeOrder(c *gin.Context) {
	var (
		param params.DoOrderParam
		appG = app.Gin{C: c}
	)
	paramErr:= app.BindAndValidate(c,&param)
	if paramErr != nil {
		appG.Response(http.StatusBadRequest,paramErr.Error(),nil)
		return
	}

	uid,_ := jwt.GetAppUserId(c)
	orderService := order_service.Order{
		OrderId: param.Uni,
		Uid: uid,
	}


	if err := orderService.TakeOrder();err != nil {
		appG.Response(http.StatusInternalServerError,err.Error(),nil)
		return
	}
	appG.Response(http.StatusOK,constant.SUCCESS,"success")

}

// @Title 订单评价
// @Description 订单评价
// @Success 200 {object} app.Response
// @router /api/v1/order/comments/:key [post]
func (e *OrderController) OrderComment(c *gin.Context) {
	var (
		param []params.ProductReplyParam
		appG = app.Gin{C: c}
	)
	c.ShouldBindJSON(&param)

	uid,_ := jwt.GetAppUserId(c)
	orderService := order_service.Order{
		OrderId: c.Param("key"),
		Uid: uid,
		ReplyParam: param,
	}


	if err := orderService.OrderComment();err != nil {
		appG.Response(http.StatusInternalServerError,err.Error(),nil)
		return
	}
	appG.Response(http.StatusOK,constant.SUCCESS,"ok")

}


//@Title 未支付订单取消
//@Description 未支付订单取消
//@Success 200 {object} app.Response
//@router /api/v1/order/cancel [post]
func (e *OrderController) CancelOrder(c *gin.Context) {
	var (
		param params.HandleOrderParam
		appG = app.Gin{C: c}
	)
	paramErr:= app.BindAndValidate(c,&param)
	if paramErr != nil {
		appG.Response(http.StatusBadRequest,paramErr.Error(),nil)
		return
	}

	uid,_ := jwt.GetAppUserId(c)
	orderService := order_service.Order{
		OrderId: param.Id,
		Uid: uid,
	}


	if err := orderService.CancelOrder();err != nil {
		appG.Response(http.StatusInternalServerError,err.Error(),nil)
		return
	}
	appG.Response(http.StatusOK,constant.SUCCESS,"success")

}