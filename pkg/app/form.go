package app

import (
	"encoding/json"
	"errors"
	"github.com/astaxie/beego/validation"
	"github.com/gin-gonic/gin"
	"net/http"
	"strings"
	"yixiang.co/go-mall/pkg/constant"
	"yixiang.co/go-mall/pkg/global"
	"yixiang.co/go-mall/pkg/logging"
)

// BindAndValid binds and validates data
func BindAndValid(c *gin.Context, form interface{}) (int, int) {
	err := c.Bind(form)
	if err != nil {
		global.YSHOP_LOG.Error(err)
		return http.StatusBadRequest, constant.INVALID_PARAMS
	}

	valid := validation.Validation{}
	check, err := valid.Valid(form)
	if err != nil {
		global.YSHOP_LOG.Error(err)
		return http.StatusInternalServerError, constant.ERROR
	}
	if !check {
		MarkErrors(valid.Errors)
		return http.StatusBadRequest, constant.INVALID_PARAMS
	}

	return http.StatusOK, constant.SUCCESS
}

func BindAndValidate(c *gin.Context, form interface{}) error {
	err := c.Bind(form)
	if err != nil {
		logging.Error(err)
		return err
	}

	valid := validation.Validation{}
	check, err := valid.Valid(form)
	if err != nil {
		logging.Error(err)
		return err
	}
	if !check {
		MarkErrors(valid.Errors)
		return buildFormErr(valid.Errors)
		//return http.StatusBadRequest, constant.INVALID_PARAMS
	}

	return nil
}

func buildFormErr(errs []*validation.Error) error {
	var msg strings.Builder
	for _, v := range errs {
		if v.Field != "" {
			msg.WriteString(v.Field)
		} else if v.Key != "" {
			msg.WriteString(v.Key)
		} else {
			msg.WriteString(v.Name)
		}

		msg.WriteString(" : ")
		if v.Value != nil {
			b, _ := json.Marshal(v.Value)
			msg.WriteString(string(b))
		}

		msg.WriteString(" => ")
		msg.WriteString(v.Error())
		//msg.WriteString(" should=> ")
		//bb,_ := json.Marshal(v.LimitValue)
		//msg.WriteString(string(bb))
	}
	return errors.New(msg.String())
}
