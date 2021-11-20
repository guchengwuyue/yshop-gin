package vo

type ResultList struct {
	Content       interface{} `json:"content"`
	TotalElements int64         `json:"totalElements"`
	ExtendData    interface{} `json:"extendData"`
}
