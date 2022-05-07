/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package vo

import (
	"yixiang.co/go-mall/app/models"
)

type ProductDetail struct {
	ProductAttr  []ProductAttr                                `json:"productAttr"`
	ProductValue map[string]models.YshopStoreProductAttrValue `json:"productValue"`
	Reply        models.YshopStoreProductReply                `json:"reply"`
	ReplyChance  string                                       `json:"replyChance"`
	ReplyCount   string                                       `json:"replyCount"`
	StoreInfo    Product                                      `json:"storeInfo"`
	Uid          int64                                        `json:"uid"`
	TempName     string                                       `json:"tempName"`
}



