/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package models

type SysTables struct {
	TBName          string       `gorm:"column:table_name" json:"tableName"` //表名称
	MLTBName        string       `gorm:"-" json:"-"`
	TableComment    string       `json:"tableComment"`    //表备注
	ClassName       string       `json:"className"`       //类名
	TplCategory     string       `json:"tplCategory"`     //
	PackageName     string       `json:"packageName"`     //包名
	ModuleName      string       `json:"moduleName"`      //go文件名
	ModuleFrontName string       `json:"moduleFrontName"` //前端文件名
	BusinessName    string       `json:"businessName"`    //
	FunctionName    string       `json:"functionName"`
	FunctionAuthor  string       `json:"functionAuthor"`
	Crud            bool         `json:"crud"`
	Remark          string       `json:"remark"`
	IsDataScope     int          `json:"isDataScope"`
	IsActions       int          `json:"isActions"`
	IsAuth          int          `json:"isAuth"`
	Columns         []SysColumns `gorm:"-" json:"columns"`
	BaseModel
}

func GetAllTables(pageNUm int, pageSize int, maps interface{}) (int64, []SysTables) {
	var (
		total int64
		lists []SysTables
	)
	db.Model(&SysTables{}).Where(maps).Count(&total)
	db.Where(maps).Offset(pageNUm).Limit(pageSize).Find(&lists)

	return total, lists

	return total, lists
}

func UpdateByTables(m *SysTables) error {
	var err error
	err = db.Save(m).Error
	if err != nil {
		return err
	}

	return err
}
