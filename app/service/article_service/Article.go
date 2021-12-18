/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package article_service

import (
	"errors"
	"github.com/silenceper/wechat/v2/officialaccount/material"
	"strings"
	"yixiang.co/go-mall/app/models"
	"yixiang.co/go-mall/app/models/vo"
	articleEnum "yixiang.co/go-mall/pkg/enums/article"
	"yixiang.co/go-mall/pkg/global"
)

type Article struct {
	Id int64
	Name string

	Enabled int

	PageNum int
	PageSize int

	M *models.YshopWechatArticle

	Ids []int64

}

func (d *Article) Get() vo.ResultList {
	var data models.YshopWechatArticle
	err := global.YSHOP_DB.Model(&models.YshopWechatArticle{}).Where("id = ?",d.Id).First(&data).Error
	if err != nil {
		global.YSHOP_LOG.Error(err)
	}
	return vo.ResultList{Content: data,TotalElements: 0}
}

func (d *Article) GetAll() vo.ResultList {
	maps := make(map[string]interface{})
	if d.Name != "" {
		maps["name"] = d.Name
	}

	total,list := models.GetAllWechatArticle(d.PageNum,d.PageSize,maps)
	return vo.ResultList{Content: list,TotalElements: total}
}

func (d *Article) Pub() error {
	var data models.YshopWechatArticle
	err := global.YSHOP_DB.Model(&models.YshopWechatArticle{}).Where("id = ?",d.Id).First(&data).Error
	if err != nil {
		global.YSHOP_LOG.Error(err)
	}
	if data.IsPub == articleEnum.IS_PUB_1{
		return errors.New("已经发布过啦！")
	}
	official := global.YSHOP_OFFICIAL_ACCOUNT
	m := official.GetMaterial()
	ss := strings.Replace(data.Image, global.YSHOP_CONFIG.App.PrefixUrl + "/", global.YSHOP_CONFIG.App.RuntimeRootPath, 1)
	mediaId,url,err := m.AddMaterial(material.MediaTypeThumb,ss)
	if err != nil {
		global.YSHOP_LOG.Error(err)
		return err
	}
	global.YSHOP_LOG.Info(mediaId,url)
	art := &material.Article{
		Title: data.Title,
		ThumbMediaID: mediaId,
		ThumbURL: url,
		Author: data.Author,
		Digest: data.Synopsis,
		ShowCoverPic: 1,
		Content: data.Content,
		ContentSourceURL: "",
	}
	arts := []*material.Article{art}
	id,err := m.AddNews(arts)
	global.YSHOP_LOG.Info(id,err)
	if err != nil {
		global.YSHOP_LOG.Error(err)
		return err
	}

	data.MediaId = id
	data.IsPub = articleEnum.IS_PUB_1

	return models.UpdateByWechatArticle(&data)
}

func (d *Article) Insert() error {
	return models.AddWechatArticle(d.M)
}

func (d *Article) Save() error {
	return models.UpdateByWechatArticle(d.M)
}

func (d *Article) Del() error {
	return models.DelByWechatArticle(d.Ids)
}