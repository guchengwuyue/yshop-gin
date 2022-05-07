package dto

import "yixiang.co/go-mall/app/models/dto"

type UserQuery struct {
	dto.BasePage
	Sort string
	Blurry string
	Enabled bool
}