/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package material_service

import (
	"yixiang.co/go-mall/app/models"
	"yixiang.co/go-mall/app/models/vo"
)

type Material struct {
	Id int64
	Name string

	Enabled int
	GroupId int64

	PageNum int
	PageSize int

	M *models.SysMaterial

	Ids []int64

}



func (d *Material) GetAll() vo.ResultList {
	maps := make(map[string]interface{})
	if d.Name != "" {
		maps["name"] = d.Name
	}
	if d.GroupId > 0 {
		maps["group_id"] = d.GroupId
	}

	total,list := models.GetAllMaterial(d.PageNum,d.PageSize,maps)
	return vo.ResultList{Content: list,TotalElements: total}
}

func (d *Material) Insert() error {
	return models.AddMaterial(d.M)
}

func (d *Material) Save() error {
	return models.UpdateByMaterial(d.M)
}

func (d *Material) Del() error {
	return models.DelByMaterial(d.Ids)
}