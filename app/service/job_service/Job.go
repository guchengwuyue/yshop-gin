/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package job_service

import (
	"yixiang.co/go-mall/app/models"
	"yixiang.co/go-mall/app/models/vo"
)

type Job struct {
	Id int64
	Name string

	Enabled int

	PageNum int
	PageSize int

	M *models.SysJob

	Ids []int64

}



func (d *Job) GetAll() vo.ResultList {
	maps := make(map[string]interface{})
	if d.Name != "" {
		maps["name"] = d.Name
	}

	total,list := models.GetAllJob(d.PageNum,d.PageSize,maps)
	return vo.ResultList{Content: list,TotalElements: total}
}

func (d *Job) Insert() error {
	return models.AddJob(d.M)
}

func (d *Job) Save() error {
	return models.UpdateByJob(d.M)
}

func (d *Job) Del() error {
	return models.DelByJob(d.Ids)
}