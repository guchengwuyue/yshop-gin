/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package params

import (
	"github.com/astaxie/beego/validation"
)

type CartNumParam struct {
    Id    int64 `json:"id"`
	Number  int    `json:"number"`

}

func (p *CartNumParam) Valid(v *validation.Validation)  {
	if vv := v.Range(p.Number,1,999,"购物车数量"); !vv.Ok {
		vv.Message("数量只能1-999之间")
		return
	}
	if vv := v.Required(p.Id,"yshop-warning"); !vv.Ok {
		vv.Message("参数有误")
		return
	}
}

