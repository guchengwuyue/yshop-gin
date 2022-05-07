package params

import "github.com/astaxie/beego/validation"

type RelationParam struct {
	Id int64 `json:"id"`
	Category string `json:"category"`
}

func (p *RelationParam) Valid(v *validation.Validation)  {
	if vv := v.Required(p.Id,"yshop-warning"); !vv.Ok {
		vv.Message("参数有误")
		return
	}
}
