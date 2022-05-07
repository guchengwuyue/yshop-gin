package dto

type StoreProduct struct {
	Id           int64           `json:"id"`
	Image        string          `json:"image" valid:"Required;"`
	SliderImage  []string        `json:"slider_image" valid:"Required;"`
	StoreName    string          `json:"store_name" valid:"Required;"`
	StoreInfo    string          `json:"store_info"`
	Keyword      string          `json:"keyword" valid:"Required;"`
	CateId       int             `json:"cate_id" valid:"Required;"`
	Price        float64         `json:"price" valid:"Required;"`
	OtPrice      float64         `json:"otPrice" valid:"Required;"`
	Postage      float64         `json:"postage" valid:"Required;"`
	UnitName     string          `json:"unit_name" valid:"Required;"`
	Sort         int16           `json:"sort"`
	Sales        int32           `json:"sales"`
	Stock        int32           `json:"stock"`
	IsShow       int8            `json:"is_show"`
	IsHot        int8            `json:"is_hot"`
	IsBenefit    int8            `json:"is_benefit"`
	IsBest       int8            `json:"is_best"`
	IsNew        int8            `json:"is_new"`
	Description  string          `json:"description" valid:"Required;"`
	IsPostage    int8            `json:"is_postage"`
	GiveIntegral int         `json:"give_integral"`
	Cost         int         `json:"cost""`
	IsGood       int8            `json:"is_good"`
	Ficti        int32           `json:"ficti"`
	SpecType     int8            `json:"spec_type"`
	Items        []FormatDetail  `json:"items"`
	Attrs        []ProductFormat `json:"attrs"`
}
