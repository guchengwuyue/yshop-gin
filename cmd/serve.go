package cmd

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/spf13/cobra"
	"net/http"
	"time"
	"yixiang.co/go-mall/pkg/console"
	"yixiang.co/go-mall/pkg/global"
	"yixiang.co/go-mall/routers"
)

var CmdServe = &cobra.Command{
	Use:   "serve",
	Short: "start web server",
	Run:   runweb,
	Args:  cobra.NoArgs,
}

func runweb(cmd *cobra.Command, args []string) {
	gin.SetMode(global.YSHOP_CONFIG.Server.RunMode)

	routersInit := routers.InitRouter()
	endPoint := fmt.Sprintf(":%d", global.YSHOP_CONFIG.Server.HttpPort)
	maxHeaderBytes := 1 << 20

	server := &http.Server{
		Addr:           endPoint,
		Handler:        routersInit,
		ReadTimeout:    10 * time.Second,
		WriteTimeout:   10 * time.Second,
		MaxHeaderBytes: maxHeaderBytes,
	}

	global.YSHOP_LOG.Info("[info] start http server listening %s", endPoint)
	fmt.Printf("欢迎使用yshop-gin,官网地址：https://www.yixiang.co\n")

	err := server.ListenAndServe()
	if err != nil {
		global.YSHOP_LOG.Error(err.Error())
		console.Exit("start server error:" + err.Error())
	}
}
