/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package models

import (
	"gorm.io/datatypes"
	"time"
	"yixiang.co/go-mall/pkg/constant"
)


type YshopWechatMenu struct {
	Key     string `json:"key"`
	Result    datatypes.JSON `json:"result"`
	AddTime time.Time `json:"addTIme" gorm:"autoCreateTime"`
}

func (YshopWechatMenu) TableName() string {
	return "yshop_wechat_menu"
}

// get all
func GetWechatMenu( maps interface{}) YshopWechatMenu {
	var (
		data  YshopWechatMenu
	)

	db.Where(maps).First(&data)

	return data
}

func AddWechatMenu(m *YshopWechatMenu) error {
	var err error
	if err = db.Create(m).Error; err != nil {
		return err
	}

	return err
}

func UpdateByWechatMenu(m *YshopWechatMenu) error {
	var err error
	err = db.Model(&YshopWechatMenu{}).Where("key",constant.YSHOP_WEICHAT_MENU).Updates(m).Error
	if err != nil {
		return err
	}

	return err
}


