/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package models

import (
	"github.com/jinzhu/gorm"
	"time"
)

type YshopStoreCategory struct {
	CateName string               `json:"cateName" valid:"Required;"`
	Pid      int64                `json:"pid"`
	Sort     int                  `json:"sort"`
	Pic      string               `json:"pic"`
	IsShow   int8                 `json:"isShow"`
	Children []YshopStoreCategory `gorm:"-" json:"children"`
	Label    string               `gorm:"-" json:"label"`
	BaseModel
}


func GetAllCates(maps interface{}) []YshopStoreCategory {
	var data []YshopStoreCategory
	db.Where(maps).Find(&data)
	return RecursionCateList(data, 0)
}

//递归函数
func RecursionCateList(data []YshopStoreCategory, pid int64) []YshopStoreCategory {
	var listTree = make([]YshopStoreCategory, 0)
	for _, value := range data {
		value.Label = value.CateName
		if value.Pid == pid {
			value.Children = RecursionCateList(data, value.Id)
			listTree = append(listTree, value)
		}
	}
	return listTree
}

func AddCate(m *YshopStoreCategory) error {
	var err error
	if err = db.Create(m).Error; err != nil {
		return err
	}


	return err
}

func UpdateByCate(m *YshopStoreCategory) error {
	var err error
	err = db.Save(m).Error
	if err != nil {
		return err
	}

	return err
}

func DelByCate(ids []int64) error {
	var err error
	err = db.Model(&YshopStoreCategory{}).Where("id in (?)",ids).Update("is_del",1).Error
	if err != nil {
		return err
	}


	return err
}


func (u *YshopStoreCategory) BeforeCreate(scope *gorm.Scope) error  {
	scope.SetColumn("CreateTime",time.Now())
	scope.SetColumn("UpdateTime",time.Now())
	return nil
}

func (u *YshopStoreCategory) BeforeUpdate(scope *gorm.Scope) error  {
	scope.SetColumn("UpdateTime",time.Now())
	return nil
}