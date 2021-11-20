/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package models

type SysRolesDepts struct {
	Id int64
	RoleId *SysRole `gorm:"column:sys_role_id;association_autoupdate:false;association_autocreate:false"`
	DeptId *SysDept `gorm:"column:sys_dept_id;association_autoupdate:false;association_autocreate:false"`
}




