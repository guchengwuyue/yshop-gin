package admin

import (
	"github.com/gin-gonic/gin"
	"yixiang.co/go-mall/app/controllers/admin/shop"
	"yixiang.co/go-mall/middleware"
)

func RegisterShopRouters(r *gin.Engine) {
	cateController := shop.StoreCategoryController{}
	ruleController := shop.StoreProductRuleController{}
	productController := shop.StoreProductController{}
	orderController := shop.OrderController{}
	expressController := shop.ExpressController{}
	shopRouter := r.Group("/shop")
	shopRouter.Use(middleware.Jwt()).Use(middleware.Log())
	{
		shopRouter.GET("/cate", cateController.GetAll)
		shopRouter.POST("/cate", cateController.Post)
		shopRouter.PUT("/cate", cateController.Put)
		shopRouter.DELETE("/cate", cateController.Delete)

		shopRouter.GET("/rule", ruleController.GetAll)
		shopRouter.POST("/rule/save/:id", ruleController.Post)
		shopRouter.DELETE("/rule", ruleController.Delete)

		shopRouter.GET("/product", productController.GetAll)
		shopRouter.GET("/product/info/:id", productController.GetInfo)
		shopRouter.POST("/product/isFormatAttr/:id", productController.FormatAttr)
		shopRouter.POST("/product/addOrSave", productController.Post)
		shopRouter.POST("/product/onsale/:id", productController.OnSale)
		shopRouter.DELETE("/product/:id", productController.Delete)

		shopRouter.GET("/order", orderController.GetAll)
		shopRouter.POST("/order/save/:id", orderController.Post)
		shopRouter.DELETE("/order/:id", orderController.Delete)
		shopRouter.POST("/order/remark", orderController.Put)
		shopRouter.PUT("/order", orderController.Deliver)
		shopRouter.POST("/order/express", orderController.DeliverQuery)

		shopRouter.GET("/express", expressController.GetAll)
		shopRouter.POST("/express", expressController.Post)
		shopRouter.PUT("/express", expressController.Put)
		shopRouter.DELETE("/express/:id", expressController.Delete)
	}
}
