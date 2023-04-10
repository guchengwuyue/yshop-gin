package redis

import (
	"encoding/json"
	"github.com/gomodule/redigo/redis"
	"time"
	"yixiang.co/go-mall/pkg/global"
)

var RedisConn *redis.Pool

// Setup Initialize the Redis instance
func Setup() error {
	RedisConn = &redis.Pool{
		MaxIdle:     global.YSHOP_CONFIG.Redis.MaxIdle,
		MaxActive:   global.YSHOP_CONFIG.Redis.MaxActive,
		IdleTimeout: global.YSHOP_CONFIG.Redis.IdleTimeout * time.Second,
		Dial: func() (redis.Conn, error) {
			c, err := redis.Dial("tcp", global.YSHOP_CONFIG.Redis.Host)
			if err != nil {
				return nil, err
			}
			if global.YSHOP_CONFIG.Redis.Password != "" {
				if _, err := c.Do("AUTH", global.YSHOP_CONFIG.Redis.Password); err != nil {
					c.Close()
					return nil, err
				}
			}
			return c, err
		},
		TestOnBorrow: func(c redis.Conn, t time.Time) error {
			_, err := c.Do("PING")
			return err
		},
	}

	return nil
}

func SetEx(key, val string, exp int64) error {
	conn := RedisConn.Get()
	defer conn.Close()
	_, err := conn.Do("SETEX", key, exp, val)
	return err
}

func GetMap(key string) (map[string]string, error) {
	conn := RedisConn.Get()
	defer conn.Close()
	rsp := make(map[string]string)
	res, err := conn.Do("GET", key)
	rsp[key] = string(res.([]byte))
	return rsp, err
}

// Set a key/value
func Set(key string, data interface{}, time int) error {
	conn := RedisConn.Get()
	defer conn.Close()

	value, err := json.Marshal(data)
	if err != nil {
		return err
	}

	_, err = conn.Do("SET", key, value)
	if err != nil {
		return err
	}
	if time > 0 {
		_, err = conn.Do("EXPIRE", key, time)
		if err != nil {
			return err
		}
	}

	return nil
}

func SetString(key string, str string, time int) error {
	conn := RedisConn.Get()
	defer conn.Close()

	//value, err := json.Marshal(data)
	//if err != nil {
	//return err
	//}

	_, err := conn.Do("SET", key, str)
	if err != nil {
		return err
	}
	if time > 0 {
		_, err = conn.Do("EXPIRE", key, time)
		if err != nil {
			return err
		}
	}

	return nil
}

// Exists check a key
func Exists(key string) bool {
	conn := RedisConn.Get()
	defer conn.Close()

	exists, err := redis.Bool(conn.Do("EXISTS", key))
	if err != nil {
		return false
	}

	return exists
}

// Get get a key
func GetString(key string) string {
	conn := RedisConn.Get()
	defer conn.Close()

	reply, err := redis.String(conn.Do("GET", key))
	if err != nil {
		return ""
	}

	return reply
}

// Get get a key
func Get(key string) ([]byte, error) {
	conn := RedisConn.Get()
	defer conn.Close()

	reply, err := redis.Bytes(conn.Do("GET", key))
	if err != nil {
		return nil, err
	}

	return reply, nil
}

// Delete delete a kye
func Delete(key string) (bool, error) {
	conn := RedisConn.Get()
	defer conn.Close()

	return redis.Bool(conn.Do("DEL", key))
}

// LikeDeletes batch delete
func LikeDeletes(key string) error {
	conn := RedisConn.Get()
	defer conn.Close()

	keys, err := redis.Strings(conn.Do("KEYS", "*"+key+"*"))
	if err != nil {
		return err
	}

	for _, key := range keys {
		_, err = Delete(key)
		if err != nil {
			return err
		}
	}

	return nil
}
