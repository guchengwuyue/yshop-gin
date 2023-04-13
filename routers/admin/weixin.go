package admin

import (
	"github.com/gin-gonic/gin"
	"yixiang.co/go-mall/app/controllers/admin/weixin"
	"yixiang.co/go-mall/middleware"
)

func RegisterWeixinRouters(r *gin.Engine) {
	wechatMenuController := weixin.WechatMenuController{}
	wechatUserController := weixin.WechatUserController{}
	articleController := weixin.ArticleController{}
	wechatRouter := r.Group("/weixin")
	wechatRouter.Use(middleware.Jwt()).Use(middleware.Log())
	{
		wechatRouter.GET("/menu", wechatMenuController.GetAll)
		wechatRouter.POST("/menu", wechatMenuController.Post)

		wechatRouter.GET("/user", wechatUserController.GetAll)
		wechatRouter.PUT("/user", wechatUserController.Put)
		wechatRouter.POST("/user/money", wechatUserController.Money)

		wechatRouter.GET("/article", articleController.GetAll)
		wechatRouter.POST("/article", articleController.Post)
		wechatRouter.PUT("/article", articleController.Put)
		wechatRouter.DELETE("/article/:id", articleController.Delete)
		wechatRouter.GET("/article/info/:id", articleController.Get)
		wechatRouter.GET("/article/publish/:id", articleController.Pub)
	}
}
