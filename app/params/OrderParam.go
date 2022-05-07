/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package params

import (
	"github.com/astaxie/beego/validation"
)

type OrderParam struct {
	AddressId     int64 `json:"addressId"`
	From     string `json:"from"`
	Mark  string    `json:"mark"`
	Phone     string `json:"phone"`
	RealName        string `json:"realName"`
	CouponId     int64 `json:"couponId"`
	PayType     string `json:"payType"`
	UseIntegral     int `json:"useIntegral"`
	CombinationId    string `json:"combinationId"`
	PinkId     string `json:"pinkId"`
	SeckillId     string `json:"seckillId"`
	BargainId        string `json:"bargainId"`
	StoreId     string `json:"storeId"`
	ShippingType     int `json:"shippingType"`
}

func (p *OrderParam) Valid(v *validation.Validation)  {
	if vv := v.Required(p.AddressId,"yshop-warning"); !vv.Ok {
		vv.Message("请选择地址")
		return
	}
}

