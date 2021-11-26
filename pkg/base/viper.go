package base

import (
	"flag"
	"fmt"
	"github.com/fsnotify/fsnotify"
	"github.com/spf13/viper"
	"log"
	"yixiang.co/go-mall/pkg/global"
)

func Viper(path ...string) *viper.Viper {
	var config string
	if len(path) == 0 {
		flag.StringVar(&config,"c","","config file")
		flag.Parse()
		if config == "" {
			config = "config.yaml"
			fmt.Printf("使用默认值，config的路径为%v\n",config)
		}else {
			fmt.Printf("使用-c传递的值，config的路径为%v\n",config)
		}
	}else {
		config = path[0]
		fmt.Printf("使用传递单值，config的路径为%v\n",config)
	}

	v := viper.New()
	v.SetConfigFile(config)
	v.SetConfigType("yaml")
	err := v.ReadInConfig()
	if err != nil {
		panic(err)
	}
	v.WatchConfig()

	v.OnConfigChange(func(in fsnotify.Event) {
		fmt.Println("config file changed:",in.Name)
		if err := v.Unmarshal(&global.YSHOP_CONFIG); err != nil{
			fmt.Println(err)
		}
	})

	if err := v.Unmarshal(&global.YSHOP_CONFIG); err != nil{
		log.Printf("[err] err %s", err)
		fmt.Println(err)
	}
	log.Print(global.YSHOP_CONFIG)

	return v
}
