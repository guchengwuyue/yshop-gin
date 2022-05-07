/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package params

import "github.com/astaxie/beego/validation"


type AfterSalesParan struct {
	OrderCode    string `json:"orderCode"`
	ServiceType     int `json:"serviceType"`
	ReasonForApplication  string    `json:"reasonForApplication"`
	ApplicationInstructions        string `json:"applicationInstructions"`
	ApplicationDescriptionPicture  string    `json:"applicationDescriptionPicture"`
	ProductParamList []ProductParam `json:"productParamList"`
}

type ProductParam struct {
	ProductId int64 `json:"productId"`
}

func (p *AfterSalesParan) Valid(v *validation.Validation)  {
	if vv := v.Required(p.OrderCode,"yshop-warning"); !vv.Ok {
		vv.Message("单号错误")
		return
	}
	if vv := v.Required(p.ServiceType,"yshop-warning"); !vv.Ok {
		vv.Message("请选择服务类型")
		return
	}
	if vv := v.Required(p.ProductParamList,"yshop-warning"); !vv.Ok {
		vv.Message("请选择要退货的商品")
		return
	}
}


