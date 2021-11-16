package casbin

import (
	"github.com/casbin/casbin"
	gormadapter "github.com/casbin/gorm-adapter"
	"github.com/jinzhu/gorm"
	"yixiang.co/go-mall/pkg/constant"
	//"yixiang.co/go-mall/pkg/logging"
	"yixiang.co/go-mall/pkg/runtime"
)

func InitCasbin(db *gorm.DB) {
	a := gormadapter.NewAdapterByDB(db)

	e := casbin.NewSyncedEnforcer("conf/rbac_model.conf", a)
	e.LoadPolicy()

	runtime.Runtime.SetCasbin(constant.YSHOP_CASBIN, e)
}
