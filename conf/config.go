package conf

type Config struct {
	App App `mapstructure:"app" yaml:"app"`
	Database Database `mapstructure:"database" yaml:"database"`
	Redis Redis `mapstructure:"redis" yaml:"redis"`
	Server Server `mapstructure:"server" yaml:"server"`
}
