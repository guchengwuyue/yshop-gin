package models

type SysCronJob struct {
	JobName        string `json:"jobName"`
	JobGroup       string `json:"jobGroup"`
	JobParams      string `json:"jobParams"`
	InvokeTarget   string `json:"invokeTarget"`
	CronExpression string `json:"cronExpression"`
	Status         int8   `json:"status"`
	Remark         string `json:"remark"`
	BaseModel
}

func (SysCronJob) TableName() string {
	return "sys_cron_job"
}

// get all
func GetAllSysCronJob(pageNUm int, pageSize int, maps interface{}) (int64, []SysCronJob) {
	var (
		total int64
		list  []SysCronJob
	)
	db.Model(&SysCronJob{}).Where(maps).Count(&total)
	db.Where(maps).Offset(pageNUm).Limit(pageSize).Find(&list)
	return total, list
}

// last inserted Id on success.
func AddSysCronJob(m *SysCronJob) error {
	var err error
	if err = db.Create(m).Error; err != nil {
		return err
	}
	return err
}
func UpdateBySysCronJob(m *SysCronJob) error {
	var err error
	err = db.Save(m).Error
	if err != nil {
		return err
	}
	return err
}
func DelBySysCronJob(ids []int64) error {
	var err error
	err = db.Where("id in (?)", ids).Delete(&SysCronJob{}).Error
	if err != nil {
		return err
	}
	return err
}
