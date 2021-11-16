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

type SysDict struct {
	Name string `json:"name" valid:"Required;"`
	Remark string `json:"remark" valid:"Required;"`
	BaseModel
}

// get all
func GetAllDict(pageNUm int,pageSize int,maps interface{}) (int,[]SysDict)  {
	var (
		total int
		dicts []SysDict
	)

	db.Model(&SysDict{}).Where(maps).Count(&total)
	db.Where(maps).Offset(pageNUm).Limit(pageSize).Preload("Dept").Find(&dicts)

	return total,dicts
}

// last inserted Id on success.
func AddDict(m *SysDict) error {
	var err error
	if err = db.Create(m).Error; err != nil {
		return err
	}


	return err
}

func UpdateByDict(m *SysDict) error {
	var err error
	err = db.Save(m).Error
	if err != nil {
		return err
	}

	return err
}

func DelByDict(ids []int64)  error {
	var err error
	err = db.Model(&SysDict{}).Where("id in (?)",ids).Update("is_del",1).Error
	if err != nil {
		return err
	}


	return err
}

func (u *SysDict) BeforeCreate(scope *gorm.Scope) error  {
	scope.SetColumn("CreateTime",time.Now())
	scope.SetColumn("UpdateTime",time.Now())
	return nil
}

func (u *SysDict) BeforeUpdate(scope *gorm.Scope) error  {
	scope.SetColumn("UpdateTime",time.Now())
	return nil
}