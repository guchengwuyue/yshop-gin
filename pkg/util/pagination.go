package util

import (
	"github.com/gin-gonic/gin"
	"github.com/unknwon/com"
	"yixiang.co/go-mall/pkg/global"
)

func GetPage(c *gin.Context) int  {
	result := 0
	page, _ := com.StrTo(c.Query("page")).Int()

	page = page + 1

	if page > 0 {
		result = (page - 1) * global.YSHOP_CONFIG.App.PageSize
	}

	return result
}

func GetSize(c *gin.Context) int  {
	result := 0
	size, _ := com.StrTo(c.Query("size")).Int()

	if size > 0 {
		result = size
	}else{
		result = global.YSHOP_CONFIG.App.PageSize
	}

	return result
}

func GetFrontPage(c *gin.Context) int  {
	result := 0
	page, _ := com.StrTo(c.Query("page")).Int()

	//page = page + 1

	if page > 0 {
		result = (page - 1) * global.YSHOP_CONFIG.App.PageSize
	}

	return result
}

func GetFrontLimit(c *gin.Context) int  {
	result := 0
	size, _ := com.StrTo(c.Query("limit")).Int()

	if size > 0 {
		result = size
	}else{
		result = global.YSHOP_CONFIG.App.PageSize
	}

	return result
}