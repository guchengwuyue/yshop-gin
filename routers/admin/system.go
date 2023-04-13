package admin

import (
	"github.com/gin-gonic/gin"
	"yixiang.co/go-mall/app/controllers/admin"
	"yixiang.co/go-mall/app/controllers/admin/shop"
	"yixiang.co/go-mall/app/controllers/admin/system"
	"yixiang.co/go-mall/middleware"
)

func RegisterSystemRouters(r *gin.Engine) {
	loginController := admin.LoginController{}
	r.POST("/auth/login", loginController.Login)
	r.GET("/auth/captcha", loginController.Captcha)

	menuController := system.MenuController{}
	userController := system.UserController{}
	deptController := system.DeptController{}
	dictDetailController := system.DictDetailController{}
	dictController := system.DictController{}
	roleController := system.RoleController{}
	jobController := system.JobController{}
	logController := system.LogController{}
	materialController := system.MaterialController{}
	materialGroupController := system.MaterialGroupController{}
	canvasController := shop.CanvasController{}

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

}
