package conf

type Database struct {
	Type        string `mapstructure:"type" yaml:"type"`
	User        string `mapstructure:"user" yaml:"user"`
	Password    string `mapstructure:"password" yaml:"password"`
	Host        string `mapstructure:"host" yaml:"host"`
	Name        string `mapstructure:"name" yaml:"name"`
	TablePrefix string `mapstructure:"table-prefix" yaml:"table-prefix"`
}
