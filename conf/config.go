package conf

type Config struct {
	App App `mapstructure:"app" yaml:"app"`
	Database Database `mapstructure:"database" yaml:"database"`
	Redis Redis `mapstructure:"redis" yaml:"redis"`
	Server Server `mapstructure:"server" yaml:"server"`
	Zap Zap `mapstructure:"zap" yaml:"zap"`
	Wechat Wechat `mapstructure:"wechat" yaml:"wechat"`
	Express Express `mapstructure:"express" yaml:"express"`
}
