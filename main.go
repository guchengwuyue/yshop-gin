package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"log"
	"net/http"
	"time"
	"yixiang.co/go-mall/app/listen"
	"yixiang.co/go-mall/app/models"
	"yixiang.co/go-mall/pkg/base"
	"yixiang.co/go-mall/pkg/global"
	"yixiang.co/go-mall/pkg/jwt"
	"yixiang.co/go-mall/pkg/logging"
	"yixiang.co/go-mall/pkg/redis"
	"yixiang.co/go-mall/pkg/wechat"
	"yixiang.co/go-mall/routers"
)

func init() {
	global.YSHOP_VP = base.Viper()
	global.YSHOP_LOG = base.SetupLogger()
	models.Setup()
	logging.Setup()
	redis.Setup()
	jwt.Setup()
	listen.Setup()
	wechat.InitWechat()
}

// @title gin-shop  API
// @version 1.0
// @description gin-shop商城后台管理系统
// @termsOfService https://gitee.com/guchengwuyue/gin-shop
// @license.name apache2
func main() {
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


	global.YSHOP_LOG.Info("[info] start http server listening %s",endPoint)
	log.Printf("[info] start http server listening %s", endPoint)
	fmt.Printf("欢迎使用yshop-gin,官网地址：https://www.yixiang.co\n")


	server.ListenAndServe()

}
