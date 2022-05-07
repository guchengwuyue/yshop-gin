/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package models


type YshopExpress struct {
	Code     string `json:"code"`
	Name    string `json:"name"`
	Sort     int `json:"sort"`
	IsShow  int8    `json:"is_show"`
	BaseModel
}

func (YshopExpress) TableName() string {
	return "yshop_express"
}

// get all
func GetAllExpress(pageNUm int,pageSize int,maps interface{}) (int64,[]YshopExpress)  {
	var (
		total int64
		lists []YshopExpress
	)

	db.Model(&YshopExpress{}).Where(maps).Count(&total)
	db.Where(maps).Offset(pageNUm).Limit(pageSize).Find(&lists)

	return total,lists
}

func AddExpress(m *YshopExpress) error {
	var err error
	if err = db.Create(m).Error; err != nil {
		return err
	}

	return err
}

func UpdateByExpress(m *YshopExpress) error {
	var err error
	err = db.Updates(m).Error
	if err != nil {
		return err
	}

	return err
}

func DelByExpress(ids []int64) error {
	var err error
	err = db.Where("id in (?)", ids).Delete(&YshopExpress{}).Error
	if err != nil {
		return err
	}

	return err
}
