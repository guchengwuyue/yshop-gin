package params

import (
	"github.com/astaxie/beego/validation"
)

type HLoginParam struct {
	Username string `json:"username"`
	Password string `json:"password"`
	Spread string `json:"spread"`
}

func (p *HLoginParam) Valid(v *validation.Validation)  {
	if vv := v.Phone(p.Username,"yshop-warning"); !vv.Ok {
		vv.Message("手机格式不对")
	}
}
