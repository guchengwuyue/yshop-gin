/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package models

type SysMaterialGroup struct {
	Name     string `json:"name" valid:"Required;"`
	CreateId int64  `json:"create_id"`
	BaseModel
}

func (SysMaterialGroup) TableName() string  {
	return "sys_material_group"
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
	err = db.Where("id in (?)",ids).Delete(&SysMaterialGroup{}).Error
	if err != nil {
		return err
	}


	return err
}

