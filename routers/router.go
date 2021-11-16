package routers

import (
	"github.com/gin-gonic/gin"
	"github.com/swaggo/gin-swagger"
	"github.com/swaggo/gin-swagger/swaggerFiles"
	"net/http"
	"yixiang.co/go-mall/app/controllers/admin"
	_ "yixiang.co/go-mall/docs"
	"yixiang.co/go-mall/middleware"
	"yixiang.co/go-mall/pkg/upload"
)

func InitRouter() *gin.Engine {
	r := gin.New()
	r.Use(gin.Logger())
	r.Use(gin.Recovery())
	r.Use(middleware.Cors())


	r.StaticFS("/upload/images",http.Dir(upload.GetImageFullPath()))

	loginController := admin.LoginController{}
	r.POST("/auth/login",loginController.Login)
	r.GET("/auth/captcha",loginController.Captcha)
	r.GET("/swagger/*any",ginSwagger.WrapHandler(swaggerFiles.Handler))
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
	adminRouter := r.Group("/admin")
	adminRouter.Use(middleware.Jwt()).Use(middleware.Log())

	{
		adminRouter.GET("/auth/info",loginController.Info)
		adminRouter.DELETE("/auth/logout",loginController.Logout)

		adminRouter.GET("/material",materialController.GetAll)
		adminRouter.POST("/material",materialController.Post)
		adminRouter.PUT("/material",materialController.Put)
		adminRouter.DELETE("/material",materialController.Delete)
		adminRouter.POST("/material/upload",materialController.Upload)

		adminRouter.GET("/materialgroup",materialGroupController.GetAll)
		adminRouter.POST("/materialgroup",materialGroupController.Post)
		adminRouter.PUT("/materialgroup",materialGroupController.Put)
		adminRouter.DELETE("/materialgroup",materialGroupController.Delete)


		adminRouter.GET("/user",userController.GetAll)
		adminRouter.POST("/user",userController.Post)
		adminRouter.PUT("/user",userController.Put)
		adminRouter.DELETE("/user",userController.Delete)
		adminRouter.PUT("/user/center",userController.Center)
		adminRouter.POST("/user/updatePass/",userController.Pass)
		adminRouter.POST("/user/updateAvatar",userController.Avatar)

		adminRouter.GET("/dept",deptController.GetAll)
		adminRouter.POST("/dept",deptController.Post)
		adminRouter.PUT("/dept",deptController.Put)
		adminRouter.DELETE("/dept",deptController.Delete)

		adminRouter.GET("/dict",dictController.GetAll)
		adminRouter.POST("/dict",dictController.Post)
		adminRouter.PUT("/dict",dictController.Put)
		adminRouter.DELETE("/dict/:id",dictController.Delete)

		adminRouter.GET("/dictDetail",dictDetailController.GetAll)
		adminRouter.POST("/dictDetail",dictDetailController.Post)
		adminRouter.PUT("/dictDetail",dictDetailController.Put)
		adminRouter.DELETE("/dictDetail/:id",dictDetailController.Delete)

		adminRouter.GET("/roles/:id",roleController.GetOne)
		adminRouter.GET("/roles",roleController.GetAll)
		adminRouter.POST("/roles",roleController.Post)
		adminRouter.PUT("/roles",roleController.Put)
		adminRouter.DELETE("/roles",roleController.Delete)
		adminRouter.PUT("/roles/menu",roleController.Menu)

		adminRouter.GET("/job",jobController.GetAll)
		adminRouter.POST("/job",jobController.Post)
		adminRouter.PUT("/job",jobController.Put)
		adminRouter.DELETE("/job",jobController.Delete)

		adminRouter.GET("/logs",logController.GetAll)
		adminRouter.DELETE("/logs",logController.Delete)

		adminRouter.GET("/menu/build",menuController.Build)
		adminRouter.GET("/menu/listtree",menuController.GetTree)
		adminRouter.GET("/menu",menuController.GetAll)
		adminRouter.POST("/menu",menuController.Post)
		adminRouter.PUT("/menu",menuController.Put)
		adminRouter.DELETE("/menu",menuController.Delete)
	}

	cateController := admin.StoreCategoryController{}
	ruleController := admin.StoreProductRuleController{}
	productController := admin.StoreProductController{}
	shopRouter := r.Group("/shop")
	shopRouter.Use(middleware.Jwt()).Use(middleware.Log())
	{
		shopRouter.GET("/cate",cateController.GetAll)
		shopRouter.POST("/cate",cateController.Post)
		shopRouter.PUT("/cate",cateController.Put)
		shopRouter.DELETE("/cate",cateController.Delete)

		shopRouter.GET("/rule",ruleController.GetAll)
		shopRouter.POST("/rule/save/:id",ruleController.Post)
		shopRouter.DELETE("/rule",ruleController.Delete)

		shopRouter.GET("/product",productController.GetAll)
		shopRouter.GET("/product/info/:id",productController.GetInfo)
		shopRouter.POST("/product/isFormatAttr/:id",productController.FormatAttr)
		shopRouter.POST("/product/addOrSave",productController.Post)
		shopRouter.POST("/product/onsale/:id",productController.OnSale)
		shopRouter.DELETE("/product/:id",productController.Delete)
	}



	return r
}
