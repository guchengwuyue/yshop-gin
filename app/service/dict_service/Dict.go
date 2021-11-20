/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package dict_service

import (
	"yixiang.co/go-mall/app/models"
	"yixiang.co/go-mall/app/models/vo"
)

type Dict struct {
	Id int64
	Name string
	Enabled int

	PageNum int
	PageSize int

	M *models.SysDict

	Ids []int64

}


func (d *Dict) GetAll() vo.ResultList {
	maps := make(map[string]interface{})
	if d.Enabled >= 0 {
		maps["enabled"] = d.Enabled
	}
	if d.Name != "" {
		maps["name"] = d.Name
	}

	total,list := models.GetAllDict(d.PageNum,d.PageSize,maps)
	return vo.ResultList{Content: list,TotalElements: total}
}

func (d *Dict) Insert() error {
	return models.AddDict(d.M)
}

func (d *Dict) Save() error {
	return models.UpdateByDict(d.M)
}

func (d *Dict) Del() error {
	return models.DelByDict(d.Ids)
}