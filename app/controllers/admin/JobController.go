/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package admin

import (
	"github.com/gin-gonic/gin"
	"github.com/unknwon/com"
	"net/http"
	"yixiang.co/go-mall/app/models"
	"yixiang.co/go-mall/app/service/job_service"
	"yixiang.co/go-mall/pkg/app"
	"yixiang.co/go-mall/pkg/constant"
	"yixiang.co/go-mall/pkg/util"
)


// 岗位api
type JobController struct {
}


// @Title 岗位列表
// @Description 岗位列表
// @Success 200 {object} app.Response
// @router / [get]
func (e *JobController) GetAll(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
	)
	enabled := com.StrTo(c.DefaultQuery("enabled","-1")).MustInt()
	name := c.DefaultQuery("blurry","")
	jobService := job_service.Job{
		Enabled: enabled,
		Name: name,
		PageSize: util.GetSize(c),
		PageNum: util.GetPage(c),
	}
	vo := jobService.GetAll()
	appG.Response(http.StatusOK,constant.SUCCESS,vo)
}

// @Title 岗位添加
// @Description 岗位添加
// @Success 200 {object} app.Response
// @router / [post]
func (e *JobController) Post(c *gin.Context)  {
	var (
		model models.SysJob
		appG = app.Gin{C: c}
	)
	httpCode, errCode := app.BindAndValid(c,&model)
	if errCode != constant.SUCCESS {
		appG.Response(httpCode,errCode,nil)
		return
	}
	jobService := job_service.Job{
		M: &model,
	}

	if err := jobService.Insert(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)

}

// @Title 岗位修改
// @Description 岗位修改
// @Success 200 {object} app.Response
// @router / [put]
func (e *JobController) Put(c *gin.Context)  {
	var (
		model models.SysJob
		appG = app.Gin{C: c}
	)
	httpCode, errCode := app.BindAndValid(c,&model)
	if errCode != constant.SUCCESS {
		appG.Response(httpCode,errCode,nil)
		return
	}
	jobService := job_service.Job{
		M: &model,
	}

	if err := jobService.Save(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)
}

// @Title 岗位删除
// @Description 岗位删除
// @Success 200 {object} app.Response
// @router / [delete]
func (e *JobController) Delete(c *gin.Context) {
	var (
		ids []int64
		appG = app.Gin{C: c}
	)
	c.BindJSON(&ids)
	jobService := job_service.Job{Ids: ids}

	if err := jobService.Del(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)
}