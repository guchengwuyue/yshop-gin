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

type SysMaterialGroup struct {
	Name     string `json:"name" valid:"Required;"`
	CreateId int64  `json:"create_id"`
	BaseModel
}

//
func GetAllGroup(maps interface{}) []SysMaterialGroup {
	var data []SysMaterialGroup
	db.Where(maps).Find(&data)
	return data
}

func AddMaterialGroup(m *SysMaterialGroup) error {
	var err error
	if err = db.Create(m).Error; err != nil {
		return err
	}


	return err
}

func UpdateByMaterialGroup(m *SysMaterialGroup) error {
	var err error
	err = db.Save(m).Error
	if err != nil {
		return err
	}

	return err
}

func DelByMaterialGroup(ids []int64)  error {
	var err error
	err = db.Model(&SysMaterialGroup{}).Where("id in (?)",ids).Update("is_del",1).Error
	if err != nil {
		return err
	}


	return err
}

func (u *SysMaterialGroup) BeforeCreate(scope *gorm.Scope) error  {
	scope.SetColumn("CreateTime",time.Now())
	scope.SetColumn("UpdateTime",time.Now())
	return nil
}

func (u *SysMaterialGroup) BeforeUpdate(scope *gorm.Scope) error  {
	scope.SetColumn("UpdateTime",time.Now())
	return nil
}