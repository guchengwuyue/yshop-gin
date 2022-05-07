/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package models


type YshopStoreOrderCartInfo struct {
	Id     int64 `gorm:"primary_key" json:"id"`
	Oid        int64 `json:"oid"`
	OrderId    string `json:"order_id"`
	CartId     int64 `json:"cart_id"`
	ProductId  int64    `json:"product_id"`
	CartInfo     string `json:"cart_info"`
	Unique        string `json:"unique"`
	IsAfterSales    int8 `json:"is_after_sales"`
}

func (YshopStoreOrderCartInfo) TableName() string {
	return "yshop_store_order_cart_info"
}



func AddStoreOrderCartInfo(m *YshopStoreOrderCartInfo) error {
	var err error
	if err = db.Create(m).Error; err != nil {
		return err
	}

	return err
}

func UpdateByStoreOrderCartInfo(m *YshopStoreOrderCartInfo) error {
	var err error
	err = db.Save(m).Error
	if err != nil {
		return err
	}

	return err
}

func DelByStoreOrderCartInfo(ids []int64) error {
	var err error
	err = db.Where("id in (?)", ids).Delete(&YshopStoreOrderCartInfo{}).Error
	if err != nil {
		return err
	}

	return err
}
