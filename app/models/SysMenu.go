/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package models

import (
	"github.com/jinzhu/gorm"
	"time"
	"yixiang.co/go-mall/pkg/logging"
	"yixiang.co/go-mall/pkg/util"
)

type SysMenu struct {
	Name          string    `json:"name" valid:"Required;"`
	IFrame        int8      `json:"iframe"`
	Component     string    `json:"component"`
	Pid           int64     `json:"pid"`
	Sort          int32     `json:"sort"`
	Icon          string    `json:"icon"`
	Path          string    `json:"path"`
	Cache         int8      `json:"cache"`
	Hidden        int8      `json:"hidden"`
	ComponentName string    `json:"componentName"`
	Permission    string    `json:"permission"`
	Type          int32     `json:"type"`
	Router        string    `json:"router"`
	RouterMethod  string    `json:"routerMethod"`
	Children      []SysMenu `json:"children" gorm:"-"`
	Label         string    `gorm:"-" json:"label"`
	BaseModel
}

type RoleIdList struct {
	Id int64
}


func GetOneMenuById(id int64) SysMenu {
	var res SysMenu
	db.Where("id = ?",id).First(&res)
	return res
}

func GetAllMenus(maps interface{}) []SysMenu {
	var menus []SysMenu

	db.Where(maps).Order("sort").Find(&menus)

	return RecursionMenuList(menus, 0)
}

//递归函数
func RecursionMenuList(data []SysMenu, pid int64) []SysMenu {
	var listTree = make([]SysMenu, 0)
	for _, value := range data {
		value.Label = value.Name
		if value.Pid == pid {
			value.Children = RecursionMenuList(data, value.Id)
			listTree = append(listTree, value)
		}
	}
	return listTree
}

func AddMenu(m *SysMenu) error {
	var err error
	if err = db.Create(m).Error; err != nil {
		return err
	}
	return err
}

func UpdateByMenu(m *SysMenu) error {
	var err error
	err = db.Save(m).Error
	if err != nil {
		return err
	}

	return err
}

func DelByMenu(ids []int64) error {
	var err error
	err = db.Model(&SysMenu{}).Where("id in (?)",ids).Update("is_del",1).Error
	if err != nil {
		return err
	}


	return err
}
//
////获取权限string
//func FindByRouterAndMethod(url string, method string) (permission string) {
//	o := orm.NewOrm()
//	var menu SysMenu
//	err := o.QueryTable(new(SysMenu)).Filter("router", url).Filter("router_method", method).One(&menu)
//	if err != nil {
//		return ""
//	}
//	return menu.Permission
//}
//
func FindMenuByRouterAndMethod(url string, method string) SysMenu {
	var menu SysMenu
	db.Where("router = ?", url).Where("router_method = ?", method).First(&menu)
	return menu
}

func BuildMenus(uid int64) []SysMenu {
	var lists = make([]RoleIdList,0)
	var roleIds = make([]int64,0)
	err := db.Raw("SELECT r.* FROM sys_role r, sys_users_roles u "+
		"WHERE r.id = u.sys_role_id AND u.sys_user_id = ?", uid).Find(&lists).Error
	if err != nil {
		logging.Error(err)
	}
	for i := 0; i < len(lists); i++ {
		roleIds = append(roleIds,lists[i].Id)
	}
	idsStr := util.Convert(roleIds)
	logging.Info(idsStr)
	var menus []SysMenu
	e := db.Raw("select m.* from sys_menu m LEFT OUTER JOIN sys_roles_menus t on m.id= t.sys_menu_id "+
		"LEFT OUTER JOIN sys_role r on r.id = t.sys_role_id where m.is_del=0  and m.type!=2 and r.id in (?) "+
		"order by m.sort asc",
		idsStr).Scan(&menus).Error

	if e != nil {
		logging.Error(e)
	}

	return menus

}

func (u *SysMenu) BeforeCreate(scope *gorm.Scope) error  {
	scope.SetColumn("CreateTime",time.Now())
	scope.SetColumn("UpdateTime",time.Now())
	return nil
}

func (u *SysMenu) BeforeUpdate(scope *gorm.Scope) error  {
	scope.SetColumn("UpdateTime",time.Now())
	return nil
}