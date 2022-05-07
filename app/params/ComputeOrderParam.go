/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package params

type ComputeOrderParam struct {
    AddressId    int64 `json:"addressId"`
	CouponId    int64 `json:"couponId"`
	PayType    int `json:"payType"`
	UseIntegral    int `json:"useIntegral"`
	ShippingType    int `json:"shippingType"`
	BargainId    int64 `json:"bargainId"`
	PinkId    int64 `json:"pinkId"`
	CombinationId    int64 `json:"combinationId"`
}


