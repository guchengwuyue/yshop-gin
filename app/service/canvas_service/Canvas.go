/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package canvas_service

import (
	"yixiang.co/go-mall/app/models"
	"yixiang.co/go-mall/app/models/vo"
	"yixiang.co/go-mall/pkg/global"
)

type Canvas struct {
	Id int64
	Terminal int

	Enabled int


	M *models.YshopStoreCanvas

	Ids []int64

}

func (d *Canvas) Get() vo.ResultList {
	var data models.YshopStoreCanvas
	err := global.YSHOP_DB.Model(&models.YshopStoreCanvas{}).Where("terminal = ?",d.Terminal).First(&data).Error
	if err != nil {
		global.YSHOP_LOG.Error(err)
	}
	return vo.ResultList{Content: data,TotalElements: 0}
}




func (d *Canvas) Save() error {
	if d.M.Id == 0 {
		return models.AddCanvas(d.M)
	}else{
		data := &models.YshopStoreCanvas{
			Name: d.M.Name,
			Terminal: d.M.Terminal,
			Json: d.M.Json,
		}
		return global.YSHOP_DB.Model(&models.YshopStoreCanvas{}).Where("id = ?",d.M.Id).Updates(data).Error
	}

}

//func (d *Canvas) Save() error {
//	return models.UpdateByCanvas(d.M)
//}

func (d *Canvas) Del() error {
	return models.DelByCanvas(d.Ids)
}