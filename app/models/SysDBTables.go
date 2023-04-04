/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package models

import (
	"gorm.io/gorm"
	"yixiang.co/go-mall/pkg/global"
)

type SysDBTables struct {
	TableName    string `gorm:"column:TABLE_NAME" json:"tableName"`
	Engine       string `gorm:"column:ENGINE" json:"engine"`
	TableRows    string `gorm:"column:TABLE_ROWS" json:"tableRows"`
	CreateTime   string `gorm:"column:CREATE_TIME" json:"createTime"`
	UpdateTime   string `gorm:"column:UPDATE_TIME" json:"updateTime"`
	TableComment string `gorm:"column:TABLE_COMMENT" json:"tableComment"`
}

func GetAllDBTables(pageNUm int, pageSize int, maps interface{}) (int64, []SysDBTables) {
	var (
		total int64
		lists []SysDBTables
	)
	table := new(gorm.DB)
	table = global.YSHOP_DB.Table("information_schema.tables")
	table = table.Where("TABLE_NAME not in (select table_name from `" + global.YSHOP_CONFIG.Database.Name + "`.sys_tables) ")
	table = table.Where("table_schema= ? ", global.YSHOP_CONFIG.Database.Name)

	table.Where(maps).Count(&total)
	table.Where(maps).Offset(pageNUm).Limit(pageSize).Find(&lists)

	return total, lists
}

func GetOneDBTable(name string) (SysDBTables, error) {
	var (
		data SysDBTables
	)
	table := new(gorm.DB)
	table = global.YSHOP_DB.Table("information_schema.tables")
	table = table.Where("table_schema= ? ", global.YSHOP_CONFIG.Database.Name)
	table = table.Where("TABLE_NAME = ? ", name)

	if err := table.First(&data).Error; err != nil {
		return data, err
	}

	return data, nil
}
