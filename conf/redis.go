package conf

import "time"

type Redis struct {
	Host        string `mapstructure:"host" yaml:"host"`
	Password    string `mapstructure:"password" yaml:"password"`
	MaxIdle     int `mapstructure:"max-idle" yaml:"max-idle"`
	MaxActive   int `mapstructure:"max-active" yaml:"max-active"`
	IdleTimeout time.Duration `mapstructure:"idle-timeout" yaml:"idle-timeout"`
}
