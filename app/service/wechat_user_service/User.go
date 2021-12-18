/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package wechat_user_service

import (
	"encoding/json"
	"github.com/silenceper/wechat/v2/officialaccount/user"
	"gorm.io/datatypes"
	"gorm.io/gorm"
	"yixiang.co/go-mall/app/models"
	"yixiang.co/go-mall/app/models/dto"
	"yixiang.co/go-mall/app/models/vo"
	userEnum "yixiang.co/go-mall/pkg/enums/user"
	"yixiang.co/go-mall/pkg/global"
	"yixiang.co/go-mall/pkg/util"
)

type User struct {
	Id int64
	Username string

	Value string
	MyType string
	UserType string


	PageNum int
	PageSize int

	UserInfo *user.Info

	Ip string
	//M *models.YshopUser
	Dto *dto.YshopUser

	Money *dto.UserMoney

	Ids []int64



}


func (u *User) GetUserAll() vo.ResultList {
	maps := make(map[string]interface{})

	if u.Value != ""{
		if u.MyType == "phone" {
			maps["phone"] = u.Value
		}else{
			maps["nickname"] = u.Value
		}
	}

	if u.UserType != "" {
		maps["user_type"] = u.UserType
	}

	total,list := models.GetAllWechatUser(u.PageNum,u.PageSize,maps)
	return vo.ResultList{Content: list,TotalElements: total}
}

func (u *User) Insert() error {
	result,_ := json.Marshal(u.UserInfo)
	user := models.YshopUser{
		Username: u.UserInfo.OpenID,
		Nickname: u.UserInfo.Nickname,
		Password: util.HashAndSalt([]byte("123456")),
		RealName: u.UserInfo.Nickname,
		Avatar: u.UserInfo.Headimgurl,
		AddIp: u.Ip,
		LastIp: u.Ip,
		UserType: userEnum.WECHAT,
		WxProfile: datatypes.JSON(result),

	}
	return models.AddWechatUser(&user)
}

func (u *User) Save() error {
	user := models.YshopUser{
		RealName: u.Dto.RealName,
		Mark: u.Dto.Mark,
		Phone: u.Dto.Phone,
		Integral: u.Dto.Integral,

	}
	return models.UpdateByWechatUsere(u.Dto.Id,&user)
}

func (u *User) SaveMony() error {
	var err error
	if u.Money.Ptype == 1 {
		err = global.YSHOP_DB.Model(&models.YshopUser{}).Where("id = ?",u.Money.Id).Update("now_money",gorm.Expr("now_money + ?",u.Money.Money)).Error
	}else{
		err = global.YSHOP_DB.Model(&models.YshopUser{}).Where("id = ? and now_money >= ?",u.Money.Id,u.Money.Money).Update("now_money",gorm.Expr("now_money - ?",u.Money.Money)).Error
	}
	return err
}

//func (u *User) Del() error {
//	return models.DelByUser(u.Ids)
//}

