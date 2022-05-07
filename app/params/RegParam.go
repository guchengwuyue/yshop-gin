package params

import "github.com/astaxie/beego/validation"

type RegParam struct {
	Account string `json:"account"`
	Captcha string `json:"captcha"`
	Password string `json:"password"`
	Spread string `json:"spread"`
}

func (p *RegParam) Valid(v *validation.Validation)  {
	if vv := v.Phone(p.Account,"yshop-warning"); !vv.Ok {
		vv.Message("手机格式不对")
		return
	}
	if vv := v.Required(p.Captcha,"yshop-warning"); !vv.Ok {
		vv.Message("验证码必填")
		return
	}
	if vv := v.Required(p.Password,"yshop-warning"); !vv.Ok {
		vv.Message("密码必填")
		return
	}

}
