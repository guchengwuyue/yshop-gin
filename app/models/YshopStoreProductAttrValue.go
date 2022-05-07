/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package models

import (
	"github.com/segmentio/ksuid"
	"sort"
	"strconv"
	"strings"
	dto2 "yixiang.co/go-mall/app/service/product_service/dto"
	"yixiang.co/go-mall/pkg/util"
)

type YshopStoreProductAttrValue struct {
	ID           int64   `json:"id"`
	ProductId    int64   `json:"productId" valid:"Required;"`
	Sku          string  `json:"sku" valid:"Required;"`
	Stock        int     `json:"stock" valid:"Required;"`
	Sales        int     `json:"sales"`
	Price        float64 `json:"price"`
	Image        string  `json:"image"`
	Unique       string  `json:"unique"`
	Cost         float64 `json:"cost"`
	BarCode      string  `json:"barCode"`
	OtPrice      float64 `json:"otPrice"`
	Weight       float64 `json:"weight"`
	Volume       float64 `json:"volume"`
	Brokerage    float64 `json:"brokerage"`
	BrokerageTwo float64 `json:"brokerage"`
	PinkPrice    float64 `json:"pinkPrice"`
	PinkStock    int     `json:"pinkStock"`
	SeckillPrice float64 `json:"seckillPrice"`
	SeckillStock int     `json:"seckillStock"`
	Integral     int     `json:"integral"`
}

func (YshopStoreProductAttrValue) TableName() string  {
	return "yshop_store_product_attr_value"
}

func GetAttrValueByProductIdAndSku(productId int64, sku string) *YshopStoreProductAttrValue {
	var attrValue YshopStoreProductAttrValue
	db.Where("product_id = ?", productId).Where("sku = ?", sku).First(&attrValue)

	return &attrValue
}
//
func AddProductttrValue(attrs []dto2.ProductFormat, productId int64) error {
	var err error
	tx := db.Begin()
	defer func() {
		if err != nil {
			tx.Rollback()
		}else{
			tx.Commit()
		}
	}()
	var valueGroup []YshopStoreProductAttrValue
	for _, val := range attrs {
		stringList := util.GetValues(val.Detail)
		sort.Strings(stringList)
		str := strings.Join(stringList, ",")
		price, _ := strconv.ParseFloat(val.Price, 64)
		cost, _ := strconv.ParseFloat(val.Cost, 64)
		otPrice, _ := strconv.ParseFloat(val.OtPrice, 64)
		weight, _ := strconv.ParseFloat(val.Weight, 64)
		volume, _ := strconv.ParseFloat(val.Volume, 64)
		brokerage, _ := strconv.ParseFloat(val.Brokerage, 64)
		brokerageTwo, _ := strconv.ParseFloat(val.BrokerageTwo, 64)
		stock, _ := strconv.Atoi(val.Stock)
		uuid := ksuid.New()
		var storeProductAttrValue = YshopStoreProductAttrValue{
			ProductId:    productId,
			Sku:          str,
			Price:        price,
			Cost:         cost,
			OtPrice:      otPrice,
			Unique:       uuid.String(),
			Image:        val.Pic,
			BarCode:      "",
			Weight:       weight,
			Volume:       volume,
			Brokerage:    brokerage,
			BrokerageTwo: brokerageTwo,
			Stock:        stock,
			PinkStock:    0,
			PinkPrice:    0,
			SeckillStock: 0,
			SeckillPrice: 0,
		}

		valueGroup = append(valueGroup, storeProductAttrValue)

	}

	err = tx.Create(&valueGroup).Error
	if err != nil {
		return err
	}

	return err
}

func DelByProductttrValue(productId int64) (err error) {
	err = db.Where("product_id = ?",productId).Delete(YshopStoreProductAttrValue{}).Error
	return err
}
