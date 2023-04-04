/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package gen_service

import (
	"bytes"
	"github.com/alecthomas/template"
	"github.com/gin-gonic/gin"
	"strings"
	"yixiang.co/go-mall/app/models"
	"yixiang.co/go-mall/app/models/vo"
	"yixiang.co/go-mall/app/params/admin"
	"yixiang.co/go-mall/pkg/file"
	"yixiang.co/go-mall/pkg/global"
	"yixiang.co/go-mall/pkg/util"
)

type Gen struct {
	Id   int64
	Name string

	Enabled int

	PageNum  int
	PageSize int

	GenTableParan *admin.GenTableParan

	Table   *models.SysTables
	Columns []models.SysColumns

	Ids []int64

	TableId int64
}

// 获取所有表
func (d *Gen) GetDBTablesAll() vo.ResultList {
	maps := make(map[string]interface{})
	if d.Name != "" {
		maps["TABLE_NAME"] = d.Name
	}

	total, list := models.GetAllDBTables(d.PageNum, d.PageSize, maps)
	return vo.ResultList{Content: list, TotalElements: total}
}

// 导入表
func (d *Gen) Insert() error {
	var (
		sysTables models.SysTables
	)

	var err error
	tx := global.YSHOP_DB.Begin()
	defer func() {
		if err != nil {
			tx.Rollback()
		} else {
			tx.Commit()
		}
	}()

	dbTable, err := models.GetOneDBTable(d.GenTableParan.TableName)

	sysTables.TBName = d.GenTableParan.TableName

	//分割表名字
	tableNameList := strings.Split(d.GenTableParan.TableName, "_")
	for i := 0; i < len(tableNameList); i++ {
		strStart := string([]byte(tableNameList[i])[:1])
		strEnd := string([]byte(tableNameList[i])[1:])

		sysTables.ClassName += strings.ToUpper(strStart) + strEnd

		if i > 0 && i < len(tableNameList)-1 {
			sysTables.BusinessName += tableNameList[i] + "_"
		} else if i == len(tableNameList)-1 {
			sysTables.BusinessName += tableNameList[i]
		}

	}
	//sysTables.BusinessName = sysTables.ClassName
	sysTables.PackageName = "admin"
	sysTables.TplCategory = "crud"
	sysTables.ModuleName = sysTables.ClassName
	if dbTable.TableComment == "" {
		sysTables.TableComment = sysTables.ClassName
	} else {
		sysTables.TableComment = dbTable.TableComment
	}

	sysTables.FunctionName = sysTables.TableComment
	sysTables.FunctionAuthor = "yshop"

	//添加表
	err = tx.Model(&models.SysTables{}).Create(&sysTables).Error

	global.YSHOP_LOG.Error(sysTables)
	global.YSHOP_LOG.Error(err)
	if err != nil {
		return err
	}
	sysDbColumns, err := models.GetAllDBColumns(d.GenTableParan.TableName)

	sysColumnList := make([]models.SysColumns, 0)
	for i := 0; i < len(sysDbColumns); i++ {
		var column models.SysColumns
		column.TableId = sysTables.Id
		column.ColumnComment = sysDbColumns[i].ColumnComment
		column.ColumnName = sysDbColumns[i].ColumnName
		column.ColumnType = sysDbColumns[i].ColumnType
		column.QueryType = "EQ"
		column.IsPk = "0"

		namelist := strings.Split(sysDbColumns[i].ColumnName, "_")
		for i := 0; i < len(namelist); i++ {
			strStart := string([]byte(namelist[i])[:1])
			strend := string([]byte(namelist[i])[1:])
			column.GoField += strings.ToUpper(strStart) + strend
			if i == 0 {
				column.JsonField = strings.ToLower(strStart) + strend
			} else {
				column.JsonField += strings.ToUpper(strStart) + strend
			}
		}
		if strings.Contains(sysDbColumns[i].ColumnKey, "PR") {
			column.IsPk = "1"
			column.Pk = true
		}
		column.IsRequired = "0"
		if strings.Contains(sysDbColumns[i].IsNullable, "NO") {
			column.IsRequired = "1"
			column.Required = true
		}

		if strings.Contains(sysDbColumns[i].ColumnType, "int") {
			if strings.Contains(sysDbColumns[i].ColumnKey, "PR") {
				column.GoType = "int"
			} else {
				column.GoType = "string"
			}
			column.HtmlType = "input"
		} else if strings.Contains(sysDbColumns[i].ColumnType, "timestamp") {
			column.GoType = "time.Time"
			column.HtmlType = "datetime"
		} else if strings.Contains(sysDbColumns[i].ColumnType, "datetime") {
			column.GoType = "time.Time"
			column.HtmlType = "datetime"
		} else {
			column.GoType = "string"
			column.HtmlType = "input"
		}

		sysColumnList = append(sysColumnList, column)
	}

	//批量添加列
	err = tx.Model(&models.SysColumns{}).Create(sysColumnList).Error
	if err != nil {
		return err
	}

	return nil
}

// 获取已经导入的表
func (d *Gen) GetTablesAll() vo.ResultList {
	maps := make(map[string]interface{})
	if d.Name != "" {
		maps["table_name"] = d.Name
	}

	total, list := models.GetAllTables(d.PageNum, d.PageSize, maps)
	return vo.ResultList{Content: list, TotalElements: total}
}

// 获取表
func (d *Gen) GetTableInfo() vo.ResultList {
	maps := make(map[string]interface{})
	if d.Name != "" {
		maps["table_name"] = d.Name
	}
	var data models.SysTables
	global.YSHOP_DB.Where(maps).First(&data)
	return vo.ResultList{Content: data}
}

