/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package models


type YshopStoreProduct struct {
	Image       string `json:"image" valid:"Required;"`
	SliderImage string `json:"sliderImage" valid:"Required;"`
	StoreName   string `json:"storeName" valid:"Required;"`
	StoreInfo   string `json:"storeInfo" valid:"Required;"`
	Keyword     string `json:"keyword" valid:"Required;"`
	CateId 			int `json:"cateId" valid:"Required;"`
	ProductCate  *YshopStoreCategory `json:"productCate" gorm:"foreignKey:CateId;association_autoupdate:false;association_autocreate:false"`
	Price        float64             `json:"price" valid:"Required;"`
	VipPrice     float64             `json:"vipPrice" valid:"Required;"`
	OtPrice      float64             `json:"otPrice" valid:"Required;"`
	Postage      float64             `json:"postage" valid:"Required;"`
	UnitName     string              `json:"unitName" valid:"Required;"`
	Sort         int16               `json:"sort" valid:"Required;"`
	Sales        int                 `json:"sales" valid:"Required;"`
	Stock        int                 `json:"stock" valid:"Required;"`
	IsShow       int8                `json:"isShow" valid:"Required;"`
	IsHot        int8                `json:"isHot" valid:"Required;"`
	IsBenefit    int8                `json:"is_benefit" valid:"Required;"`
	IsBest       int8                `json:"isBest" valid:"Required;"`
	IsNew        int8                `json:"isNew" valid:"Required;"`
	Description  string              `json:"description" valid:"Required;"`
	IsPostage    int8                `json:"isPostage" valid:"Required;"`
	GiveIntegral int             `json:"giveIntegral" valid:"Required;"`
	Cost         float64             `json:"cost" valid:"Required;"`
	IsGood       int8                `json:"isGood" valid:"Required;"`
	Ficti        int                 `json:"ficti" valid:"Required;"`
	Browse       int                 `json:"browse" valid:"Required;"`
	IsSub        int8                `json:"isSub" valid:"Required;"`
	TempId       int64               `json:"tempId" valid:"Required;"`
	SpecType     int8                `json:"specType" valid:"Required;"`
	IsIntegral   int8                `json:"isIntegral" valid:"Required;"`
	Integral     int32               `json:"integral" valid:"Required;"`
	BaseModel
}

func (YshopStoreProduct) TableName() string  {
	return "yshop_store_product"
}

func GetProduct(id int64) YshopStoreProduct {
	var product YshopStoreProduct
	db.Where("id =  ?",id).First(&product)

	return product
}

// get all
func GetFrontAllProduct(pageNUm int,pageSize int,maps interface{},order string) (int64, []YshopStoreProduct) {
	var (
		total int64
		data      []YshopStoreProduct
	)

	db.Model(&YshopStoreProduct{}).Where(maps).Count(&total)
	if order == "" {
		order = "id desc"
	}
	db.Where(maps).Offset(pageNUm).Limit(pageSize).Order(order).Find(&data)


	return total, data
}

// get all
func GetAllProduct(pageNUm int,pageSize int,maps interface{}) (int64, []YshopStoreProduct) {
	var (
		total int64
		data      []YshopStoreProduct
	)

	db.Model(&YshopStoreProduct{}).Where(maps).Count(&total)
	db.Where(maps).Offset(pageNUm).Limit(pageSize).Preload("ProductCate").Order("id desc").Find(&data)


	return total, data
}


func AddProduct(m *YshopStoreProduct) error {
	var err error
	if err = db.Create(m).Error; err != nil {
		return err
	}


	return err
}

func UpdateByProduct(id int64,m *YshopStoreProduct) error {
	var err error
	err = db.Model(&YshopStoreProduct{}).Where("id = ?",id).Updates(m).Error
	if err != nil {
		return err
	}

	return err
}




func OnSaleByProduct(id int64, status int) (err error) {
	var isShow = 1
	if status == 1 {
		isShow = 0
	}
	err = db.Model(&YshopStoreProduct{}).Where("id = ?", id).Update("is_show",isShow).Error
	return
}

func DelByProduct(ids []int64) error {
	var err error
	err = db.Where("id in (?)",ids).Delete(&YshopStoreProduct{}).Error
	if err != nil {
		return err
	}


	return err
}


