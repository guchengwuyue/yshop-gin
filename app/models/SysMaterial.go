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

type SysMaterial struct {
	Name     string `json:"name" valid:"Required;"`
	Type     string `json:"type"`
	Url      string `json:"url"`
	GroupId  int64  `json:"groupId"`
	CreateId int64  `json:"create_id"`
	BaseModel
}


func GetAllMaterial(pageNUm int,pageSize int,maps interface{}) (int, []SysMaterial) {
	var (
		total int
		data      []SysMaterial
	)
	db.Model(&SysMaterial{}).Where(maps).Count(&total)
	db.Where(maps).Offset(pageNUm).Limit(pageSize).Order("id DESC").Find(&data)

	return total, data
}

func AddMaterial(m *SysMaterial) error {
	var err error
	if err = db.Create(m).Error; err != nil {
		return err
	}


	return err
}

func UpdateByMaterial(m *SysMaterial) error {
	var err error
	err = db.Save(m).Error
	if err != nil {
		return err
	}

	return err
}

func DelByMaterial(ids []int64) error {
	var err error
	err = db.Model(&SysMaterial{}).Where("id in (?)",ids).Update("is_del",1).Error
	if err != nil {
		return err
	}


	return err
}

func (u *SysMaterial) BeforeCreate(scope *gorm.Scope) error  {
	scope.SetColumn("CreateTime",time.Now())
	scope.SetColumn("UpdateTime",time.Now())
	return nil
}

func (u *SysMaterial) BeforeUpdate(scope *gorm.Scope) error  {
	scope.SetColumn("UpdateTime",time.Now())
	return nil
}