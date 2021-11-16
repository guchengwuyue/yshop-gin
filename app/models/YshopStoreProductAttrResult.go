/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package models

import (
	"encoding/json"
	"github.com/jinzhu/gorm"
	"time"
	"yixiang.co/go-mall/app/models/dto"
	"yixiang.co/go-mall/pkg/logging"
)


type YshopStoreProductAttrResult struct {
	ID         int64     `json:"id"`
	ProductId  int64     `json:"productId" valid:"Required;"`
	Result     string    `json:"sliderImage" valid:"Required;"`
	ChangeTime time.Time `json:"change_time"`
}

func GetProductAttrResult(productId int64) map[string]interface{} {
	var (
		result YshopStoreProductAttrResult
		data map[string]interface{}
	)
	db.Where("product_id = ?",productId).First(&result)

	e := json.Unmarshal([]byte(result.Result),&data)
	if e != nil {
		logging.Error(e)
	}


	return data
}

func AddProductAttrResult(items []dto.FormatDetail, attrs []dto.ProductFormat, productId int64)  error {
	var err error
	tx := db.Begin()
	defer func() {
		if err != nil {
			tx.Rollback()
		}else{
			tx.Commit()
		}
	}()
	var count int
	mapData := map[string]interface{}{
		"attr":  items,
		"value": attrs,
	}
	b, _ := json.Marshal(mapData)
	db.Model(&YshopStoreProductAttrResult{}).Where("product_id = ?", productId).Count(&count)
	if count > 0 {
		err = DelByProductAttrResult(productId)
		if err != nil {
			return err
		}
	}
	var result = YshopStoreProductAttrResult{
		ProductId: productId,
		Result:    string(b),
	}

	err = tx.Create(&result).Error
	if err != nil {
		return err
	}
	return err
}

func DelByProductAttrResult(productId int64) (err error) {
	err = db.Where("product_id = ?",productId).Delete(YshopStoreProductAttrResult{}).Error
	return err
}

func (u *YshopStoreProductAttrResult) BeforeCreate(scope *gorm.Scope) error  {
	scope.SetColumn("ChangeTime",time.Now())
	return nil
}

func (u *YshopStoreProductAttrResult) BeforeUpdate(scope *gorm.Scope) error  {
	scope.SetColumn("ChangeTime",time.Now())
	return nil
}