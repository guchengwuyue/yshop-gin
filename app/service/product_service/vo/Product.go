/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package vo

import "yixiang.co/go-mall/app/models"

type Product struct {
	Id   int64      `json:"id"`
	Image       string `json:"image"`
	SliderImage string `json:"sliderImage"`
	SliderImageArr []string `json:"sliderImageArr"`
	StoreName   string `json:"storeName"`
	StoreInfo   string `json:"storeInfo"`
	Keyword     string `json:"keyword"`
	CateId 			int `json:"cateId"`
	Price        float64             `json:"price"`
	VipPrice     float64             `json:"vipPrice"`
	OtPrice      float64             `json:"otPrice"`
	Postage      float64             `json:"postage"`
	UnitName     string              `json:"unitName"`
	Sort         int16               `json:"sort"`
	Sales        int                 `json:"sales"`
	Stock        int                 `json:"stock"`
	Description  string              `json:"description"`
	IsPostage    int8                `json:"isPostage"`
	GiveIntegral int             `json:"giveIntegral"`
	Cost         float64             `json:"cost"`
	IsGood       int8                `json:"isGood"`
	Ficti        int                 `json:"ficti"`
	Browse       int                 `json:"browse"`
	IsSub        int8                `json:"isSub"`
	TempId       int64               `json:"tempId"`
	SpecType     int8                `json:"specType"`
	IsIntegral   int8                `json:"isIntegral"`
	Integral     int32               `json:"integral"`
	UserCollect bool`json:"userCollect"`
	AttrInfo       models.YshopStoreProductAttrValue `json:"attrInfo"`
}



