/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
*/
package front

import (
	"github.com/gin-gonic/gin"
	"net/http"
	"yixiang.co/go-mall/app/params"
	"yixiang.co/go-mall/app/service/cart_service"
	"yixiang.co/go-mall/pkg/app"
	"yixiang.co/go-mall/pkg/constant"
	"yixiang.co/go-mall/pkg/global"
	"yixiang.co/go-mall/pkg/jwt"
)

// product api
type CartController struct {
}

// @Title 购物车列表数据
// @Description 购物车列表数据
// @Success 200 {object} app.Response
// @router /api/v1/carts [get]
func (e *CartController) CartList(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
	)
	uid,_ := jwt.GetAppUserId(c)
	cartService := cart_service.Cart {
		Uid: uid,
	}
	vo := cartService.GetCartList()
	appG.Response(http.StatusOK,constant.SUCCESS,vo)

}

// @Title 获取数量
// @Description 获取数量
// @Success 200 {object} app.Response
// @router /api/v1/cart/count [get]
func (e *CartController) Count(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
	)
	uid,_ := jwt.GetAppUserId(c)
	cartService := cart_service.Cart {
		Uid: uid,
	}
	count := cartService.GetUserCartNum()

	appG.Response(http.StatusOK,constant.SUCCESS,gin.H{"count":count})

}


// @Title 添加购物车
// @Description 添加购物车
// @Success 200 {object} app.Response
// @router /api/v1/cart/add [post]
func (e *CartController) AddCart(c *gin.Context) {
	var (
		param params.CartParam
		appG = app.Gin{C: c}
	)
	paramErr:= app.BindAndValidate(c,&param)
	if paramErr != nil {
		appG.Response(http.StatusBadRequest,paramErr.Error(),nil)
		return
	}
	global.YSHOP_LOG.Info(param)
	uid,_ := jwt.GetAppUserId(c)
	cartService := cart_service.Cart {
		Param: &param,
		Uid: uid,
	}
	id,err := cartService.AddCart()
	if err != nil {
		appG.Response(http.StatusInternalServerError,err.Error(),nil)
		return
	}
	appG.Response(http.StatusOK,constant.SUCCESS,gin.H{"cartId": id})

}

// @Title 修改购物车数量
// @Description 修改购物车数量
// @Success 200 {object} app.Response
// @router /api/v1/cart/num [post]
func (e *CartController) CartNum(c *gin.Context) {
	var (
		param params.CartNumParam
		appG = app.Gin{C: c}
	)
	paramErr:= app.BindAndValidate(c,&param)
	if paramErr != nil {
		appG.Response(http.StatusBadRequest,paramErr.Error(),nil)
		return
	}
	uid,_ := jwt.GetAppUserId(c)
	cartService := cart_service.Cart {
		Uid: uid,
		NumParam: &param,
	}
	if err := cartService.ChangeCartNum();err != nil {
		appG.Response(http.StatusInternalServerError,err.Error(),nil)
		return
	}
	appG.Response(http.StatusOK,constant.SUCCESS,"success")

}

// @Title 取消收藏
// @Description 取消收藏
// @Success 200 {object} app.Response
// @router /api/v1/collect/del [post]
func (e *CartController) DelCart(c *gin.Context) {
	var (
		param params.CartIdsParam
		appG = app.Gin{C: c}
	)
	paramErr:= app.BindAndValidate(c,&param)
	if paramErr != nil {
		appG.Response(http.StatusBadRequest,paramErr.Error(),nil)
		return
	}

	uid,_ := jwt.GetAppUserId(c)
	cartService := cart_service.Cart {
		Uid: uid,
		IdsParam: &param,
	}
	if err := cartService.Del();err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}
	appG.Response(http.StatusOK,constant.SUCCESS,"success")

}





