/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package cate_service

import (
	"yixiang.co/go-mall/app/models"
	"yixiang.co/go-mall/app/models/vo"
)

type Cate struct {
	Id int64
	Name string
	Enabled int

	M *models.YshopStoreCategory

	Ids []int64

}


//返回一定格式的分类数据
func (d *Cate) GetProductCate() []map[string]interface{} {
	var (
		retList []map[string]interface{}
	)
	maps := make(map[string]interface{})
	maps["is_del"] = 0
	maps["is_show"] = 1
	list := models.GetAllCates(maps)

	for _, value := range list {
		var mapData = make(map[string]interface{})
		mapData["value"] = value.Id
		mapData["label"] = "|----" + value.CateName
		if value.Pid == 0 {
			mapData["disabled"] = 0
		} else {
			mapData["disabled"] = 1
		}
		retList = append(retList, mapData)
		if value.Children != nil && len(value.Children) > 0 {
			for _, value2 := range value.Children {
				var mapData2 = make(map[string]interface{})
				mapData2["value"] = value2.Id
				mapData2["label"] = "|----|----" + value2.CateName
				if value2.Pid == 0 {
					mapData2["disabled"] = 0
				} else {
					mapData2["disabled"] = 1
				}
				retList = append(retList, mapData2)
			}
		}

	}

	return retList
}

func (d *Cate) GetAll() vo.ResultList {
	maps := make(map[string]interface{})
	//maps["is_del"] = 0
	if d.Enabled >= 0 {
		maps["is_show"] = d.Enabled
	}
	if d.Name != "" {
		maps["name"] = d.Name
	}

	list := models.GetAllCates(maps)
	return vo.ResultList{Content: list,TotalElements: 0}
}

func (d *Cate) Insert() error {
	return models.AddCate(d.M)
}

func (d *Cate) Save() error {
	return models.UpdateByCate(d.M)
}

func (d *Cate) Del() error {
	return models.DelByCate(d.Ids)
}