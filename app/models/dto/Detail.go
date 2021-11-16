package dto

type Detail struct {
	Data []string                       `json:"data"`
	Res  []map[string]map[string]string `json:"res"`
}
