package app

import (
	"github.com/astaxie/beego/validation"
	"yixiang.co/go-mall/pkg/global"
)

// MarkErrors logs error logs
func MarkErrors(errors []*validation.Error) {
	for _, err := range errors {
		global.YSHOP_LOG.Info(err.Key, err.Message)
	}

	return
}
