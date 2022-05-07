/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package models

type YshopSystemCity struct {
	Id int64 `gorm:"primary_key" json:"id"`
	CityId    int64 `json:"v"`
	Level     int `json:"level"`
	ParentId  int64    `json:"parent_id"`
	AreaCode        string `json:"area_code"`
	Name    string `json:"n"`
	MergerName     string `json:"merger_name"`
	Lng  string    `json:"lng"`
	Lat        string `json:"lat"`
	Isshow  int8    `json:"is_show"`
	Children []YshopSystemCity `gorm:"-" json:"c"`
}

func (YshopSystemCity) TableName() string {
	return "yshop_system_city"
}

func GetAllSystemCity(maps interface{}) []YshopSystemCity {
	var data []YshopSystemCity
	db.Where(maps).Find(&data)
	return RecursionCityList(data,0)
}

//递归函数
func RecursionCityList(data []YshopSystemCity, pid int64) []YshopSystemCity {
	var listTree = make([]YshopSystemCity,0)
	for _, value := range data {
		//value.Label = value.Name
		if value.ParentId == pid {
			value.Children = RecursionCityList(data, value.CityId)
			listTree = append(listTree, value)
		}
	}
	return listTree
}



func AddSystemCity(m *YshopSystemCity) error {
	var err error
	if err = db.Create(m).Error; err != nil {
		return err
	}

	return err
}

func UpdateBySystemCity(m *YshopSystemCity) error {
	var err error
	err = db.Save(m).Error
	if err != nil {
		return err
	}

	return err
}

func DelBySystemCity(ids []int64) error {
	var err error
	err = db.Where("id in (?)", ids).Delete(&YshopSystemCity{}).Error
	if err != nil {
		return err
	}

	return err
}
