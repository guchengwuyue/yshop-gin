package wechat

import (
	"github.com/silenceper/wechat/v2"
	"github.com/silenceper/wechat/v2/cache"
	offConfig "github.com/silenceper/wechat/v2/officialaccount/config"
	"yixiang.co/go-mall/pkg/global"
)

func InitWechat() {
	wc := wechat.NewWechat()
	//这里本地内存保存access_token，也可选择redis，memcache或者自定cache
	redisOpts := &cache.RedisOpts{
		Host: global.YSHOP_CONFIG.Redis.Host,
		Password: global.YSHOP_CONFIG.Redis.Password,
		Database: 0,
		MaxActive: global.YSHOP_CONFIG.Redis.MaxActive,
		MaxIdle: global.YSHOP_CONFIG.Redis.MaxIdle,
		IdleTimeout: 200,
	}
	redisCache := cache.NewRedis(redisOpts)
	wc.SetCache(redisCache)
	cfg := &offConfig.Config{
		AppID: global.YSHOP_CONFIG.Wechat.AppID,
		AppSecret: global.YSHOP_CONFIG.Wechat.AppSecret,
		Token: global.YSHOP_CONFIG.Wechat.Token,
		EncodingAESKey: global.YSHOP_CONFIG.Wechat.EncodingAESKey,

	}

	officialAccount := wc.GetOfficialAccount(cfg)

	global.YSHOP_OFFICIAL_ACCOUNT = officialAccount
}
