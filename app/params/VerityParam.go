package params

import "github.com/astaxie/beego/validation"

type VerityParam struct {
	Phone string `json:"phone"`
	Type string `json:"type"`
}

func (p *VerityParam) Valid(v *validation.Validation)  {
	if vv := v.Phone(p.Phone,"yshop-warning"); !vv.Ok {
		vv.Message("手机格式不对")
	}
}
