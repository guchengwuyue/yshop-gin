package global

import (
	"github.com/spf13/viper"
	"go.uber.org/zap"
	"gorm.io/gorm"
	"yixiang.co/go-mall/conf"
)

var (
	YSHOP_DB *gorm.DB
	YSHOP_VP *viper.Viper
	YSHOP_LOG *zap.SugaredLogger
	YSHOP_CONFIG conf.Config
)
