/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package params

import (
	"github.com/astaxie/beego/validation"
)

type ConfirmOrderParam struct {
    CartId    string `json:"cartId"`
}

func (p *ConfirmOrderParam) Valid(v *validation.Validation)  {
	if vv := v.Required(p.CartId,"yshop-warning"); !vv.Ok {
		vv.Message("提交购买的商品")
		return
	}
}

