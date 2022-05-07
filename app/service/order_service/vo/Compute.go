/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package vo

type Compute struct {
	CouponPrice    float64 `json:"couponPrice"`
	DeductionPrice  float64                        `json:"deductionPrice"`
	PayPostage        float64              `json:"payPostage"`
	PayPrice    float64                  `json:"payPrice"`
	TotalPrice     float64                      `json:"totalPrice"`
	UseIntegral int                       `json:"useIntegral"`
	PayIntegral int                         `json:"payIntegral"`
}

