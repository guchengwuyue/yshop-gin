/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package models

type SysDictDetail struct {
	Label string `json:"label" valid:"Required;"`
	Value string `json:"value" valid:"Required;"`
	Sort int `json:"sort"`
	DictId int64 `json:"dictId"`
	DictName string `json:"dictName"`
	BaseModel
}

func (SysDictDetail) TableName() string  {
	return "sys_dict_detail"
}

// get all
func GetAllDictDetail(pageNUm int,pageSize int,maps interface{}) (int64,[]SysDictDetail)  {
	var (
		total int64
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



