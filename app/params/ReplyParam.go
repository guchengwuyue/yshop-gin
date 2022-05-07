/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package params

type ReplyParam struct {
	Comment    string `json:"comment"`
	Pics     string `json:"pics"`
	ProductScore  int    `json:"productScore"`
	ServiceScore        int `json:"serviceScore"`
	Unique    string `json:"unique"`
	ProductId    int64 `json:"productId"`

}



