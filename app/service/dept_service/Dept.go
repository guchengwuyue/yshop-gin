/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package dept_service

import (
	"yixiang.co/go-mall/app/models"
	"yixiang.co/go-mall/app/models/vo"
)

type Dept struct {
	Id int64
	Name string
	Enabled int

	M *models.SysDept

	Ids []int64

}


func (d *Dept) GetAll() vo.ResultList {
	maps := make(map[string]interface{})
	if d.Enabled >= 0 {
		maps["enabled"] = d.Enabled
	}
	if d.Name != "" {
		maps["name"] = d.Name
	}

	list := models.GetAllDepts(maps)
	return vo.ResultList{Content: list,TotalElements: 0}
}

func (d *Dept) Insert() error {
	return models.AddDept(d.M)
}

func (d *Dept) Save() error {
	return models.UpdateByDept(d.M)
}

func (d *Dept) Del() error {
	return models.DelByDept(d.Ids)
}