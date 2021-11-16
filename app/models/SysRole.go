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

type SysRole struct {
	Name  string        `json:"name" valid:"Required;"`
	Remark string       `json:"remark"`
	DataScope string    `json:"dataScope"`
	Level int32         `json:"level"`
	Permission string   `json:"permission"`
	Users    []*SysUser `gorm:"many2many:sys_users_roles;association_autoupdate:false;association_autocreate:false"`
	Menus []*SysMenu    `json:"menus" gorm:"many2many:sys_roles_menus;association_autoupdate:false;association_autocreate:false"`
	Depts []*SysDept    `gorm:"many2many:sys_roles_depts;association_autoupdate:false;association_autocreate:false"`
	BaseModel
}


func GetOneRole(id int64) SysRole {
	var role SysRole
	db.Where("id = ?",id).First(&role)
	return role
}

// get all
func GetAllRole(pageNUm int,pageSize int,maps interface{}) (int,[]SysRole)  {
	var (
		total int
		lists []SysRole
	)

	db.Model(&SysRole{}).Where(maps).Count(&total)
	db.Where(maps).Offset(pageNUm).Limit(pageSize).Preload("Menus").Find(&lists)

	return total,lists
}

func AddRole(m *SysRole) error {
	var err error
	if err = db.Create(m).Error; err != nil {
		return err
	}


	return err
}

func UpdateByRole(m *SysRole) error {
	var err error
	err = db.Save(m).Error
	if err != nil {
		return err
	}

	return err
}

func DelByRole(ids []int64) error {
	var err error
	err = db.Model(&SysRole{}).Where("id in (?)",ids).Update("is_del",1).Error
	if err != nil {
		return err
	}


	return err
}

func (u *SysRole) BeforeCreate(scope *gorm.Scope) error  {
	scope.SetColumn("CreateTime",time.Now())
	scope.SetColumn("UpdateTime",time.Now())
	return nil
}

func (u *SysRole) BeforeUpdate(scope *gorm.Scope) error  {
	scope.SetColumn("UpdateTime",time.Now())
	return nil
}