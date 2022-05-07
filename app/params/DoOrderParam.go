/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package params

import (
	"github.com/astaxie/beego/validation"
)

type DoOrderParam struct {
	Uni    string `json:"uni"`
}


func (p *DoOrderParam) Valid(v *validation.Validation)  {
	if vv := v.Required(p.Uni,"yshop-warning"); !vv.Ok {
		vv.Message("参数有误")
		return
	}
}


