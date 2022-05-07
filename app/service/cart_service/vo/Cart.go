/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package vo

import (
	"yixiang.co/go-mall/app/service/product_service/vo"
)

type Cart struct {
	Id                int64      `json:"id"`
	Uid               int64      `json:"uid"`
	Type              string     `json:"type"`
	ProductId         int64      `json:"productId"`
	ProductAttrUnique string     `json:"productAttrUnique"`
	CartNum           int        `json:"cartNum"`
	CombinationId     int64      `json:"combinationId"`
	SeckillId         int64      `json:"seckillId"`
	BargainId         int64      `json:"bargainId"`
	CostPrice         float64    `json:"costPrice"`
	ProductInfo       vo.Product `json:"productInfo"`
	TruePrice         float64    `json:"truePrice"`
	TrueStock         int        `json:"trueStock"`
	VipTruePrice      float64    `json:"vipTruePrice"`
	Unique            string     `json:"unique"`
	IsReply           int        `json:"isReply"`
}

