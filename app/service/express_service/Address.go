/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package express_service

import (
	"yixiang.co/go-mall/app/models"
	"yixiang.co/go-mall/app/models/vo"
)

type Express struct {
	Id int64
	Name string

	Enabled int

	PageNum int
	PageSize int

	M *models.YshopExpress

	Ids []int64

	Uid int64

}



func (d *Express) GetAll() vo.ResultList {
	maps := make(map[string]interface{})
	if d.Name != "" {
		maps["name"] = d.Name
	}

	total,list := models.GetAllExpress(d.PageNum,d.PageSize,maps)
	return vo.ResultList{Content: list,TotalElements: total}
}


func (d *Express) Insert() error {
	return models.AddExpress(d.M)
}

func (d *Express) Save() error {
	return models.UpdateByExpress(d.M)
}

func (d *Express) Del() error {
	return models.DelByExpress(d.Ids)
}