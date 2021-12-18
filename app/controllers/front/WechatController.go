/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package front

import (
	"github.com/gin-gonic/gin"
	"github.com/silenceper/wechat/v2/officialaccount/message"
	"yixiang.co/go-mall/app/service/wechat_user_service"
	"yixiang.co/go-mall/pkg/global"
	"yixiang.co/go-mall/pkg/util"
)
// 公众号服务api
type WechatController struct {
}


// @Title 公众号服务
// @Description 公众号服务
// @Success 200 {object} app.Response
// @router / [any]
func (e *WechatController) GetAll(c *gin.Context) {
	official := global.YSHOP_OFFICIAL_ACCOUNT
	server := official.GetServer(c.Request,c.Writer)

	server.SetMessageHandler(func(msg *message.MixMessage) *message.Reply {
		if msg.MsgType == message.MsgTypeEvent {
			global.YSHOP_LOG.Info(msg.Event)
			if msg.Event == message.EventSubscribe {
				//存储用户
				user := official.GetUser()
				userInfo,e := user.GetUserInfo(msg.CommonToken.GetOpenID())
				if e != nil {
					global.YSHOP_LOG.Error(e)
				}
				ip := util.GetClientIP(c)
				userSerive := wechat_user_service.User{UserInfo: userInfo,Ip: ip}
				userSerive.Insert()
			}
		}
		global.YSHOP_LOG.Info(msg.MsgType)
		text := message.NewText(msg.Content)


		return &message.Reply{MsgType: message.MsgTypeText,MsgData: text}
	})

	//处理消息接收以及回复
	err := server.Serve()
	if err != nil {
		global.YSHOP_LOG.Error(err)
		return
	}
	//发送回复的消息
	err = server.Send()
	if err != nil {
		global.YSHOP_LOG.Error(err)
		return
	}

}

