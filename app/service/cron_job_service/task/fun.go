package task

import (
	"encoding/json"
	"fmt"
	"yixiang.co/go-mall/app/models"
	"yixiang.co/go-mall/pkg/constant"
	"yixiang.co/go-mall/pkg/global"
	"yixiang.co/go-mall/pkg/redis"
)

// 这里添加自定义任务
func init() {
	AddTask("TestCronFun", TestCronFun)
	AddTask("TestCronFun2", TestCronFun2)

}

// 无参数测试
func TestCronFun() {
	fmt.Println("无参测试")
}

type taskDemo struct {
	Name string `json:"name"`
	Age  int64  `json:"age"`
}

// 有参的测试
func TestCronFun2() {
	cache := GetCacheParam("TestCronFun2")
	if cache == "" {
		fmt.Println("参数没有添加")
	} else {
		t := new(taskDemo)
		fmt.Println(cache)
		err := json.Unmarshal([]byte(cache), t)
		if err != nil {
			fmt.Println("参数有误")
		}
		fmt.Print("有参数测试：")
		fmt.Println(t)
	}

}

// 缓存
func GetCacheParam(str string) string {
	var job models.SysCronJob
	key := constant.CRON_KEY + str
	res := redis.GetString(key)
	if res == "" {
		global.YSHOP_DB.Where("invoke_target= ?", str).First(&job)
		redis.SetString(key, job.JobParams, 0)

		res = job.JobParams
	}

	return res

}
