package util

import (
	"crypto/rand"
	"errors"
	"fmt"
	"github.com/gin-gonic/gin"
	"golang.org/x/crypto/bcrypt"
	"io"
	"reflect"
	"strconv"
	"strings"
)

// 加密
func HashAndSalt(pwd []byte) string {
	hash, err := bcrypt.GenerateFromPassword(pwd, bcrypt.MinCost)
	if err != nil {
		//controllers.ErrMsg(err.Error())
	}
	return string(hash)
}

// 密码验证
func ComparePwd(hashPwd string, plainPwd []byte) bool {
	byteHash := []byte(hashPwd)
	err := bcrypt.CompareHashAndPassword(byteHash, plainPwd)
	if err != nil {
		return false
	}

	return true
}

// 判断array contain item
func Contains(array interface{}, val interface{}) (index int) {
	index = -1
	switch reflect.TypeOf(array).Kind() {
	case reflect.Slice:
		{
			s := reflect.ValueOf(array)
			for i := 0; i < s.Len(); i++ {
				if reflect.DeepEqual(val, s.Index(i).Interface()) {
					index = i
					return
				}
			}
		}
	}
	return
}

// [a] -> a -> a
// [a b c] -> a b c -> a,b,c
func Convert(array interface{}) string {
	return strings.Replace(strings.Trim(fmt.Sprint(array), "[]"), " ", ",", -1)
}

func IntToBool(num int8) bool {
	if num > 0 {
		return true
	}
	return false
}

func ReturnQ(length int) string {
	var str string
	for i := 0; i < length; i++ {
		str += ",?"
	}
	return str[1:]
}

func GetKeys(m map[string]string) []string {
	// 数组默认长度为map长度,后面append时,不需要重新申请内存和拷贝,效率很高
	keys := make([]string, 0, len(m))
	for k := range m {
		keys = append(keys, k)
	}
	return keys
}

func GetValues(m map[string]string) []string {
	// 数组默认长度为map长度,后面append时,不需要重新申请内存和拷贝,效率很高
	values := make([]string, 0, len(m))
	for _, v := range m {
		values = append(values, v)
	}
	return values
}

func GetSum(m []int) int {
	// 数组默认长度为map长度,后面append时,不需要重新申请内存和拷贝,效率很高
	sum := 0
	for _, v := range m {
		sum = sum + v
	}
	return sum
}

func GetClientIP(c *gin.Context) string {
	ClientIP := c.ClientIP()
	//fmt.Println("ClientIP:", ClientIP)
	RemoteIP, _ := c.RemoteIP()
	//fmt.Println("RemoteIP:", RemoteIP)
	ip := c.Request.Header.Get("X-Forwarded-For")
	if strings.Contains(ip, "127.0.0.1") || ip == "" {
		ip = c.Request.Header.Get("X-real-ip")
	}
	if ip == "" {
		ip = "127.0.0.1"
	}
	if RemoteIP.String() != "127.0.0.1" {
		ip = RemoteIP.String()
	}
	if ClientIP != "127.0.0.1" {
		ip = ClientIP
	}
	return ip
}

// RandomNumber 生成长度为 length 随机数字字符串
func RandomNumber(length int) string {
	table := [...]byte{'1', '2', '3', '4', '5', '6', '7', '8', '9', '0'}
	b := make([]byte, length)
	n, err := io.ReadAtLeast(rand.Reader, b, length)
	if n != length {
		panic(err)
	}
	for i := 0; i < len(b); i++ {
		b[i] = table[int(b[i])%len(table)]
	}
	return string(b)
}

func Int64ToInt(num int64) int {
	ss, _ := strconv.Atoi(strconv.FormatInt(num, 10))
	return ss
}

func GetTotalPage(total, size int) int {

	if total <= size {
		return 1
	}
	if total%size == 0 {
		return total / size
	} else {
		return total/size + 1
	}

}

// 实现 php 中的array_column 方法
// @param desk [slice|map] 指针类型，方法最终的存储位置
// @param input []struct，待转换的结构体切片
// @param columnKey string
// @param indexKey string
func StructColumn(desk, input interface{}, columnKey, indexKey string) (err error) {
	deskValue := reflect.ValueOf(desk)
	if deskValue.Kind() != reflect.Ptr {
		return errors.New("desk must be ptr")
	}

	rv := reflect.ValueOf(input)
	if rv.Kind() != reflect.Slice && rv.Kind() != reflect.Array {
		return errors.New("input must be map slice or array")
	}

	rt := reflect.TypeOf(input)
	if rt.Elem().Kind() != reflect.Struct {
		return errors.New("input's elem must be struct")
	}

	if len(indexKey) > 0 {
		return structIndexColumn(desk, input, columnKey, indexKey)
	}
	return structColumn(desk, input, columnKey)
}

