/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package models

import (
	"gorm.io/gorm"
	"time"
)


type YshopStoreOrderStatus struct {
	Id     int64 `gorm:"primary_key" json:"id"`
	Oid        int64 `json:"oid"`
	ChangeType    string `json:"change_type"`
	ChangeMessage     string `json:"change_message"`
	ChangeTime  time.Time    `json:"change_time" gorm:"autoCreateTime"`
}

func (YshopStoreOrderStatus) TableName() string {
	return "yshop_store_order_status"
}



func AddStoreOrderStatus(tx *gorm.DB,oid int64,change,msg  string) error {
	data := &YshopStoreOrderStatus{
		Oid: oid,
		ChangeType: change,
		ChangeMessage: msg,
	}
	return tx.Model(&YshopStoreOrderStatus{}).Create(data).Error
}

func UpdateByStoreOrderStatus(m *YshopStoreOrderStatus) error {
	var err error
	err = db.Save(m).Error
	if err != nil {
		return err
	}

	return err
}

func DelByStoreOrderStatus(ids []int64) error {
	var err error
	err = db.Where("id in (?)", ids).Delete(&YshopStoreOrderStatus{}).Error
	if err != nil {
		return err
	}

	return err
}
