package app

import (
	"github.com/astaxie/beego/validation"
	"yixiang.co/go-mall/pkg/logging"
)

// MarkErrors logs error logs
func MarkErrors(errors []*validation.Error) {
	for _, err := range errors {
		logging.Info(err.Key, err.Message)
	}

	return
}