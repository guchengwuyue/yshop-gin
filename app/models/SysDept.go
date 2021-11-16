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

type SysDept struct {
	Name string        `json:"name" valid:"Required;"`
	Pid int64          `json:"pid"`
	Enabled int8       `json:"enabled" `
	Children []SysDept `gorm:"-" json:"children"`
	Label string       `gorm:"-" json:"label"`
	BaseModel
}


func GetAllDepts(maps interface{}) []SysDept {
	var depts []SysDept
	db.Where(maps).Find(&depts)
	return RecursionDeptList(depts,0)
}

//递归函数
func RecursionDeptList(data []SysDept, pid int64) []SysDept {
	var listTree = make([]SysDept,0)
	for _, value := range data {
		value.Label = value.Name
		if value.Pid == pid {
			value.Children = RecursionDeptList(data, value.Id)
			listTree = append(listTree, value)
		}
	}
	return listTree
}

func AddDept(m *SysDept) error {
	var err error
	if err = db.Create(m).Error; err != nil {
		return err
	}


	return err

}

func UpdateByDept(m *SysDept) error {
	var err error
	err = db.Save(m).Error
	if err != nil {
		return err
	}

	return err
}

func DelByDept(ids []int64) error {
	var err error
	err = db.Model(&SysDept{}).Where("id in (?)",ids).Update("is_del",1).Error
	if err != nil {
		return err
	}


	return err
}

func (u *SysDept) BeforeCreate(scope *gorm.Scope) error  {
	scope.SetColumn("CreateTime",time.Now())
	scope.SetColumn("UpdateTime",time.Now())
	return nil
}

func (u *SysDept) BeforeUpdate(scope *gorm.Scope) error  {
	scope.SetColumn("UpdateTime",time.Now())
	return nil
}