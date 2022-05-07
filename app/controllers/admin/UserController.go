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
	"yixiang.co/go-mall/app/service/user_service"
	dto2 "yixiang.co/go-mall/app/service/user_service/dto"
	"yixiang.co/go-mall/pkg/app"
	"yixiang.co/go-mall/pkg/constant"
	"yixiang.co/go-mall/pkg/jwt"
	"yixiang.co/go-mall/pkg/logging"
	"yixiang.co/go-mall/pkg/upload"
	"yixiang.co/go-mall/pkg/util"
)


// 用户 API
type UserController struct {
}


// @Title 用户列表
// @Description 用户列表
// @Success 200 {object} app.Response
// @router / [get]
func (e *UserController) GetAll(c *gin.Context) {
	var (
		appG = app.Gin{C: c}
	)
	deptId := com.StrTo(c.DefaultQuery("deptId","-1")).MustInt64()
	enabled := com.StrTo(c.DefaultQuery("enabled","-1")).MustInt()
	blurry := c.DefaultQuery("blurry","")

	userService := user_service.User{
		Username: blurry,
		DeptId: deptId,
		Enabled: enabled,
		PageSize: util.GetSize(c),
		PageNum: util.GetPage(c),
	}

	vo := userService.GetUserAll()
	appG.Response(http.StatusOK,constant.SUCCESS,vo)
}

// @Title 用户添加
// @Description 用户添加
// @Success 200 {object} app.Response
// @router / [post]
func (e *UserController) Post(c *gin.Context)  {
	var (
		model models.SysUser
		appG = app.Gin{C: c}
	)
	httpCode, errCode := app.BindAndValid(c,&model)
	if errCode != constant.SUCCESS {
		appG.Response(httpCode,errCode,nil)
		return
	}
	userService := user_service.User{
		M: &model,
	}

	if err := userService.Insert(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)

}
//
// @Title 用户编辑
// @Description 用户编辑
// @Success 200 {object} app.Response
// @router / [put]
func (e *UserController) Put(c *gin.Context)  {
	var (
		model models.SysUser
		appG = app.Gin{C: c}
	)
	httpCode, errCode := app.BindAndValid(c,&model)
	if errCode != constant.SUCCESS {
		appG.Response(httpCode,errCode,nil)
		return
	}
	userService := user_service.User{
		M: &model,
	}

	if err := userService.Save(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)
}

// @Title 用户删除
// @Description 用户删除
// @Success 200 {object} app.Response
// @router / [delete]
func (e *UserController) Delete(c *gin.Context) {
	var (
		ids []int64
		appG = app.Gin{C: c}
	)
	c.BindJSON(&ids)
	userService := user_service.User{Ids: ids}

	if err := userService.Del(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)

}

// @Title 用户上传图像
// @Description 用户上传图像
// @Success 200 {object} app.Response
// @router /updateAvatar [post]
func (e *UserController) Avatar(c *gin.Context)  {
	appG := app.Gin{C: c}
	file, image, err := c.Request.FormFile("file")
	if err != nil {
		logging.Warn(err)
		appG.Response(http.StatusInternalServerError, constant.ERROR, nil)
		return
	}

	if image == nil {
		appG.Response(http.StatusBadRequest, constant.INVALID_PARAMS, nil)
		return
	}

	imageName := upload.GetImageName(image.Filename)
	fullPath := upload.GetImageFullPath()
	src := fullPath + imageName

	if !upload.CheckImageExt(imageName) || !upload.CheckImageSize(file) {
		appG.Response(http.StatusBadRequest, constant.ERROR_UPLOAD_CHECK_IMAGE_FORMAT, nil)
		return
	}

	err = upload.CheckImage(fullPath)
	if err != nil {
		logging.Warn(err)
		appG.Response(http.StatusInternalServerError, constant.ERROR_UPLOAD_CHECK_IMAGE_FAIL, nil)
		return
	}

	if err := c.SaveUploadedFile(image, src); err != nil {
		logging.Warn(err)
		appG.Response(http.StatusInternalServerError, constant.ERROR_UPLOAD_SAVE_IMAGE_FAIL, nil)
		return
	}


	uid, _ := jwt.GetAdminUserId(c)
	userService := user_service.User{ImageUrl: upload.GetImageFullUrl(imageName),Id: uid}
	if err := userService.UpdateImage(); err != nil {
		appG.Response(http.StatusInternalServerError,err.Error(),nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)
}
//
// @Title 用户修改密码
// @Description 用户修改密码
// @Success 200 {object} app.Response
// @router /updatePass [post]
func (e *UserController) Pass(c *gin.Context)  {
	var (
		model dto2.UserPass
		appG  = app.Gin{C: c}
	)
	httpCode, errCode := app.BindAndValid(c,&model)
	if errCode != constant.SUCCESS {
		appG.Response(httpCode,errCode,nil)
		return
	}
	uid, _ := jwt.GetAdminUserId(c)
	userService := user_service.User{UserPass: model,Id: uid}
	if err := userService.UpdatePass(); err != nil {
		appG.Response(http.StatusInternalServerError,err.Error(),nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)
}


// @Title 用户修改个人信息
// @Description 用户修改个人信息
// @Success 200 {object} app.Response
// @router /center [put]
func (e *UserController) Center(c *gin.Context)  {
	var (
		model dto2.UserPost
		appG  = app.Gin{C: c}
	)
	httpCode, errCode := app.BindAndValid(c,&model)
	if errCode != constant.SUCCESS {
		appG.Response(httpCode,errCode,nil)
		return
	}
	uid, _ := jwt.GetAdminUserId(c)
	userService := user_service.User{UserPost: model,Id: uid}
	if err := userService.UpdateProfile(); err != nil {
		appG.Response(http.StatusInternalServerError,constant.FAIL_ADD_DATA,nil)
		return
	}

	appG.Response(http.StatusOK,constant.SUCCESS,nil)
}

// @Summary Import Image
// @Produce  json
// @Param image formData file true "Image File"
// @Success 200 {object} app.Response
// @Failure 500 {object} app.Response
// @Router /upload [post]
func UploadImage(c *gin.Context) {
	appG := app.Gin{C: c}
	file, image, err := c.Request.FormFile("image")
	if err != nil {
		logging.Warn(err)
		appG.Response(http.StatusInternalServerError, constant.ERROR, nil)
		return
	}

	if image == nil {
		appG.Response(http.StatusBadRequest, constant.INVALID_PARAMS, nil)
		return
	}

	imageName := upload.GetImageName(image.Filename)
	fullPath := upload.GetImageFullPath()
	savePath := upload.GetImagePath()
	src := fullPath + imageName

	if !upload.CheckImageExt(imageName) || !upload.CheckImageSize(file) {
		appG.Response(http.StatusBadRequest, constant.ERROR_UPLOAD_CHECK_IMAGE_FORMAT, nil)
		return
	}

	err = upload.CheckImage(fullPath)
	if err != nil {
		logging.Warn(err)
		appG.Response(http.StatusInternalServerError, constant.ERROR_UPLOAD_CHECK_IMAGE_FAIL, nil)
		return
	}

	if err := c.SaveUploadedFile(image, src); err != nil {
		logging.Warn(err)
		appG.Response(http.StatusInternalServerError, constant.ERROR_UPLOAD_SAVE_IMAGE_FAIL, nil)
		return
	}

	appG.Response(http.StatusOK, constant.SUCCESS, map[string]string{
		"image_url":      upload.GetImageFullUrl(imageName),
		"image_save_url": savePath + imageName,
	})
}