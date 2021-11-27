package listen

import (
	"fmt"
	"github.com/gomodule/redigo/redis"
	"unsafe"
)

type PSubscribeCallback func (pattern, channel, message string)

type PSubscriber struct {

	client redis.PubSubConn

	cbMap map[string]PSubscribeCallback
}

func PConnect(ip, password string) redis.Conn {
	conn, err := redis.Dial("tcp", ip)
	if err != nil {
		print("redis dial failed.")
	}
	if password != "" {
		conn.Do("AUTH",password)
	}

	return conn
}

func (c *PSubscriber) ReceiveKeySpace(conn redis.Conn) {
	c.client = redis.PubSubConn{conn}
	c.cbMap = make(map[string]PSubscribeCallback)
	go func() {
		for {
			switch res := c.client.Receive().(type) {
			case redis.Message:
				pattern := &res.Pattern
				channel := &res.Channel
				message := (*string)(unsafe.Pointer(&res.Data))
				c.cbMap[*channel](*pattern, *channel, *message)
			case redis.Subscription:
				fmt.Printf("%s: %s %d\n", res.Channel, res.Kind, res.Count)
			case error:
				print("error handle...")
				continue
			}
		}
	}()
}

const expired = "__keyevent@0__:expired"

func (c *PSubscriber)Psubscribe() {
	err := c.client.PSubscribe(expired)
	if err != nil{
		print("redis Subscribe error.")
	}
	c.cbMap[expired] = PubCallback
}

func PubCallback(patter , channel, msg string){
	print( "PubCallback patter : " + patter + " channel : ", channel, " message : ", msg)
	// TODO:拿到msg后进行后续的业务代码
}



