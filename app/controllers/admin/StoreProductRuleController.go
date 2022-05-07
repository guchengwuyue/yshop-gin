package admin

import (
	"github.com/gin-gonic/gin"
	"github.com/unknwon/com"
	"net/http"
	"yixiang.co/go-mall/app/service/product_rule_service"
	dto2 "yixiang.co/go-mall/app/service/product_service/dto"
	"yixiang.co/go-mall/pkg/app"
	"yixiang.co/go-mall/pkg/constant"
	"yixiang.co/go-mall/pkg/util"
)

//
// 商品规格sku api
type StoreProductRuleController struct {
}


// @Title 商品规格sku列表
// @Description 商品规格sku列表
// @Success 200 {object} app.Response
// @router / [get]
func (e *StoreProductRuleController) GetAll(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
	)
	enabled := com.StrTo(c.DefaultQuery("enabled","-1")).MustInt()
	name := c.DefaultQuery("blurry","")
	ruleService := product_rule_service.Rule{
		Enabled: enabled,
		Name: name,
		PageSize: util.GetSize(c),
		PageNum: util.GetPage(c),
	}
	vo := ruleService.GetAll()
	appG.Response(http.StatusOK,constant.SUCCESS,vo)
}

// @Title 商品规格sku添加
// @Description 商品规格sku添加
// @Success 200 {object} app.Response
// @router /save/:id [post]
func (e *StoreProductRuleController) Post(c *gin.Context) {
	var (
		dto  dto2.ProductRule
		appG = app.Gin{C: c}
	)
	id := com.StrTo(c.Param("id")).MustInt64()
	httpCode, errCode := app.BindAndValid(c,&dto)
	if errCode != constant.SUCCESS {
		appG.Response(httpCode,errCode,nil)
		return
	}
	ruleService := product_rule_service.Rule{
		Dto: dto,
		Id: id,
	}

	if err := ruleService.AddOrSave(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)

}

// @Title 商品规格sku删除
// @Description 商品规格sku删除
// @Success 200 {object} app.Response
// @router / [delete]
func (e *StoreProductRuleController) Delete(c *gin.Context) {
	var (
		ids []int64
		appG = app.Gin{C: c}
	)
	c.BindJSON(&ids)
	ruleService := product_rule_service.Rule{Ids: ids}

	if err := ruleService.Del(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)
}
