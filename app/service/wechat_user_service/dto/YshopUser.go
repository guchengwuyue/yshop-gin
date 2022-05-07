/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package dto

type YshopUser struct {
	Id       int64   `json:"id"`
	RealName string  `json:"real_name"`
	Mark     string  `json:"mark"`
	Phone    string  `json:"phone"`
	Integral int `json:"integral"`
}
