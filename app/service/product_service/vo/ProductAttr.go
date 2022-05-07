package vo

import (
	dto2 "yixiang.co/go-mall/app/service/product_service/dto"
)

type ProductAttr struct {
	Id       int64               `json:"id"`
	ProductId int64              `json:"productId"`
	AttrName   string            `json:"attrName"`
	AttrValues   string          `json:"attrValues"`
	AttrValue   []dto2.AttrValue `json:"attrValue"`
	AttrValueArr   []string      `json:"attrValueArr"`
}
