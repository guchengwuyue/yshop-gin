package conf

type Wechat struct {
	AppID          string `mapstructure:"app_id" yaml:"app_id"`           //appid
	AppSecret      string `mapstructure:"app_secret" yaml:"app_secret"`       //appsecret
	Token          string `mapstructure:"token" yaml:"token"`            //token
	EncodingAESKey string `mapstructure:"encoding_aes_key" yaml:"encoding_aes_key"` //EncodingAESKey
}
