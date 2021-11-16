/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package models

import (
	"strings"
	"yixiang.co/go-mall/app/models/dto"
)

type YshopStoreProductAttr struct {
	Id         int64  `json:"id"`
	ProductId  int64  `json:"productId" valid:"Required;"`
	AttrName   string `json:"attrName" valid:"Required;"`
	AttrValues string `json:"attrValues" valid:"Required;"`
}



func AddProductAttr(items []dto.FormatDetail, productId int64) error {
	var err error
	tx := db.Begin()
	defer func() {
		if err != nil {
			tx.Rollback()
		}else{
			tx.Commit()
		}
	}()
	for _, val := range items {
		detailStr := strings.Join(val.Detail, ",")
		var storeProductAttr = YshopStoreProductAttr{
			ProductId:  productId,
			AttrName:   val.Value,
			AttrValues: detailStr,
		}
		err = tx.Create(&storeProductAttr).Error
		if err != nil {
			return err
		}
	}


	return err
}

func DelByProductttr(productId int64) (err error) {
	err = db.Where("product_id = ?",productId).Delete(YshopStoreProductAttr{}).Error
	return err
}
