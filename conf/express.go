package conf

type Express struct {
	EBusinessId        string `eBusinessId:"host" yaml:"eBusinessId"`
	AppKey    string `mapstructure:"appKey" yaml:"appKey"`
}
