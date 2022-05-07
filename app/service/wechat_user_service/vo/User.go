/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package vo

import (
	"time"
)

type User struct {
	Id int64  `json:"id"`
	Username       string         `json:"username"`
	RealName       string         `json:"real_name"`
	Birthday       int            `json:"birthday"`
	Mark           string         `json:"mark"`
	Nickname       string         `json:"nickname"`
	Avatar         string         `json:"avatar"`
	Phone          string         `json:"phone"`
	NowMoney       float64         `json:"nowMoney"`
	BrokeragePrice float64        `json:"brokeragePrice"`
	Integral       int        `json:"integral"`
	SignNum        int            `json:"sign_num"`
	Status         int8           `json:"status"`
	Level          int8           `json:"level"`
	SpreadUid      string         `json:"spreadUid"`
	SpreadTime     time.Time            `json:"spread_time"`
	PayCount       int            `json:"payCount"`
	SpreadCount    int            `json:"spread_count"`
	Address        string         `json:"address"`
}

