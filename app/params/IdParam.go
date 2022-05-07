/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package params

import (
	"github.com/astaxie/beego/validation"
)

type IdParam struct {
    Id    int64 `json:"id"`
}

func (p *IdParam) Valid(v *validation.Validation)  {
	if vv := v.Required(p.Id,"yshop-warning"); !vv.Ok {
		vv.Message("参数有误")
		return
	}
}

