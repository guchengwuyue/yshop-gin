package dto

type OrderExtend struct {
	Key   string  `json:"key"`
	OrderId string `json:"orderId"`
	JsConfig      map[string]interface{}      `json:"jsConfig"`
}
