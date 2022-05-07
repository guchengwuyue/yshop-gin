package jwt

import (
	"encoding/json"
	"errors"
	"fmt"
	"github.com/dgrijalva/jwt-go"
	"github.com/gin-gonic/gin"
	"strconv"
	"strings"
	"time"
	"yixiang.co/go-mall/app/models"
	"yixiang.co/go-mall/app/models/vo"
	"yixiang.co/go-mall/pkg/constant"
	"yixiang.co/go-mall/pkg/global"
	"yixiang.co/go-mall/pkg/logging"
	"yixiang.co/go-mall/pkg/redis"
)

var jwtSecret []byte
const bearerLength = len("Bearer ")

var (
	ErrAbsent  = "token absent"  // 令牌不存在
	ErrInvalid = "token invalid" // 令牌无效
	ErrExpired = "token expired" // 令牌过期
	ErrOther   = "other error"   // 其他错误
)

type userStdClaims struct {
	vo.JwtUser
	//*models.User
	jwt.StandardClaims
}

func Setup() {
	jwtSecret = []byte(global.YSHOP_CONFIG.App.JwtSecret)
}

func GenerateAppToken(m *models.YshopUser, d time.Time) (string, error) {
	m.Password = ""
	//m.Permissions = []string{}
	//expireTime := time.Now().Add(d)
	stdClaims := jwt.StandardClaims{
		ExpiresAt: d.Unix(),
		Id:        strconv.FormatInt(m.Id, 10),
		Issuer:    "YshopAppGo",
	}



	var jwtUser = vo.JwtUser{
		Id:       m.Id,
		Avatar:   m.Avatar,
		Username: m.Username,
		Phone:    m.Phone,
	}

	uClaims := userStdClaims{
		StandardClaims: stdClaims,
		JwtUser:        jwtUser,
	}

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, uClaims)
	tokenString, err := token.SignedString(jwtSecret)
	if err != nil {
		logging.Error(err)
	}
	//set redis
	var key = constant.APP_REDIS_PREFIX_AUTH + tokenString
	json, _ := json.Marshal(m)
	redis.SetEx(key, string(json), d.Unix())

	return tokenString, err
}
//返回id
func GetAppUserId(c *gin.Context) (int64, error) {
	u, exist := c.Get(constant.APP_AUTH_USER)
	if !exist {
		return 0, errors.New("can't get user id")
	}
	user, ok := u.(*vo.JwtUser)

	if ok {
		return user.Id, nil
	}
	return 0, errors.New("can't convert to user struct")
}

//返回user
func GetAppUser(c *gin.Context) (*vo.JwtUser, error) {
	u, exist := c.Get(constant.APP_AUTH_USER)
	if !exist {
		return nil, errors.New("can't get user id")
	}
	user, ok := u.(*vo.JwtUser)
	if ok {
		return user, nil
	}
	return nil, errors.New("can't convert to user struct")
}

//返回 detail user
func GetAppDetailUser(c *gin.Context) (*models.YshopUser,error) {
	mytoken := c.Request.Header.Get("Authorization")
	if mytoken == "" {
		return nil, errors.New("user not login")
	}
	token := strings.TrimSpace(mytoken[bearerLength:])
	var key = constant.APP_REDIS_PREFIX_AUTH + token
	userMap, err := redis.GetMap(key)
	if err != nil {
		return nil, err
	}
	jsonStr := userMap[key]
	user := &models.YshopUser{}
	err = json.Unmarshal([]byte(jsonStr), user)
	if err != nil {
		return nil, err
	}
	return user,nil
}

func RemoveAppUser(c *gin.Context) error {
	mytoken := c.Request.Header.Get("Authorization")
	token := strings.TrimSpace(mytoken[bearerLength:])
	var key = constant.APP_REDIS_PREFIX_AUTH + token
	_, err := redis.Delete(key)

	return err
}



func GenerateToken(m *models.SysUser, d time.Duration) (string, error) {
	m.Password = ""
	//m.Permissions = []string{}
	expireTime := time.Now().Add(d)
	stdClaims := jwt.StandardClaims{
		ExpiresAt: expireTime.Unix(),
		Id:        strconv.FormatInt(m.Id, 10),
		Issuer:    "YshopGo",
	}

	var (
		roleNames []string
	)
	for _, role := range m.Roles {
		roleNames = append(roleNames, role.Permission)
	}

	var jwtUser = vo.JwtUser{
		Id:       m.Id,
		Avatar:   m.Avatar,
		Email:    m.Email,
		Username: m.Username,
		Phone:    m.Phone,
		NickName: m.NickName,
		Sex:      m.Sex,
		Dept:     m.Depts.Name,
		Job:      m.Jobs.Name,
		Roles:    roleNames,
	}

	uClaims := userStdClaims{
		StandardClaims: stdClaims,
		JwtUser:        jwtUser,
	}

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, uClaims)
	tokenString, err := token.SignedString(jwtSecret)
	if err != nil {
		logging.Error(err)
	}
	//set redis
	var key = constant.REDIS_PREFIX_AUTH + tokenString
	json, _ := json.Marshal(m)
	redis.SetEx(key, string(json), expireTime.Unix())

	return tokenString, err
}

func ValidateToken(tokenString string) (*vo.JwtUser, error) {
	if tokenString == "" {
		return nil, errors.New(ErrAbsent)
	}
	token, err := jwt.Parse(tokenString, func(token *jwt.Token) (interface{}, error) {
		return jwtSecret, nil
	})
	if token == nil {
		return nil, errors.New(ErrInvalid)
	}
	claims := userStdClaims{}
	_, err = jwt.ParseWithClaims(tokenString, &claims, func(token *jwt.Token) (interface{}, error) {
		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, fmt.Errorf("unexpected signing method: %v", token.Header["alg"])
		}
		return jwtSecret, nil
	})
	if err != nil {
		logging.Error(err)
		return nil, err
	}
	return &claims.JwtUser, err

}

//返回id
func GetAdminUserId(c *gin.Context) (int64, error) {
	u, exist := c.Get(constant.ContextKeyUserObj)
	if !exist {
		return 0, errors.New("can't get user id")
	}
	user, ok := u.(*vo.JwtUser)

	if ok {
		return user.Id, nil
	}
	return 0, errors.New("can't convert to user struct")
}

//返回user
func GetAdminUser(c *gin.Context) (*vo.JwtUser, error) {
	u, exist := c.Get(constant.ContextKeyUserObj)
	if !exist {
		return nil, errors.New("can't get user id")
	}
	user, ok := u.(*vo.JwtUser)
	if ok {
		return user, nil
	}
	return nil, errors.New("can't convert to user struct")
}

//返回 detail user
func GetAdminDetailUser(c *gin.Context) *models.SysUser {
	mytoken := c.Request.Header.Get("Authorization")
	token := strings.TrimSpace(mytoken[bearerLength:])
	var key = constant.REDIS_PREFIX_AUTH + token
	userMap, _ := redis.GetMap(key)
	jsonStr := userMap[key]
	user := &models.SysUser{}
	json.Unmarshal([]byte(jsonStr), user)
	return user
}

func RemoveUser(c *gin.Context) error {
	mytoken := c.Request.Header.Get("Authorization")
	token := strings.TrimSpace(mytoken[bearerLength:])
	var key = constant.REDIS_PREFIX_AUTH + token
	_, err := redis.Delete(key)

	return err
}


