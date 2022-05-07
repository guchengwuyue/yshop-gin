/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package params

import (
	"github.com/astaxie/beego/validation"
)

type ProductReplyParam struct {
	Comment    string `json:"comment"`
	Pics     string `json:"pics"`
	ProductScore  int    `json:"productScore"`
	ServiceScore        int `json:"serviceScore"`
	Unique    string `json:"unique"`
	ProductId    int64 `json:"productId"`

}

func (p *ProductReplyParam) Valid(v *validation.Validation)  {
	if vv := v.Required(p.Comment,"yshop-warning"); !vv.Ok {
		vv.Message("请填写评价内容")
		return
	}
}

