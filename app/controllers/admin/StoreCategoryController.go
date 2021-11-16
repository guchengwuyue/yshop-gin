package admin

import (
	"github.com/gin-gonic/gin"
	"github.com/unknwon/com"
	"net/http"
	"yixiang.co/go-mall/app/models"
	"yixiang.co/go-mall/app/service/cate_service"
	"yixiang.co/go-mall/pkg/app"
	"yixiang.co/go-mall/pkg/constant"
)

// 商品分类api
type StoreCategoryController struct {
}



// @Title 商品分类列表
// @Description 商品分类列表
// @Success 200 {object} app.Response
// @router / [get]
func (e *StoreCategoryController) GetAll(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
	)
	name := c.DefaultQuery("name","")
	enabled := com.StrTo(c.DefaultQuery("enabled","-1")).MustInt()
	cateService := cate_service.Cate{Name: name,Enabled: enabled}
	vo := cateService.GetAll()
	appG.Response(http.StatusOK,constant.SUCCESS,vo)
}

// @Title 添加商品分类
// @Description 添加商品分类
// @Success 200 {object} app.Response
// @router / [post]
func (e *StoreCategoryController) Post(c *gin.Context) {
	var (
		model models.YshopStoreCategory
		appG = app.Gin{C: c}
	)
	httpCode, errCode := app.BindAndValid(c,&model)
	if errCode != constant.SUCCESS {
		appG.Response(httpCode,errCode,nil)
		return
	}
	cateService := cate_service.Cate{
		M: &model,
	}

	if err := cateService.Insert(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)
}

// @Title 修改商品分类
// @Description 修改商品分类
// @Success 200 {object} app.Response
// @router / [put]
func (e *StoreCategoryController) Put(c *gin.Context) {
	var (
		model models.YshopStoreCategory
		appG = app.Gin{C: c}
	)
	httpCode, errCode := app.BindAndValid(c,&model)
	if errCode != constant.SUCCESS {
		appG.Response(httpCode,errCode,nil)
		return
	}
	cateService := cate_service.Cate{
		M: &model,
	}

	if err := cateService.Save(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)
}

// @Title 删除商品分类
// @Description 删除商品分类
// @Success 200 {object} app.Response
// @router / [delete]
func (e *StoreCategoryController) Delete(c *gin.Context) {
	var (
		ids []int64
		appG = app.Gin{C: c}
	)
	c.BindJSON(&ids)
	cateService := cate_service.Cate{Ids: ids}

	if err := cateService.Del(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)
}
