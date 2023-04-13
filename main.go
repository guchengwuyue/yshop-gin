package main

import (
	"fmt"
	"github.com/spf13/cobra"
	"os"
	"yixiang.co/go-mall/app/listen"
	"yixiang.co/go-mall/app/models"
	"yixiang.co/go-mall/cmd"
	"yixiang.co/go-mall/pkg/config"
	"yixiang.co/go-mall/pkg/console"
	"yixiang.co/go-mall/pkg/global"
	"yixiang.co/go-mall/pkg/jwt"
	"yixiang.co/go-mall/pkg/logging"
	"yixiang.co/go-mall/pkg/redis"
	"yixiang.co/go-mall/pkg/wechat"
)

func init() {
	global.YSHOP_VP = config.Viper()
	global.YSHOP_LOG = logging.SetupLogger()
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
	var rootCmd = &cobra.Command{
		Use:   "yshop=gin",
		Short: "gin商城系统r",
		Long:  "will run serve command",

		PersistentPreRun: func(cmd *cobra.Command, args []string) {

		},
	}

	rootCmd.AddCommand(cmd.CmdServe)

	// 配置默认运行 Web 服务
	cmd.RegisterDefaultCmd(rootCmd, cmd.CmdServe)

	// 注册全局参数，--env
	cmd.RegisterGlobalFlags(rootCmd)

	// 执行主命令
	if err := rootCmd.Execute(); err != nil {
		console.Exit(fmt.Sprintf("Failed to run app with %v: %s", os.Args, err.Error()))
	}

}
