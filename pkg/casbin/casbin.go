package casbin

import (
	"github.com/casbin/casbin/v2"
	"github.com/casbin/casbin/v2/model"
	gormadapter "github.com/casbin/gorm-adapter/v3"
	"gorm.io/gorm"
	"log"
	"yixiang.co/go-mall/pkg/constant"
	"yixiang.co/go-mall/pkg/runtime"
)

// Initialize the model from a string.
//var text = `
//[request_definition]
//r = sub, obj, act
//
//[policy_definition]
//p = sub, obj, act
//
//[policy_effect]
//e = some(where (p.eft == allow))
//
//[matchers]
//m = r.sub == p.sub && (keyMatch2(r.obj, p.obj) || keyMatch(r.obj, p.obj)) && (r.act == p.act || p.act == "*")
//`

func InitCasbin(db *gorm.DB) {
	a, err := gormadapter.NewAdapterByDB(db)
	if err != nil{
		log.Printf("[info] casbin %s", err)
	}
    model, err := model.NewModelFromFile("conf/rbac_model.conf")
	e, err := casbin.NewSyncedEnforcer(model, a)
	if err != nil{
		log.Printf("[info] casbin %s", err)
	}
	err = e.LoadPolicy()
	if err != nil{
		log.Printf("[info] casbin %s", err)
	}

	runtime.Runtime.SetCasbin(constant.YSHOP_CASBIN, e)
}
