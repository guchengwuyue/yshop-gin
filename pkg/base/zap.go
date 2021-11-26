package base

import (
	rotatelogs "github.com/lestrrat/go-file-rotatelogs"
	"go.uber.org/zap"
	"go.uber.org/zap/zapcore"
	"io"
	"time"
	"yixiang.co/go-mall/pkg/global"
)
//@author: [liuhongdi](https://github.com/liuhongdi)

func SetupLogger() (*zap.SugaredLogger) {
	filepath:= global.YSHOP_CONFIG.Zap.LogFilePath
	infofilename:= global.YSHOP_CONFIG.Zap.LogInfoFileName
	warnfilename:= global.YSHOP_CONFIG.Zap.LogWarnFileName
	fileext:= global.YSHOP_CONFIG.Zap.LogFileExt

	Logger,_ := getInitLogger(filepath,infofilename,warnfilename,fileext)

	defer Logger.Sync()

	return Logger

}

//get logger
func getInitLogger(filepath,infofilename,warnfilename,fileext string) (*zap.SugaredLogger,error) {
	encoder := getEncoder()
	//两个判断日志等级的interface
	//warnlevel以下属于info
	infoLevel := zap.LevelEnablerFunc(func(lvl zapcore.Level) bool {
		return lvl < zapcore.WarnLevel
	})
	//warnlevel及以上属于warn
	warnLevel := zap.LevelEnablerFunc(func(lvl zapcore.Level) bool {
		return lvl >= zapcore.WarnLevel
	})

	infoWriter,err := getLogWriter(filepath+"/"+infofilename,fileext)
	if (err != nil) {
		return nil,err
	}
	warnWriter,err2 := getLogWriter(filepath+"/"+warnfilename,fileext)
	if (err2 != nil) {
		return nil,err2
	}

	//创建具体的Logger
	core := zapcore.NewTee(
		zapcore.NewCore(encoder, infoWriter, infoLevel),
		zapcore.NewCore(encoder, warnWriter, warnLevel),
	)
	loggerres := zap.New(core, zap.AddCaller())

	return loggerres.Sugar(),nil
}

//get logger
func GetInitAccessLogger(filepath,filename,fileext string) (*zap.SugaredLogger,error) {

	warnWriter,err2 := getLogWriter(filepath+"/"+filename,fileext)
	if (err2 != nil) {
		return nil,err2
	}

	var cfg zap.Config
	cfg =zap.Config{
		Level:       zap.NewAtomicLevelAt(zap.DebugLevel),
		Development: true,
		Encoding:    "console",
		EncoderConfig: zapcore.EncoderConfig{
			MessageKey: "msg",
		},
		OutputPaths:      []string{"stdout", "./log.txt"},
		ErrorOutputPaths: []string{"stderr"},
	}

	l, err := cfg.Build(SetOutput(warnWriter, cfg))
	if err != nil {
		panic(err)
	}

	return l.Sugar(),nil
}


func SetOutput(ws zapcore.WriteSyncer, conf zap.Config) zap.Option {
	var enc zapcore.Encoder
	switch conf.Encoding {
	case "json":
		enc = zapcore.NewJSONEncoder(conf.EncoderConfig)
	case "console":
		enc = zapcore.NewConsoleEncoder(conf.EncoderConfig)
	default:
		panic("unknown encoding")
	}
	return zap.WrapCore(func(core zapcore.Core) zapcore.Core {
		return zapcore.NewCore(enc, ws, conf.Level)
	})
}


//Encoder
func getEncoder() zapcore.Encoder {
	encoderConfig := zap.NewProductionEncoderConfig()
	encoderConfig.EncodeTime = zapcore.ISO8601TimeEncoder
	encoderConfig.EncodeLevel = zapcore.CapitalLevelEncoder
	return zapcore.NewConsoleEncoder(encoderConfig)
}

//LogWriter
func getLogWriter(filePath,fileext string) (zapcore.WriteSyncer,error) {
	warnIoWriter,err := getWriter(filePath,fileext)
	if (err != nil) {
		return nil,err
	}
	return zapcore.AddSync(warnIoWriter),nil
}

//日志文件切割，按天
func getWriter(filename,fileext string) (io.Writer,error) {
	// 保存30天内的日志，每24小时(整点)分割一次日志
	hook, err := rotatelogs.New(
		filename+"_%Y%m%d."+fileext,
		rotatelogs.WithLinkName(filename),
		rotatelogs.WithMaxAge(time.Hour*24*30),
		rotatelogs.WithRotationTime(time.Hour*24),
	)
	if err != nil {
		//panic(err)
		return nil,err
	}
	return hook,nil
}