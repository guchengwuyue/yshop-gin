package task

var taskMap = make(map[string]func())

func AddTask(invokeTarget string, run func()) {
	taskMap[invokeTarget] = run
}
func GetByName(invokeTarget string) (run func()) {
	return taskMap[invokeTarget]
}

func IsExistFunc(invokeTarget string) (ok bool) {
	_, ok = taskMap[invokeTarget]
	return
}
