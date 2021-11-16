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

type SysDictDetail struct {
	Label string `json:"label" valid:"Required;"`
	Value string `json:"value" valid:"Required;"`
	Sort int `json:"sort"`
	DictId int64 `json:"dictId"`
	DictName string `json:"dictName"`
	BaseModel
}

// get all
func GetAllDictDetail(pageNUm int,pageSize int,maps interface{}) (int,[]SysDictDetail)  {
	var (
		total int
		lists []SysDictDetail
	)
	db.Model(&SysDictDetail{}).Where(maps).Count(&total)
	db.Where(maps).Offset(pageNUm).Limit(pageSize).Find(&lists)

	return total,lists
}

func AddDictDetail(m *SysDictDetail) error {
	var err error
	if err = db.Create(m).Error; err != nil {
		return err
	}


	return err
}

func UpdateByDictDetail(m *SysDictDetail) error {
	var err error
	err = db.Save(m).Error
	if err != nil {
		return err
	}

	return err
}

func DelByDictDetail(ids []int64) error {
	var err error
	err = db.Model(&SysDictDetail{}).Where("id in (?)",ids).Update("is_del",1).Error
	if err != nil {
		return err
	}


	return err
}

func (u *SysDictDetail) BeforeCreate(scope *gorm.Scope) error  {
	scope.SetColumn("CreateTime",time.Now())
	scope.SetColumn("UpdateTime",time.Now())
	return nil
}

func (u *SysDictDetail) BeforeUpdate(scope *gorm.Scope) error  {
	scope.SetColumn("UpdateTime",time.Now())
	return nil
}


