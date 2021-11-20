/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package models

type SysUsersRoles struct {
	Id int64
	UserId int64 `gorm:"column:sys_user_id;"`
	RoleId int64 `gorm:"column:sys_role_id;"`
}

