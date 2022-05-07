package dto

type PriceGroup struct {
	CostPrice   float64 `json:"costPrice"`
	StoreFreePostage   float64 `json:"storeFreePostage"`
	StorePostage   float64 `json:"storePostage"`
	TotalPrice   float64 `json:"totalPrice"`
	VipPrice   float64 `json:"vipPrice"`
	PayIntegral   int `json:"payIntegral"`
}
