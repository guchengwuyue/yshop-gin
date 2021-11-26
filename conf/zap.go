package conf

type Zap struct {
	LogFilePath string `mapstructure:"log-filepath" yaml:"log-filepath"`
	LogInfoFileName  string  `mapstructure:"log-info-filename" yaml:"log-info-filename"`
	LogWarnFileName string `mapstructure:"log-warn-filename" yaml:"log-warn-filename"`
	LogFileExt  string  `mapstructure:"log-fiile-ext" yaml:"log-fiile-ext"`
}
