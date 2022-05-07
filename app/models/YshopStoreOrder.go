/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package models

import (
	"time"
)

type YshopStoreOrder struct {
	OrderId     string `json:"orderId"`
	ExtendOrderId        string `json:"extend_order_id"`
	Uid    int64 `json:"uid"`
	RealName     string `json:"realName"`
	UserPhone  string    `json:"userPhone"`
	UserAddress     string `json:"userAddress"`
	CartId        string `json:"cartId"`
	FreightPrice    float64 `json:"freightPrice"`
	TotalNum     int `json:"totalNum"`
	TotalPrice     float64 `json:"totalPrice"`
	TotalPostage        float64 `json:"totalPostage"`
	PayPrice    float64 `json:"payPrice"`
	PayPostage     float64 `json:"payPostage"`
	DeductionPrice  float64    `json:"deductionPrice"`
	CouponId     int64 `json:"couponId"`
	CouponPrice        float64 `json:"couponPrice"`
	Paid    int `json:"paid"`
	PayTime     time.Time `json:"payTime"`
	PayType     string `json:"payType"`
	Status        int `json:"status"`
	RefundStatus    int `json:"refundStatus"`
	RefundReasonWapImg     string `json:"refundReasonWapImg"`
	RefundReasonWapExplain  string    `json:"refundReasonWapExplain"`
	RefundReasonTime     time.Time `json:"refundReasonTime"`
	RefundReasonWap        string `json:"refundReasonWap"`
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
	Unique     string `json:"unique"`
	Remark        string `json:"remark"`
	CombinationId    int64 `json:"combinationId"`
	PinkId     int64 `json:"pinkId"`
	Cost  float64    `json:"cost"`
	SeckillId     int64 `json:"seckillId"`
	BargainId        int64 `json:"bargainId"`
	VerifyCode    string `json:"verifyCode"`
	StoreId     int64 `json:"storeId"`
	ShippingType     int `json:"shippingType"`
	UserDto      *YshopUser   `json:"userDTO" gorm:"foreignKey:Uid;"`
	CartInfo  interface{} `json:"cartInfo" gorm:"-" copier:"-"`
	OrderStatus int `json:"_status" gorm:"-"`
	OrderStatusName string `json:"statusName" gorm:"-"`
	PayTypeName string `json:"payTypeName" gorm:"-"`
	BaseModel
}

func (YshopStoreOrder) TableName() string {
	return "yshop_store_order"
}


func GetAllOrder(pageNUm int,pageSize int,maps interface{}) (int64, []YshopStoreOrder) {
	var (
		total int64
		data      []YshopStoreOrder
	)

	db.Model(&YshopStoreOrder{}).Where(maps).Count(&total)
	db.Where(maps).Offset(pageNUm).Limit(pageSize).Order("id desc").Find(&data)


	return total, data
}

func GetAdminAllOrder(pageNUm int,pageSize int,maps interface{}) (int64, []YshopStoreOrder) {
	var (
		total int64
		data      []YshopStoreOrder
	)

	db.Model(&YshopStoreOrder{}).Where(maps).Count(&total)
	db.Where(maps).Offset(pageNUm).Limit(pageSize).Preload("UserDto").Order("id desc").Find(&data)


	return total, data
}



func AddStoreOrder(m *YshopStoreOrder) error {
	var err error
	if err = db.Create(m).Error; err != nil {
		return err
	}

	return err
}

func UpdateByStoreOrder(m *YshopStoreOrder) error {
	var err error
	err = db.Updates(m).Error
	if err != nil {
		return err
	}

	return err
}

func DelByStoreOrder(ids []int64) error {
	var err error
	err = db.Where("id in (?)", ids).Delete(&YshopStoreOrder{}).Error
	if err != nil {
		return err
	}

	return err
}

