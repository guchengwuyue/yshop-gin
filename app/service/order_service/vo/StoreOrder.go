/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package vo

import (
	"time"
	cartVo "yixiang.co/go-mall/app/service/cart_service/vo"
	"yixiang.co/go-mall/app/service/order_service/dto"
)

type StoreOrder struct {
	Id int64  `json:"id"`
	OrderId     string `json:"orderId"`
	ExtendOrderId        string `json:"extendOrderId"`
	Uid    int64 `json:"uid"`
	RealName     string `json:"realName"`
	UserPhone  string    `json:"userPhone"`
	UserAddress     string `json:"userAddress"`
	CartId        string `json:"cartId"`
	CartInfo  []cartVo.Cart `json:"cartInfo" copier:"-"`
	StatusDto  dto.Status `json:"_status"`
	FreightPrice    float64 `json:"freightPrice"`
	TotalNum     int `json:"totalNum"`
	TotalPrice     float64 `json:"totalPrice"`
	TotalPostage        float64 `json:"totalPostage"`
	PayPrice    float64 `json:"payPrice"`
	PayPostage     float64 `json:"payPostage"`
	DeductionPrice  float64    `json:"deductionPrice"`
	CouponId     int64 `json:"couponId"`
	CouponPrice        float64 `json:"couponPrice"`
	Paid    int8 `json:"paid"`
	PayTime     time.Time `json:"payTime"`
	PayType     string `json:"payType"`
	Status        int8 `json:"status"`
	RefundStatus    int8 `json:"refundStatus"`
	RefundReasonWapImg     string `json:"refundReasonMapImg"`
	RefundReasonWapWxplain  string    `json:"refundReasonMapExplain"`
	RefundReasonTime     time.Time `json:"refundReasonTime"`
	RefundReasonWap        string `json:"refundReasonMap"`
	RefundReason    string `json:"refundReason"`
	RefundPrice     float64 `json:"refundPrice"`
	DeliverySn     string `json:"deliverySn"`
	DeliveryName        string `json:"deliveryName"`
	DeliveryType    string `json:"deliveryType"`
	DeliveryId     string `json:"deliveryId"`
	GainIntegral  int    `json:"gainIntegral"`
	UseIntegral     int `json:"useIntegral"`
	PayIntegral        int `json:"payIntegral"`
	BackIntegral    int `json:"backIntegral"`
	Mark     string `json:"mark"`
	Remark        string `json:"remark"`
	Cost  float64    `json:"cost"`
	ShippingType     int `json:"shipping_type"`
	PinkId     int64 `json:"pinkId"`
	CreateTime time.Time `json:"createTime"`
}


