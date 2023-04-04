/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package models

type SysColumns struct {
	TableId       int64  `json:"tableId"`
	ColumnName    string `json:"columnName"`
	ColumnComment string `json:"columnComment"`
	ColumnType    string `json:"columnType"`
	GoType        string `json:"goType"`
	GoField       string `json:"goField"`
	JsonField     string `json:"jsonField"`
	IsPk          string `json:"isPk"`
	IsIncrement   string `json:"isIncrement"`
	IsRequired    string `json:"isRequired"`
	IsQuery       string `json:"isQuery"`
	QueryType     string `json:"queryType"`
	HtmlType      string `json:"htmlType"`
	DictType      string `json:"dictType"`
	List          string `json:"list"`
	Pk            bool   `json:"pk"`
	Required      bool   `json:"required"`
	FormShow      bool   `json:"formShow"`
	ListShow      bool   `json:"listShow"`
	SuperColumn   bool   `json:"superColumn"`
	UsableColumn  bool   `json:"usableColumn"`
	Query         bool   `json:"query"`
	Remark        string `json:"remark"`
	BaseModel
}

func UpdateByColumn(m *SysColumns) error {
	var err error
	err = db.Save(m).Error
	if err != nil {
		return err
	}

	return err
}
