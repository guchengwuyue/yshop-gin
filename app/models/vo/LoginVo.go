package vo

import "yixiang.co/go-mall/app/models"

type LoginVo struct {
	Token string         `json:"token"`
	User *models.SysUser `json:"user"`
}
