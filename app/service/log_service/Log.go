/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package log_service

import (
	"yixiang.co/go-mall/app/models"
	"yixiang.co/go-mall/app/models/vo"
)

type Log struct {
	Id int64

	PageNum int
	PageSize int

	M *models.SysLog

	Ids []int64

	Des string

}



func (d *Log) GetAll() vo.ResultList {
	maps := make(map[string]interface{})
	if d.Des != "" {
		maps["description"] = d.Des
	}

	total,list := models.GetAllLog(d.PageNum,d.PageSize,maps)
	return vo.ResultList{Content: list,TotalElements: total}
}

func (d *Log) Insert() error {
	return models.AddLog(d.M)
}


func (d *Log) Del() error {
	return models.DelBylog(d.Ids)
}