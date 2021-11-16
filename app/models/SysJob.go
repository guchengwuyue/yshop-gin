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

type SysJob struct {
	Name    string `json:"name" valid:"Required;"`
	Enabled int8   `json:"enabled"`
	Sort    int   `json:"sort"`
	DeptId int64 `json:"deptId"`
	Dept *SysDept `json:"dept" gorm:"foreignKey:DeptId;association_autoupdate:false;association_autocreate:false"`
	BaseModel
}

// get all
func GetAllJob(pageNUm int,pageSize int,maps interface{}) (int, []SysJob) {
	var (
		total int
		lists     []SysJob
	)

	db.Model(&SysJob{}).Where(maps).Count(&total)
	db.Where(maps).Offset(pageNUm).Limit(pageSize).Preload("Dept").Find(&lists)

	return total, lists
}

func AddJob(m *SysJob) error {
	var err error
	if err = db.Create(m).Error; err != nil {
		return err
	}


	return err
}

func UpdateByJob(m *SysJob) error {
	var err error
	err = db.Save(m).Error
	if err != nil {
		return err
	}

	return err
}

func DelByJob(ids []int64) error {
	var err error
	err = db.Model(&SysJob{}).Where("id in (?)",ids).Update("is_del",1).Error
	if err != nil {
		return err
	}


	return err
}

func (u *SysJob) BeforeCreate(scope *gorm.Scope) error  {
	scope.SetColumn("CreateTime",time.Now())
	scope.SetColumn("UpdateTime",time.Now())
	return nil
}

func (u *SysJob) BeforeUpdate(scope *gorm.Scope) error  {
	scope.SetColumn("UpdateTime",time.Now())
	return nil
}
