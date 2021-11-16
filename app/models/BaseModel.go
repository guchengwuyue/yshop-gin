/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package models

import (
	"fmt"

	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	"log"
	"strconv"
	"time"
	"yixiang.co/go-mall/pkg/casbin"
	"yixiang.co/go-mall/pkg/setting"
)

var db *gorm.DB

type BaseModel struct {
	Id int64 `gorm:"primary_key" json:"id"`
	UpdateTime time.Time `json:"updateTime"`
	CreateTime time.Time `json:"createTime"`
	IsDel int8 `json:"isDel"`
}

// Setup initializes the database instance
func Setup() {
	var err error
	db, err = gorm.Open(setting.DatabaseSetting.Type, fmt.Sprintf("%s:%s@tcp(%s)/%s?charset=utf8&parseTime=True&loc=Local",
		setting.DatabaseSetting.User,
		setting.DatabaseSetting.Password,
		setting.DatabaseSetting.Host,
		setting.DatabaseSetting.Name))

	if err != nil {
		log.Fatalf("models.Setup err: %v", err)
	}

	casbin.InitCasbin(db)

	gorm.DefaultTableNameHandler = func(db *gorm.DB, defaultTableName string) string {
		return setting.DatabaseSetting.TablePrefix + defaultTableName
	}

	db.LogMode(true)
	db.SingularTable(true)
	db.DB().SetMaxIdleConns(10)
	db.DB().SetMaxOpenConns(100)
}

// CloseDB closes database connection (unnecessary)
func CloseDB() {
	defer db.Close()
}



// addExtraSpaceIfExist adds a separator
func addExtraSpaceIfExist(str string) string {
	if str != "" {
		return " " + str
	}
	return ""
}

/**
* 分页函数，适用任何表
* 返回 总记录条数,总页数,以及当前请求的数据RawSeter,调用中需要"rs.QueryRows(&tblog)"就行了  --tblog是一个Tb_log对象
* 参数：表名，当前页数，页面大小，条件（查询条件,格式为 " and name='zhifeiya' and age=12 "）
*/
func GetPagesInfo(tableName string, currentpage int, pagesize int, conditions string) (int, int, *gorm.DB) {
	if currentpage <= 1 {
		currentpage = 1
	}
	if pagesize == 0 {
		pagesize = 20
	}
	var rs *gorm.DB
	var totalItem, totalpages int = 0, 0
	//var totals = make([]int,0)
	//总条数,总页数
	db.Raw("SELECT count(*) FROM " + tableName + "  where is_del=0 " + conditions).Count(&totalItem) //获取总条数
	if totalItem <= pagesize {
		totalpages = 1
	} else if totalItem > pagesize {
		temp := totalItem / pagesize
		if (totalItem % pagesize) != 0 {
			temp = temp + 1
		}
		totalpages = temp
	}
	rs = db.Raw("select *  from  " + tableName + "  where is_del=0 " + conditions +  " order by id desc " +
		" LIMIT " + strconv.Itoa((currentpage-1)*pagesize) + "," + strconv.Itoa(pagesize))
	return totalItem, totalpages, rs
}


