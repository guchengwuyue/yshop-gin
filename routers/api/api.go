package api

import (
	"github.com/gin-gonic/gin"
	"yixiang.co/go-mall/app/controllers/front"
	"yixiang.co/go-mall/app/controllers/front/cart"
	"yixiang.co/go-mall/app/controllers/front/mall"
	"yixiang.co/go-mall/app/controllers/front/order"
	"yixiang.co/go-mall/app/controllers/front/product"
	"yixiang.co/go-mall/app/controllers/front/user"
	"yixiang.co/go-mall/app/controllers/front/wechat"
	"yixiang.co/go-mall/middleware"
)

func RegisterApiRouters(r *gin.Engine) {
	//用户端api-非auth
	ApiWechatController := wechat.WechatController{}
	ApiLoginController := new(front.LoginController)
	ApiIndexController := new(mall.IndexController)
	ApiCategoryControler := new(mall.CategoryController)
	ApiProductControler := new(product.ProductController)
	ApiAddressController := new(user.UserAddressController)
	ApiOrderController := new(order.OrderController)
	apiv1 := r.Group("/api/v1").Use(middleware.LimitIP("100-h"))
	{
		apiv1.Any("/serve", ApiWechatController.GetAll)
		apiv1.POST("/login", ApiLoginController.Login)
		apiv1.POST("/register", ApiLoginController.Reg)
		apiv1.POST("/register/verify", ApiLoginController.Verify)
		apiv1.GET("/getCanvas", ApiIndexController.GetCanvas)
		apiv1.GET("/category", ApiCategoryControler.GetCateList)
		apiv1.GET("/index", ApiIndexController.GetIndex)
		apiv1.GET("/products", ApiProductControler.GoodsList)
		apiv1.GET("/product/detail/:id", ApiProductControler.GoodDetail)
		apiv1.GET("/product/hot", ApiProductControler.GoodsRecommendList)
		apiv1.GET("/reply/list/:id", ApiProductControler.ReplyList)
		apiv1.GET("/city_list", ApiAddressController.GetCityList)
		apiv1.POST("/upload", ApiIndexController.Upload)
		apiv1.Any("/order/notify", ApiOrderController.NotifyPay)
	}
	//需要授权
	ApiUserController := new(user.UserController)
	ApiCartController := new(cart.CartController)
	//ApiOrderController := new(front.OrderController)
	authApiv1 := r.Group("/api/v1").Use(middleware.AppJwt())
	{
		authApiv1.GET("/userinfo", ApiUserController.GetUserInfo)
		authApiv1.POST("/collect/add", ApiProductControler.AddCollect)
		authApiv1.POST("/collect/del", ApiProductControler.DelCollect)
		authApiv1.POST("/cart/add", ApiCartController.AddCart)
		authApiv1.GET("/cart/count", ApiCartController.Count)
		authApiv1.GET("/carts", ApiCartController.CartList)
		authApiv1.POST("/cart/num", ApiCartController.CartNum)
		authApiv1.POST("/cart/del", ApiCartController.DelCart)
		authApiv1.POST("/address/edit", ApiAddressController.SaveAddress)
		authApiv1.GET("/address", ApiAddressController.GetList)
		authApiv1.POST("/address/default/set", ApiAddressController.SetDefault)
		authApiv1.POST("/address/del", ApiAddressController.Del)
		authApiv1.POST("/order/confirm", ApiOrderController.Confirm)
		authApiv1.POST("/order/computed/:key", ApiOrderController.Compute)
		authApiv1.POST("/order/create/:key", ApiOrderController.Create)
		authApiv1.POST("/order/pay", ApiOrderController.Pay)
		authApiv1.GET("/order/detail/:key", ApiOrderController.OrderDetail)
		authApiv1.GET("/order", ApiOrderController.GetList)
		authApiv1.POST("/order/take", ApiOrderController.TakeOrder)
		authApiv1.POST("/order/comments/:key", ApiOrderController.OrderComment)
		authApiv1.POST("/order/cancel", ApiOrderController.CancelOrder)
		authApiv1.GET("/collect/user", ApiUserController.CollectUser)
	}
}
