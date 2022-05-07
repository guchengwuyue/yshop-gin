package admin

import (
	"github.com/gin-gonic/gin"
	"github.com/unknwon/com"
	"net/http"
	"yixiang.co/go-mall/app/service/product_service"
	dto2 "yixiang.co/go-mall/app/service/product_service/dto"
	"yixiang.co/go-mall/pkg/app"
	"yixiang.co/go-mall/pkg/constant"
	"yixiang.co/go-mall/pkg/util"
)

// 商品 api
type StoreProductController struct {
}



// @Title 商品列表
// @Description 商品列表
// @Success 200 {object} app.Response
// @router / [get]
func (e *StoreProductController) GetAll(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
	)
	enabled := com.StrTo(c.DefaultQuery("isShow","-1")).MustInt()
	name := c.DefaultQuery("blurry","")
	productService := product_service.Product{
		Enabled: enabled,
		Name: name,
		PageSize: util.GetSize(c),
		PageNum: util.GetPage(c),
	}
	vo := productService.GetAll()
	appG.Response(http.StatusOK,constant.SUCCESS,vo)
}

// @Title 获取商品信息
// @Description 获取商品信息
// @Success 200 {object} app.Response
// @router /info/:id [get]
func (e *StoreProductController) GetInfo(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
	)
	id := com.StrTo(c.Param("id")).MustInt64()
	productService := product_service.Product{
		Id: id,
	}
	vo := productService.GetProductInfo()
	appG.Response(http.StatusOK,constant.SUCCESS,vo)
}

// @Title 商品添加
// @Description 商品添加
// @Success 200 {object} app.Response
// @router /addOrSave [post]
func (e *StoreProductController) Post(c *gin.Context) {
	var (
		dto  dto2.StoreProduct
		appG = app.Gin{C: c}
	)
	httpCode, errCode := app.BindAndValid(c,&dto)
	if errCode != constant.SUCCESS {
		appG.Response(httpCode,errCode,nil)
		return
	}
	productService := product_service.Product{
		Dto: dto,
	}

	if err := productService.AddOrSaveProduct(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)

}

// @Title 商品上下架
// @Description 商品上下架
// @Success 200 {object} app.Response
// @router /onsale/:id [post]
func (e *StoreProductController) OnSale(c *gin.Context) {
	var (
		dto  dto2.OnSale
		appG = app.Gin{C: c}
	)
	id := com.StrTo(c.Param("id")).MustInt64()
	productService := product_service.Product{
		SaleDto: dto,
		Id: id,
	}

	if err := productService.OnSaleByProduct(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)

}

// @Title 商品删除
// @Description 商品删除
// @Success 200 {object} app.Response
// @router /:id [delete]
func (e *StoreProductController) Delete(c *gin.Context) {
	var (
		ids []int64
		appG = app.Gin{C: c}
	)
	id := com.StrTo(c.Param("id")).MustInt64()
	ids = append(ids, id)

	productService := product_service.Product{Ids: ids}
	if err := productService.Del(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)
}


// @Title 商品sku生成
// @Description 商品sku生成
// @Success 200 {object} app.Response
// @router /isFormatAttr/:id [post]
func (e *StoreProductController) FormatAttr(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
		jsonObj map[string]interface{}
	)
	id := com.StrTo(c.Param("id")).MustInt64()
	c.BindJSON(&jsonObj)
	productService := product_service.Product{
		Id: id,
		JsonObj: jsonObj,
	}
	vo := productService.PublicFormatAttr()
	appG.Response(http.StatusOK,constant.SUCCESS,vo)
}
