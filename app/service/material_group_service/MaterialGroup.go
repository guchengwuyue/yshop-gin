/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package material_group_service

import (
	"yixiang.co/go-mall/app/models"
)

type MaterialGroup struct {
	Id int64
	Name string

	Enabled int
	GroupId int64

	PageNum int
	PageSize int

	M *models.SysMaterialGroup

	Ids []int64

}



func (d *MaterialGroup) GetAll() []models.SysMaterialGroup {
	maps := make(map[string]interface{})
	if d.Name != "" {
		maps["name"] = d.Name
	}

	list := models.GetAllGroup(maps)
	return list
}

func (d *MaterialGroup) Insert() error {
	return models.AddMaterialGroup(d.M)
}

func (d *MaterialGroup) Save() error {
	return models.UpdateByMaterialGroup(d.M)
}

func (d *MaterialGroup) Del() error {
	return models.DelByMaterialGroup(d.Ids)
}