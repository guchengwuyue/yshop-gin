package dto

import "time"

type ProductRule struct {
	Id         int64         `json:"id"`
	RuleName   string        `json:"ruleName" valid:"Required;"`
	RuleValue  []interface{} `json:"ruleValue" valid:"Required;"`
	CreateTime time.Time     `json:"createTime"`
}
