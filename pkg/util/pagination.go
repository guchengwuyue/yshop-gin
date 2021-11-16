package util

import (
	"github.com/gin-gonic/gin"
	"github.com/unknwon/com"
	"yixiang.co/go-mall/pkg/setting"
)

func GetPage(c *gin.Context) int  {
	result := 0
	page, _ := com.StrTo(c.Query("page")).Int()

	page = page + 1

	if page > 0 {
		result = (page - 1) * setting.AppSetting.PageSize
	}

	return result
}

func GetSize(c *gin.Context) int  {
	result := 0
	size, _ := com.StrTo(c.Query("size")).Int()

	if size > 0 {
		result = size
	}else{
		result = setting.AppSetting.PageSize
	}

	return result
}