/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package models

type SysJob struct {
	Name    string `json:"name" valid:"Required;"`
	Enabled int8   `json:"enabled"`
	Sort    int   `json:"sort"`
	DeptId int64 `json:"deptId"`
	Dept *SysDept `json:"dept" gorm:"foreignKey:DeptId;association_autoupdate:false;association_autocreate:false"`
	BaseModel
}

func (SysJob) TableName() string  {
	return "sys_job"
}

// get all
func GetAllJob(pageNUm int,pageSize int,maps interface{}) (int64, []SysJob) {
	var (
		total int64
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
	err = db.Where("id in (?)",ids).Delete(&SysJob{}).Error
	if err != nil {
		return err
	}


	return err
}


