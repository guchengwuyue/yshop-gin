package dto

type ProductFormat struct {
	Brokerage    string            `json:"brokerage"`
	BrokerageTwo string            `json:"brokerage_two"`
	Price        string            `json:"price" valid:"Required;"`
	OtPrice      string            `json:"ot_price" valid:"Required;"`
	Postage      string            `json:"postage" valid:"Required;"`
	Cost         string            `json:"cost"`
	Stock        string            `json:"stock"`
	Pic          string            `json:"pic"`
	Value1       string            `json:"value1"`
	Value2       string            `json:"value2"`
	Weight       string            `json:"weight"`
	Volume       string            `json:"volume"`
	Detail       map[string]string `json:"detail"`
}
