/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package models

type YshopShippingTemplatesFree struct {
	Id int64 `gorm:"primary_key" json:"id"`
	ProvinceId    int `json:"province_id"`
	TempId     int64 `json:"temp_id"`
	CityId     int `json:"city_id"`
	Number  float64    `json:"number"`
	Price    float64 `json:"price"`
	Type     int8 `json:"type"`
	Uniqid     string `json:"uniqid"`
}

func (YshopShippingTemplatesFree) TableName() string {
	return "yshop_shipping_templates_free"
}



func AddShippingTemplatesFree(m *YshopShippingTemplatesFree) error {
	var err error
	if err = db.Create(m).Error; err != nil {
		return err
	}

	return err
}

func UpdateByShippingTemplatesFree(m *YshopShippingTemplatesFree) error {
	var err error
	err = db.Save(m).Error
	if err != nil {
		return err
	}

	return err
}

func DelByShippingTemplatesFree(ids []int64) error {
	var err error
	err = db.Where("id in (?)", ids).Delete(&YshopShippingTemplatesFree{}).Error
	if err != nil {
		return err
	}

	return err
}
