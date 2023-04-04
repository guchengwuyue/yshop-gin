/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package models

type SysDict struct {
	Name   string `json:"name" valid:"Required;"`
	Remark string `json:"remark" valid:"Required;"`
	BaseModel
}

func (SysDict) TableName() string {
	return "sys_dict"
}

// get all
func GetAllDict(pageNUm int, pageSize int, maps interface{}) (int64, []SysDict) {
	var (
		total int64
		dicts []SysDict
	)

	db.Model(&SysDict{}).Where(maps).Count(&total)
	db.Where(maps).Offset(pageNUm).Limit(pageSize).Find(&dicts)

	return total, dicts
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

func DelByDict(ids []int64) error {
	var err error
	err = db.Where("id in (?)", ids).Delete(&SysDict{}).Error
	if err != nil {
		return err
	}

	return err
}