// 获取表的所有列
func (d *Gen) GetTableColumns() vo.ResultList {
	maps := make(map[string]interface{})
	if d.Name != "" {
		maps["table_name"] = d.Name
	}
	var data models.SysTables
	global.YSHOP_DB.Where(maps).First(&data)

	var list []models.SysColumns
	global.YSHOP_DB.Where("table_id = ?", data.Id).Find(&list)

	return vo.ResultList{Content: list}
}

func (d *Gen) TableSave() error {
	return models.UpdateByTables(d.Table)
}

func (d *Gen) ColumnSave() error {
	for _, val := range d.Columns {
		err := models.UpdateByColumn(&val)
		if err != nil {
			global.YSHOP_LOG.Error(err)
			return err
		}
	}
	return nil
}

//func (d *Gen) Del() error {
//	return models.DelByUserAddress(d.Ids)
//}

func (d *Gen) Preview() map[string]interface{} {
	//读取模板
	controllerTemp, err := template.ParseFiles("template/controller.go.template")
	if err != nil {
		global.YSHOP_LOG.Error(err)
	}
	modeleTemp, err := template.ParseFiles("template/model.go.template")
	if err != nil {
		global.YSHOP_LOG.Error(err, modeleTemp)
	}

	serviceTemp, err := template.ParseFiles("template/service.go.template")
	if err != nil {
		global.YSHOP_LOG.Error(err, serviceTemp)
	}

	vueTemp, err := template.ParseFiles("template/vue.go.template")
	if err != nil {
		global.YSHOP_LOG.Error(err, vueTemp)
	}
	jsTemp, err := template.ParseFiles("template/js.go.template")
	if err != nil {
		global.YSHOP_LOG.Error(err, jsTemp)
	}
	var (
		data models.SysTables
		list []models.SysColumns
	)
	global.YSHOP_DB.Where("table_name = ?", d.Name).First(&data)
	global.YSHOP_DB.Where("table_id = ?", data.Id).Find(&list)
	data.Columns = list

	//绑定数据
	var controllerByte bytes.Buffer
	controllerTemp.Execute(&controllerByte, data)

	var modelByte bytes.Buffer
	modeleTemp.Execute(&modelByte, data)

	var serviceByte bytes.Buffer
	serviceTemp.Execute(&serviceByte, data)

	var vueByte bytes.Buffer
	vueTemp.Execute(&vueByte, data)

	var jsByte bytes.Buffer
	jsTemp.Execute(&jsByte, data)

	// 去除换行符
	str := util.TrimSpace(modelByte.String())
	returnMap := gin.H{
		"controller": controllerByte.String(),
		"model":      str,
		"service":    serviceByte.String(),
		"vue":        util.TrimSpace(vueByte.String()),
		"js":         jsByte.String(),
	}
	return returnMap
}

func (d *Gen) GenCode() {
	//读取模板
	controllerTemp, err := template.ParseFiles("template/controller.go.template")
	if err != nil {
		global.YSHOP_LOG.Error(err)
	}
	modeleTemp, err := template.ParseFiles("template/model.go.template")
	if err != nil {
		global.YSHOP_LOG.Error(err, modeleTemp)
	}

	serviceTemp, err := template.ParseFiles("template/service.go.template")
	if err != nil {
		global.YSHOP_LOG.Error(err, serviceTemp)
	}

	vueTemp, err := template.ParseFiles("template/vue.go.template")
	if err != nil {
		global.YSHOP_LOG.Error(err, vueTemp)
	}
	jsTemp, err := template.ParseFiles("template/js.go.template")
	if err != nil {
		global.YSHOP_LOG.Error(err, jsTemp)
	}
	var (
		data models.SysTables
		list []models.SysColumns
	)
	global.YSHOP_DB.Where("table_name = ?", d.Name).First(&data)
	global.YSHOP_DB.Where("table_id = ?", data.Id).Find(&list)
	data.Columns = list

	//绑定数据
	var controllerByte bytes.Buffer
	controllerTemp.Execute(&controllerByte, data)

	var modelByte bytes.Buffer
	modeleTemp.Execute(&modelByte, data)

	var serviceByte bytes.Buffer
	serviceTemp.Execute(&serviceByte, data)

	var vueByte bytes.Buffer
	vueTemp.Execute(&vueByte, data)

	var jsByte bytes.Buffer
	jsTemp.Execute(&jsByte, data)

	// 去除换行符
	str := util.TrimSpace(modelByte.String())
	str2 := util.TrimSpace(vueByte.String())

	//创建目录
	file.MkDir("./template/code/" + data.PackageName + "/controller/")
	file.MkDir("./template/code/" + data.PackageName + "/models/")
	file.MkDir("./template/code/" + data.PackageName + "/service/")
	file.MkDir("./template/code/" + data.PackageName + "/vue/")
	file.MkDir("./template/code/" + data.PackageName + "/js/")

	//写入文件
	file.FileCreate(controllerByte, "./template/code/"+data.PackageName+"/controller/"+data.ClassName+"Controller.go")
	file.FileCreate(*bytes.NewBufferString(str), "./template/code/"+data.PackageName+"/models/"+data.ClassName+".go")
	file.FileCreate(serviceByte, "./template/code/"+data.PackageName+"/service/"+data.ClassName+".go")
	file.FileCreate(*bytes.NewBufferString(str2), "./template/code/"+data.PackageName+"/vue/"+data.ClassName+".vue")
	file.FileCreate(jsByte, "./template/code/"+data.PackageName+"/js/"+data.ClassName+".js")

}
