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

type SysLog struct {
	Description string `json:"description"`
	Method string `json:"method"`
	RequestIp string `json:"requestIp"`
	Username string `json:"username"`
	Address string `json:"address"`
	Browser string `json:"browser"`
	Type int8 `json:"type"`
	Uid int64 `json:"uid"`
	Time int64 `json:"time"`
	BaseModel
}


// get all
func GetAllLog(pageNUm int,pageSize int,maps interface{}) (int,[]SysLog)  {
	var (
		total int
		lists []SysLog
	)

	db.Model(&SysLog{}).Where(maps).Count(&total)
	db.Where(maps).Offset(pageNUm).Limit(pageSize).Find(&lists)

	return total,lists
}


// last inserted Id on success.
func AddLog(m *SysLog)  error {
	if err := db.Create(m).Error; err != nil {
		return err
	}
	return nil
}

func DelBylog(ids []int64) error {
	var err error
	err = db.Model(&SysLog{}).Where("id in (?)",ids).Update("is_del",1).Error
	if err != nil {
		return err
	}


	return err
}

func (u *SysLog) BeforeCreate(scope *gorm.Scope) error  {
	scope.SetColumn("CreateTime",time.Now())
	scope.SetColumn("UpdateTime",time.Now())
	return nil
}

func (u *SysLog) BeforeUpdate(scope *gorm.Scope) error  {
	scope.SetColumn("UpdateTime",time.Now())
	return nil
}