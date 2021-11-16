package app

import (
	"github.com/gin-gonic/gin"
	"yixiang.co/go-mall/pkg/constant"
)

type Gin struct {
	C *gin.Context
}

type Response struct {
	Code int         `json:"status"`
	Msg  string      `json:"msg"`
	Data interface{} `json:"data"`
}

// Response setting gin.JSON
func (g *Gin) Response(httpCode int, errCode interface{}, data interface{}) {
	switch errCode.(type) {
		case int:
			intCode := errCode.(int)
			g.C.JSON(httpCode, Response{
				Code: intCode,
				Msg:  constant.GetMsg(intCode),
				Data: data,
			})
		case string:
			strCode := errCode.(string)
			g.C.JSON(httpCode, Response{
				Code: 9999,
				Msg:  strCode,
				Data: data,
			})
	}

	return
}

