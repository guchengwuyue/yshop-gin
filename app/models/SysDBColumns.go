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

type SysDBColumns struct {
	TableSchema            string `gorm:"column:TABLE_SCHEMA" json:"tableSchema"`
	TableName              string `gorm:"column:TABLE_NAME" json:"tableName"`
	ColumnName             string `gorm:"column:COLUMN_NAME" json:"columnName"`
	ColumnDefault          string `gorm:"column:COLUMN_DEFAULT" json:"columnDefault"`
	IsNullable             string `gorm:"column:IS_NULLABLE" json:"isNullable"`
	DataType               string `gorm:"column:DATA_TYPE" json:"dataType"`
	CharacterMaximumLength string `gorm:"column:CHARACTER_MAXIMUM_LENGTH" json:"characterMaximumLength"`
	CharacterSetName       string `gorm:"column:CHARACTER_SET_NAME" json:"characterSetName"`
	ColumnType             string `gorm:"column:COLUMN_TYPE" json:"columnType"`
	ColumnKey              string `gorm:"column:COLUMN_KEY" json:"columnKey"`
	Extra                  string `gorm:"column:EXTRA" json:"extra"`
	ColumnComment          string `gorm:"column:COLUMN_COMMENT" json:"columnComment"`
}

func GetAllDBColumns(name string) ([]SysDBColumns, error) {
	var data []SysDBColumns
	table := new(gorm.DB)
	table = db.Table("information_schema.columns")
	table = table.Where("table_schema= ? ", global.YSHOP_CONFIG.Database.Name)

	table = table.Where("TABLE_NAME = ?", name).Order("ORDINAL_POSITION asc")

	if err := table.Find(&data).Error; err != nil {
		return data, err
	}
	return data, nil
}
