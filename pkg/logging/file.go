package logging

import (
	"fmt"
	"time"
	"yixiang.co/go-mall/pkg/global"
)



// getLogFilePath get the log file save path
func getLogFilePath() string {
	return fmt.Sprintf("%s%s", global.YSHOP_CONFIG.App.RuntimeRootPath, global.YSHOP_CONFIG.App.LogSavePath)
}

// getLogFileName get the save name of the log file
func getLogFileName() string {
	return fmt.Sprintf("%s%s.%s",
		global.YSHOP_CONFIG.App.LogSaveName,
		time.Now().Format(global.YSHOP_CONFIG.App.TimeFormat),
		global.YSHOP_CONFIG.App.LogFileExt,
	)
}