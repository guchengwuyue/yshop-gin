package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"log"
	"net/http"
	"yixiang.co/go-mall/app/models"
	"yixiang.co/go-mall/pkg/jwt"
	"yixiang.co/go-mall/pkg/logging"
	"yixiang.co/go-mall/pkg/redis"
	"yixiang.co/go-mall/pkg/setting"
	"yixiang.co/go-mall/routers"
)

func init() {
	setting.Setup()
	models.Setup()
	logging.Setup()
	redis.Setup()
	jwt.Setup()
}

// @title gin-shop  API
// @version 1.0
// @description gin-shop商城后台管理系统
// @termsOfService https://gitee.com/guchengwuyue/gin-shop
// @license.name apache2
func main() {
	gin.SetMode(setting.ServerSetting.RunMode)

	routersInit := routers.InitRouter()
	readTimeout := setting.ServerSetting.ReadTimeout
	writeTimeout := setting.ServerSetting.WriteTimeout
	endPoint := fmt.Sprintf(":%d", setting.ServerSetting.HttpPort)
	maxHeaderBytes := 1 << 20

	server := &http.Server{
		Addr:           endPoint,
		Handler:        routersInit,
		ReadTimeout:    readTimeout,
		WriteTimeout:   writeTimeout,
		MaxHeaderBytes: maxHeaderBytes,
	}

	log.Printf("[info] start http server listening %s", endPoint)

	server.ListenAndServe()

}
