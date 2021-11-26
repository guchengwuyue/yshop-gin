package conf

type App struct {
	JwtSecret string `mapstructure:"jwt-secret" yaml:"jwt-secret"`
	PageSize  int  `mapstructure:"page-size" yaml:"page-size"`
	PrefixUrl string  `mapstructure:"prefix-url" yaml:"prefix-url"`

	RuntimeRootPath string  `mapstructure:"runtime-root-path" yaml:"runtime-root-path"`

	ImageSavePath  string `mapstructure:"image-save-path" yaml:"image-save-path"`
	ImageMaxSize   int `mapstructure:"image-max-size" yaml:"image-max-size"`
	ImageAllowExts []string `mapstructure:"image-allow-exts" yaml:"image-allow-exts"`

	ExportSavePath string `mapstructure:"export-save-path" yaml:"export-save-path"`
	QrCodeSavePath string `mapstructure:"qrcode-save-path" yaml:"qrcode-save-path"`
	FontSavePath   string `mapstructure:"font-save-path" yaml:"font-save-path"`

	LogSavePath string `mapstructure:"log-save-path" yaml:"log-save-path"`
	LogSaveName string `mapstructure:"log-save-name" yaml:"log-save-name"`
	LogFileExt  string `mapstructure:"log-file-ext" yaml:"log-file-ext"`
	TimeFormat  string `mapstructure:"time-format" yaml:"time-format"`
}
