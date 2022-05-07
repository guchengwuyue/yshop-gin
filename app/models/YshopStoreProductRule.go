/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package models

import (
	"encoding/json"
	dto2 "yixiang.co/go-mall/app/service/product_service/dto"
)

//

type YshopStoreProductRule struct {
	RuleName  string `json:"ruleName" valid:"Required;"`
	RuleValue string `json:"ruleValue" valid:"Required;"`
	BaseModel
}

func (YshopStoreProductRule) TableName() string  {
	return "yshop_store_product_rule"
}

// get all
func GetAllProductRule(pageNUm int,pageSize int,maps interface{}) (int64, []dto2.ProductRule) {
	var (
		total int64
		data      []YshopStoreProductRule
		retData   []dto2.ProductRule
	)
	db.Model(&YshopStoreProductRule{}).Where(maps).Count(&total)
	db.Where(maps).Offset(pageNUm).Limit(pageSize).Order("id desc").Find(&data)

	for _, rule := range data {
		var value []interface{}
		json.Unmarshal([]byte(rule.RuleValue), &value)
		v := dto2.ProductRule{
			Id:         rule.Id,
			RuleName:   rule.RuleName,
			RuleValue:  value,
			CreateTime: rule.CreateTime,
		}

		retData = append(retData, v)
	}

	return total, retData
}

func AddProductRule(m *YshopStoreProductRule) error {
	var err error
	if err = db.Create(m).Error; err != nil {
		return err
	}


	return err
}

func UpdateByProductRule(id int64,m *YshopStoreProductRule)  error {
	var err error
	err = db.Model(&YshopStoreProductRule{}).Where("id = ?",id).Updates(m).Error
	if err != nil {
		return err
	}

	return err
}

func DelByProductRulee(ids []int64) error {
	var err error
	err = db.Model(&YshopStoreProductRule{}).Where("id in (?)",ids).Update("is_del",1).Error
	if err != nil {
		return err
	}


	return err
}

