package routers

import (
	"github.com/gin-gonic/gin"
	"github.com/swaggo/gin-swagger"
	"github.com/swaggo/gin-swagger/swaggerFiles"
	"net/http"
	"yixiang.co/go-mall/app/controllers/admin"
	"yixiang.co/go-mall/app/controllers/front"
	_ "yixiang.co/go-mall/docs"
	"yixiang.co/go-mall/middleware"
	"yixiang.co/go-mall/pkg/upload"
)

func InitRouter() *gin.Engine {
	r := gin.New()
	r.Use(gin.Logger())
	r.Use(gin.Recovery())
	r.Use(middleware.Cors())

	r.StaticFS("/upload/images", http.Dir(upload.GetImageFullPath()))

	loginController := admin.LoginController{}
	r.POST("/auth/login", loginController.Login)
	r.GET("/auth/captcha", loginController.Captcha)
	r.GET("/swagger/*any", ginSwagger.WrapHandler(swaggerFiles.Handler))
	menuController := admin.MenuController{}
	userController := admin.UserController{}
	deptController := admin.DeptController{}
	dictDetailController := admin.DictDetailController{}
	dictController := admin.DictController{}
	roleController := admin.RoleController{}
	jobController := admin.JobController{}
	logController := admin.LogController{}
	materialController := admin.MaterialController{}
	materialGroupController := admin.MaterialGroupController{}
	canvasController := admin.CanvasController{}
	adminRouter := r.Group("/admin")
	adminRouter.Use(middleware.Jwt()).Use(middleware.Log())

	{
		adminRouter.GET("/auth/info", loginController.Info)
		adminRouter.DELETE("/auth/logout", loginController.Logout)

		adminRouter.GET("/material", materialController.GetAll)
		adminRouter.POST("/material", materialController.Post)
		adminRouter.PUT("/material", materialController.Put)
		adminRouter.DELETE("/material/:id", materialController.Delete)
		adminRouter.POST("/material/upload", materialController.Upload)

		adminRouter.GET("/materialgroup", materialGroupController.GetAll)
		adminRouter.POST("/materialgroup", materialGroupController.Post)
		adminRouter.PUT("/materialgroup", materialGroupController.Put)
		adminRouter.DELETE("/materialgroup/:id", materialGroupController.Delete)

		adminRouter.GET("/user", userController.GetAll)
		adminRouter.POST("/user", userController.Post)
		adminRouter.PUT("/user", userController.Put)
		adminRouter.DELETE("/user", userController.Delete)
		adminRouter.PUT("/user/center", userController.Center)
		adminRouter.POST("/user/updatePass/", userController.Pass)
		adminRouter.POST("/user/updateAvatar", userController.Avatar)

		adminRouter.GET("/dept", deptController.GetAll)
		adminRouter.POST("/dept", deptController.Post)
		adminRouter.PUT("/dept", deptController.Put)
		adminRouter.DELETE("/dept", deptController.Delete)

		adminRouter.GET("/dict", dictController.GetAll)
		adminRouter.POST("/dict", dictController.Post)
		adminRouter.PUT("/dict", dictController.Put)
		adminRouter.DELETE("/dict/:id", dictController.Delete)

		adminRouter.GET("/dictDetail", dictDetailController.GetAll)
		adminRouter.POST("/dictDetail", dictDetailController.Post)
		adminRouter.PUT("/dictDetail", dictDetailController.Put)
		adminRouter.DELETE("/dictDetail/:id", dictDetailController.Delete)

		adminRouter.GET("/roles/:id", roleController.GetOne)
		adminRouter.GET("/roles", roleController.GetAll)
		adminRouter.POST("/roles", roleController.Post)
		adminRouter.PUT("/roles", roleController.Put)
		adminRouter.DELETE("/roles", roleController.Delete)
		adminRouter.PUT("/roles/menu", roleController.Menu)

		adminRouter.GET("/job", jobController.GetAll)
		adminRouter.POST("/job", jobController.Post)
		adminRouter.PUT("/job", jobController.Put)
		adminRouter.DELETE("/job", jobController.Delete)

		adminRouter.GET("/logs", logController.GetAll)
		adminRouter.DELETE("/logs", logController.Delete)

		adminRouter.GET("/menu/build", menuController.Build)
		adminRouter.GET("/menu/listtree", menuController.GetTree)
		adminRouter.GET("/menu", menuController.GetAll)
		adminRouter.POST("/menu", menuController.Post)
		adminRouter.PUT("/menu", menuController.Put)
		adminRouter.DELETE("/menu", menuController.Delete)

		adminRouter.GET("/canvas/getCanvas", canvasController.Get)
		adminRouter.POST("/canvas/saveCanvas", canvasController.Post)
	}

	cateController := admin.StoreCategoryController{}
	ruleController := admin.StoreProductRuleController{}
	productController := admin.StoreProductController{}
	orderController := admin.OrderController{}
	expressController := admin.ExpressController{}
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

	wechatMenuController := admin.WechatMenuController{}
	wechatUserController := admin.WechatUserController{}
	articleController := admin.ArticleController{}
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

	genController := admin.GenController{}
	cronCrontroller := admin.SysCronJobController{}
	toolsRouter := r.Group("/tools")
	toolsRouter.Use(middleware.Jwt()).Use(middleware.Log())
	{
		toolsRouter.GET("/gen/tables", genController.GetAllDBTables)
		toolsRouter.POST("/gen/import", genController.ImportTable)
		toolsRouter.GET("/gen/systables", genController.GetAllTables)
		toolsRouter.GET("/gen/config/:name", genController.GetTableInfo)
		toolsRouter.GET("/gen/preview/:name", genController.Preview)
		toolsRouter.GET("/gen/code/:name", genController.GenCode)
		toolsRouter.PUT("/gen/config", genController.ConfigPut)
		toolsRouter.GET("/gen/columns", genController.GetTableColumns)
		toolsRouter.PUT("/gen/columns", genController.ColumnsPut)
		toolsRouter.GET("/timing", cronCrontroller.GetAll)
		toolsRouter.POST("/timing", cronCrontroller.Post)
		toolsRouter.PUT("/timing", cronCrontroller.Put)
		toolsRouter.DELETE("/timing", cronCrontroller.Delete)
		toolsRouter.PUT("/timing/exec/:id", cronCrontroller.Exec)
		toolsRouter.PUT("/timing/stop/:id", cronCrontroller.Stop)
	}

	//用户端api-非auth
	ApiWechatController := front.WechatController{}
	ApiLoginController := new(front.LoginController)
	ApiIndexController := new(front.IndexController)
	ApiCategoryControler := new(front.CategoryController)
	ApiProductControler := new(front.ProductController)
	ApiAddressController := new(front.UserAddressController)
	ApiOrderController := new(front.OrderController)
	apiv1 := r.Group("/api/v1")
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
	ApiUserController := new(front.UserController)
	ApiCartController := new(front.CartController)
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

	return r
}
