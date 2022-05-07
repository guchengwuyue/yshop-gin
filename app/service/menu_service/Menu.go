/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package menu_service

import (
	"yixiang.co/go-mall/app/models"
	"yixiang.co/go-mall/app/models/vo"
	mVO "yixiang.co/go-mall/app/service/menu_service/vo"
	"yixiang.co/go-mall/pkg/util"
)

type Menu struct {
	Uid int64

	Id int64
	Name string
	Enabled int

	M *models.SysMenu

	Ids []int64
}

func (m *Menu) GetTree() []models.SysMenu {
	maps := make(map[string]interface{})
	list := models.GetAllMenus(maps)
	return list
}

func (m *Menu) GetAll() vo.ResultList {
	maps := make(map[string]interface{})
	maps["is_del"] = 0
	if m.Enabled >= 0 {
		maps["enabled"] = m.Enabled
	}
	if m.Name != "" {
		maps["name"] = m.Name
	}

	list := models.GetAllMenus(maps)
	return vo.ResultList{Content: list,TotalElements: 0}
}

func (m *Menu) Insert() error {
	return models.AddMenu(m.M)
}

func (m *Menu) Save() error {
	return models.UpdateByMenu(m.M)
}

func (m *Menu) Del() error {
	return models.DelByMenu(m.Ids)
}

func (m *Menu) BuildMenus() []mVO.MenuVo {
    menus := models.BuildMenus(m.Uid)
	return buildMenus(buildTree(menus))
}


func buildTree(menus []models.SysMenu) []models.SysMenu {
	var trees []models.SysMenu
	for _, menu := range menus {
		if menu.Pid == 0 {
			trees = append(trees, menu)
		}
	}

	for k, tree := range trees {
		var child []models.SysMenu
		for _, it := range menus {
			if it.Pid == tree.Id {
				child = append(child, it)
			}
		}
		trees[k].Children = child
	}

	return trees

}

func buildMenus(menus []models.SysMenu) []mVO.MenuVo {
	var list []mVO.MenuVo
	for _, menuO := range menus {
		menuList := menuO.Children
		var menuVo = new(mVO.MenuVo)

		if menuO.ComponentName != "" {
			menuVo.Name = menuO.ComponentName
		} else {
			menuVo.Name = menuO.Name
		}
		if menuO.Pid == 0 {
			menuVo.Path = "/" + menuO.Path
		} else {
			menuVo.Path = menuO.Path
		}

		if menuO.Hidden == 1 {
			menuVo.Hidden = true
		} else {
			menuVo.Hidden = false
		}

		//判断不是外链
		if menuO.IFrame == 0 {
			if menuO.Pid == 0 {
				if menuO.Component == "" {
					menuVo.Component = "Layout"
				} else {
					menuVo.Component = menuO.Component
				}
			} else if menuO.Component != "" {
				menuVo.Component = menuO.Component
			}
		}

		menuVo.Meta = mVO.MenuMetaVo{Title: menuO.Name, Icon: menuO.Icon, NoCache: !util.IntToBool(menuO.Cache)}

		if len(menuList) > 0 {
			menuVo.AlwaysShow = true
			menuVo.Redirect = "noredirect"
			menuVo.Children = buildMenus(menuList)
		} else if menuO.Pid == 0 {
			var menuVo1 = new(mVO.MenuVo)
			menuVo1.Meta = menuVo.Meta
			if menuO.IFrame == 0 {
				menuVo1.Path = "index"
				menuVo1.Name = menuVo.Name
				menuVo1.Component = menuVo.Component
			} else {
				menuVo1.Path = menuO.Path
			}
			menuVo.Name = ""
			menuVo.Meta = mVO.MenuMetaVo{}
			menuVo.Component = "Layout"
			var list1 []mVO.MenuVo
			list1 = append(list1, *menuVo1)
			menuVo.Children = list1
		}

		list = append(list, *menuVo)

	}

	return list
}
