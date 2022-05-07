/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package dto

type UserMoney struct {
	Id    int64   `json:"id"`
	Money float64 `json:"money"`
	Ptype int     `json:"ptype"`
}
