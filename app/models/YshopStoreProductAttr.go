/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package models

import (
	"strings"
	dto2 "yixiang.co/go-mall/app/service/product_service/dto"
)

type YshopStoreProductAttr struct {
	Id         int64  `json:"id"`
	ProductId  int64  `json:"productId" valid:"Required;"`
	AttrName   string `json:"attrName" valid:"Required;"`
	AttrValues string `json:"attrValues" valid:"Required;"`
}

func (YshopStoreProductAttr) TableName() string  {
	return "yshop_store_product_attr"
}


func AddProductAttr(items []dto2.FormatDetail, productId int64) error {
	var err error
	tx := db.Begin()
	defer func() {
		if err != nil {
			tx.Rollback()
		}else{
			tx.Commit()
		}
	}()

	var attrGroup []YshopStoreProductAttr
	for _, val := range items {
		detailStr := strings.Join(val.Detail, ",")
		var storeProductAttr = YshopStoreProductAttr{
			ProductId:  productId,
			AttrName:   val.Value,
			AttrValues: detailStr,
		}
		attrGroup = append(attrGroup, storeProductAttr)
	}

		err = tx.Create(&attrGroup).Error
		if err != nil {
			return err
		}

	return err
}

func DelByProductttr(productId int64) (err error) {
	err = db.Where("product_id = ?",productId).Delete(YshopStoreProductAttr{}).Error
	return err
}
