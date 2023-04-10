package cron

import (
	"github.com/robfig/cron/v3"
	"yixiang.co/go-mall/pkg/global"
)

var cronMap = make(map[int64]*cron.Cron)

func newWithSeconds() *cron.Cron {
	secondParser := cron.NewParser(cron.Second | cron.Minute |
		cron.Hour | cron.Dom | cron.Month | cron.DowOptional | cron.Descriptor)
	return cron.New(cron.WithParser(secondParser), cron.WithChain())
}

func Start(cmd func(), jobId int64, cronExpression string) error {
	c := newWithSeconds()
	_, err := c.AddFunc(cronExpression, cmd)
	if err != nil {
		global.YSHOP_LOG.Error(err)
		return err
	}
	c.Start()
	cronMap[jobId] = c

	return nil

}

func Stop(jobId int64) {
	cronMap[jobId].Stop()
	delete(cronMap, jobId)

}
func IsExistCron(jobId int64) (ok bool) {
	_, ok = cronMap[jobId]
	return
}
