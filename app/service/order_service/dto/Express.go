package dto

type Express struct {
	OrderCode  int64  `json:"orderCode"`
	ShipperCode string `json:"shipperCode"`
	LogisticCode      string      `json:"logisticCode"`
}