func structColumn(desk, input interface{}, columnKey string) (err error) {
	if len(columnKey) == 0 {
		return errors.New("columnKey cannot not be empty")
	}

	deskElemType := reflect.TypeOf(desk).Elem()
	if deskElemType.Kind() != reflect.Slice {
		return errors.New("desk must be slice")
	}

	rv := reflect.ValueOf(input)
	rt := reflect.TypeOf(input)

	var columnVal reflect.Value
	deskValue := reflect.ValueOf(desk)
	direct := reflect.Indirect(deskValue)

	for i := 0; i < rv.Len(); i++ {
		columnVal, err = findStructValByColumnKey(rv.Index(i), rt.Elem(), columnKey)
		if err != nil {
			return
		}
		if deskElemType.Elem().Kind() != columnVal.Kind() {
			return errors.New(fmt.Sprintf("your slice must be []%s", columnVal.Kind()))
		}

		direct.Set(reflect.Append(direct, columnVal))
	}
	return
}

func findStructValByColumnKey(curVal reflect.Value, elemType reflect.Type, columnKey string) (columnVal reflect.Value, err error) {
	columnExist := false
	for i := 0; i < elemType.NumField(); i++ {
		curField := curVal.Field(i)
		if elemType.Field(i).Name == columnKey {
			columnExist = true
			columnVal = curField
			continue
		}
	}
	if !columnExist {
		return columnVal, errors.New(fmt.Sprintf("columnKey %s not found in %s's field", columnKey, elemType))
	}
	return
}

func structIndexColumn(desk, input interface{}, columnKey, indexKey string) (err error) {
	deskValue := reflect.ValueOf(desk)
	if deskValue.Elem().Kind() != reflect.Map {
		return errors.New("desk must be map")
	}
	deskElem := deskValue.Type().Elem()
	if len(columnKey) == 0 && deskElem.Elem().Kind() != reflect.Struct {
		return errors.New(fmt.Sprintf("desk's elem expect struct, got %s", deskElem.Elem().Kind()))
	}

	rv := reflect.ValueOf(input)
	rt := reflect.TypeOf(input)
	elemType := rt.Elem()

	var indexVal, columnVal reflect.Value
	direct := reflect.Indirect(deskValue)
	mapReflect := reflect.MakeMap(deskElem)
	deskKey := deskValue.Type().Elem().Key()

	for i := 0; i < rv.Len(); i++ {
		curVal := rv.Index(i)
		indexVal, columnVal, err = findStructValByIndexKey(curVal, elemType, indexKey, columnKey)
		if err != nil {
			return
		}
		if deskKey.Kind() != indexVal.Kind() {
			return errors.New(fmt.Sprintf("cant't convert %s to %s, your map'key must be %s", indexVal.Kind(), deskKey.Kind(), indexVal.Kind()))
		}
		if len(columnKey) == 0 {
			mapReflect.SetMapIndex(indexVal, curVal)
			direct.Set(mapReflect)
		} else {
			if deskElem.Elem().Kind() != columnVal.Kind() {
				return errors.New(fmt.Sprintf("your map must be map[%s]%s", indexVal.Kind(), columnVal.Kind()))
			}
			mapReflect.SetMapIndex(indexVal, columnVal)
			direct.Set(mapReflect)
		}
	}
	return
}

func findStructValByIndexKey(curVal reflect.Value, elemType reflect.Type, indexKey, columnKey string) (indexVal, columnVal reflect.Value, err error) {
	indexExist := false
	columnExist := false
	for i := 0; i < elemType.NumField(); i++ {
		curField := curVal.Field(i)
		if elemType.Field(i).Name == indexKey {
			switch curField.Kind() {
			case reflect.String, reflect.Int64, reflect.Int32, reflect.Int16, reflect.Int8, reflect.Int, reflect.Float64, reflect.Float32:
				indexExist = true
				indexVal = curField
			default:
				return indexVal, columnVal, errors.New("indexKey must be int float or string")
			}
		}
		if elemType.Field(i).Name == columnKey {
			columnExist = true
			columnVal = curField
			continue
		}
	}
	if !indexExist {
		return indexVal, columnVal, errors.New(fmt.Sprintf("indexKey %s not found in %s's field", indexKey, elemType))
	}
	if len(columnKey) > 0 && !columnExist {
		return indexVal, columnVal, errors.New(fmt.Sprintf("columnKey %s not found in %s's field", columnKey, elemType))
	}
	return
}

func TrimSpace(text string) string {
	result := make([]string, 0)
	for _, line := range strings.Split(text, "\n") {
		if len(strings.TrimSpace(line)) != 0 {
			result = append(result, line)
		}
	}
	return strings.Join(result, "\n")
}
