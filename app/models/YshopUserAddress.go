/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package models



type YshopUserAddress struct {
	Uid        int64 `json:"uid"`
	RealName    string `json:"realName"`
	Phone     string `json:"phone"`
	Province  string    `json:"province"`
	City        string `json:"city"`
	CityId    int `json:"cityId"`
	District     string `json:"district"`
	Detail  string    `json:"detail"`
	PostCode        string `json:"postCode"`
	Longitude    string `json:"longitude"`
	Latitude     string `json:"latitude"`
	IsDefault  int8    `json:"isDefault" gorm:"force"`
	BaseModel
}

func (YshopUserAddress) TableName() string {
	return "yshop_user_address"
}

// get all
func GetAllUserAddress(pageNUm int, pageSize int, maps interface{}) (int64, []YshopUserAddress) {
	var (
		total int64
		data  []YshopUserAddress
	)

	db.Model(&YshopUserAddress{}).Where(maps).Count(&total)
	db.Where(maps).Offset(pageNUm).Limit(pageSize).Order("id desc").Find(&data)

	return total, data
}



func AddUserAddress(m *YshopUserAddress) error {
	var err error
	if err = db.Create(m).Error; err != nil {
		return err
	}

	return err
}

func UpdateByUserAddress(m *YshopUserAddress) error {
	var err error
	err = db.Save(m).Error
	if err != nil {
		return err
	}

	return err
}

func DelByUserAddress(ids []int64) error {
	var err error
	err = db.Where("id in (?)", ids).Delete(&YshopUserAddress{}).Error
	if err != nil {
		return err
	}

	return err
}
