package admin

import (
	"github.com/gin-gonic/gin"
	"yixiang.co/go-mall/app/controllers/admin/tools"
	"yixiang.co/go-mall/middleware"
)

func RegisterToolsRouters(r *gin.Engine) {

	genController := tools.GenController{}
	cronCrontroller := tools.SysCronJobController{}
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
}
