/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package wechat_menu_service

import (
	"encoding/json"
	"github.com/gin-gonic/gin"
	"gorm.io/datatypes"
	"yixiang.co/go-mall/app/models"
	"yixiang.co/go-mall/app/models/vo"
	menuDto "yixiang.co/go-mall/app/service/wechat_menu_service/dto"
	"yixiang.co/go-mall/pkg/constant"
	"yixiang.co/go-mall/pkg/global"
)

type Menu struct {
	Id int64
	Key string

	Dto menuDto.WechatMenu

	M *models.YshopWechatMenu
}



func (d *Menu) GetAll() vo.ResultList {
	maps := make(map[string]interface{})
	maps["key"] = constant.YSHOP_WEICHAT_MENU

	data := models.GetWechatMenu(maps)
	return vo.ResultList{Content: data,TotalElements: 0}
}

func (d *Menu) Insert() error {
	button := gin.H{
		"button": d.Dto.Buttons,
	}
	jsonstr, _ := json.Marshal(button)
	str := string(jsonstr)
	global.YSHOP_LOG.Info(str)
	official := global.YSHOP_OFFICIAL_ACCOUNT
	m := official.GetMenu()
	err := m.SetMenuByJSON(str)
	if err != nil {
		global.YSHOP_LOG.Error(err)
	}

	result,_ := json.Marshal(d.Dto.Buttons)
	model := models.YshopWechatMenu{
		Key: constant.YSHOP_WEICHAT_MENU,
		Result: datatypes.JSON(result),
	}
	return models.UpdateByWechatMenu(&model)
}

