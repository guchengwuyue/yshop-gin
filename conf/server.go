package conf

import "time"

type Server struct {
	RunMode      string `mapstructure:"run-mode" yaml:"run-mode"`
	HttpPort     int `mapstructure:"http-port" yaml:"http-port"`
	ReadTimeout  time.Duration `mapstructure:"read-timeout" yaml:"read-timeout"`
	WriteTimeout time.Duration `mapstructure:"write-timeout" yaml:"write-timeout"`
}
