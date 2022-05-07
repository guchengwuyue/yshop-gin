/**
* Copyright (C) 2020-2021
* All rights reserved, Designed By www.yixiang.co
* 注意：本软件为www.yixiang.co开发研制
 */
package order_service

import (
	"encoding/json"
	"errors"
	"github.com/gin-gonic/gin"
	"github.com/jinzhu/copier"
	"github.com/segmentio/ksuid"
	"github.com/shopspring/decimal"
	"github.com/unknwon/com"
	"gorm.io/gorm"
	"strconv"
	"strings"
	"yixiang.co/go-mall/app/models"
	"yixiang.co/go-mall/app/models/vo"
	"yixiang.co/go-mall/app/params"
	"yixiang.co/go-mall/app/service/cart_service"
	cartVo "yixiang.co/go-mall/app/service/cart_service/vo"
	orderDto "yixiang.co/go-mall/app/service/order_service/dto"
	ordervo "yixiang.co/go-mall/app/service/order_service/vo"
	userVO "yixiang.co/go-mall/app/service/wechat_user_service/vo"
	"yixiang.co/go-mall/pkg/constant"
	orderEnum "yixiang.co/go-mall/pkg/enums/order"
	"yixiang.co/go-mall/pkg/global"
	"yixiang.co/go-mall/pkg/redis"
	"yixiang.co/go-mall/pkg/util"
)

type Order struct {
	Id   int64
	Name string

	Enabled int

	PageNum  int
	PageSize int

	M *models.YshopStoreOrder

	Ids []int64

	Uid int64

	CartId string

	Type string

	User *models.YshopUser

	ComputeParam *params.ComputeOrderParam
	Key          string
	OrderParam   *params.OrderParam
	OrderId      string
	IntType      int

	ReplyParam []params.ProductReplyParam

}


//订单列表 -1全部 默认为0未支付 1待发货 2待收货 3待评价 4已完成
func (d *Order) GetList() ([]ordervo.StoreOrder, int, int) {
	maps := make(map[string]interface{})
	maps["uid"] = d.Uid

	switch d.IntType {
	case -1:
	case 0:
		maps["paid"] = 0
		maps["refund_status"] = 0
		maps["status"] = 0

	case 1:
		maps["paid"] = 1
		maps["refund_status"] = 0
		maps["status"] = 0
	case 2:
		maps["paid"] =1
		maps["refund_status"] = 0
		maps["status"] = 1
	case 3:
		maps["paid"] = 1
		maps["refund_status"] = 0
		maps["status"] = 2
	case 4:
		maps["paid"] = 1
		maps["refund_status"] = 0
		maps["status"] = 3
	case 5:
		maps["paid"] = 1
		maps["refund_status"] = 1
	case 6:
		maps["paid"] = 0
		maps["refund_status"] = 2
	}

	var ListVo []ordervo.StoreOrder
	var ReturnListVo []ordervo.StoreOrder

	total, list := models.GetAllOrder(d.PageNum, d.PageSize, maps)
	e := copier.Copy(&ListVo, list)
	if e != nil {
		global.YSHOP_LOG.Error(e)
	}
	totalNum := util.Int64ToInt(total)
	totalPage := util.GetTotalPage(totalNum, d.PageSize)
	for _, val := range ListVo {
		vo := HandleOrder(&val)
		ReturnListVo = append(ReturnListVo, *vo)
	}
	return ReturnListVo, totalNum, totalPage
}

//取消订单
func (d *Order) CancelOrder() error {
	var err error
	tx := global.YSHOP_DB.Begin()
	defer func() {
		if err != nil {
			tx.Rollback()
		} else {
			tx.Commit()
		}
	}()
	order,err := d.GetOrderInfo()
	if err != nil {
		return errors.New("订单不存在")
	}
	if order.Paid == 1 {
		return errors.New("支付订单不可以取消")
	}
	err = RegressionStock(tx,order)
	if err != nil {
		global.YSHOP_LOG.Error(err)
		return errors.New("取消失败-001")
	}

	//删除订单
	err = tx.Where("id = ?",order.Id).Delete(&models.YshopStoreOrder{}).Error
	if err != nil {
		global.YSHOP_LOG.Error(err)
		return errors.New("取消失败-002")
	}

	return nil

}

//回退库存
func RegressionStock(tx *gorm.DB,order *ordervo.StoreOrder) error  {
	var err error
	orderInfo := HandleOrder(order)
	cartInfoList := orderInfo.CartInfo
	for _,vo := range cartInfoList {
		err = tx.Exec("update yshop_store_product_attr_value set stock=stock + ?, sales=sales - ?"+
			" where product_id = ? and `unique` = ? and stock >= ?",
			vo.CartNum, vo.CartNum, vo.ProductId, vo.ProductAttrUnique, vo.CartNum).Error
		if err != nil {
			return err
		}
		err = tx.Exec("update yshop_store_product set stock=stock + ?, sales=sales - ?"+
			" where id = ? and stock >= ?",
			vo.CartNum, vo.CartNum, vo.ProductId, vo.CartNum).Error
		if err != nil {
			return err
		}
	}

	return nil
}

//todo 回退积分
//todo 回退优惠券

//订单评价
func (d *Order) OrderComment() error {
	var err error
	tx := global.YSHOP_DB.Begin()
	defer func() {
		if err != nil {
			tx.Rollback()
		} else {
			tx.Commit()
		}
	}()
	order,err := d.GetOrderInfo()
	if err != nil {
		return errors.New("订单不存在")
	}
	var replys []models.YshopStoreProductReply
	for _,data := range d.ReplyParam {
		reply := models.YshopStoreProductReply{
			Uid: d.Uid,
			Oid: order.Id,
			ProductId: data.ProductId,
			ProductScore: data.ProductScore,
			ServiceScore: data.ServiceScore,
			Comment: data.Comment,
			Pics: data.Pics,
			Unique: data.Unique,
		}
		replys = append(replys, reply)
	}
	err = tx.Model(&models.YshopStoreProductReply{}).Select("uid", "oid", "product_id",
		"product_score", "service_score", "comment", "pics", "unique").Create(replys).Error
	if err != nil {
		global.YSHOP_LOG.Error(err)
		return errors.New("评价失败-0001")
	}
	err = tx.Model(&models.YshopStoreOrder{}).Where("id = ?",order.Id).Update("status",3).Error
	if err != nil {
		global.YSHOP_LOG.Error(err)
		return errors.New("评价失败-0002")
	}
	return nil
}

//收货
func (d *Order) TakeOrder() error {
	var err error
	tx := global.YSHOP_DB.Begin()
	defer func() {
		if err != nil {
			tx.Rollback()
		} else {
			tx.Commit()
		}
	}()
	order,err := d.GetOrderInfo()
	if err != nil {
		return errors.New("订单不存在")
	}
	if order.Status != 1 {
		return errors.New("订单状态错误")
	}

	//修改订单状态
	err = tx.Model(&models.YshopStoreOrder{}).Where("id = ?",order.Id).Update("status",2).Error
	//增加状态
	err = models.AddStoreOrderStatus(tx, order.Id, "user_take_delivery", "用户已收货")

	//奖励积分
	if order.GainIntegral > 0 {
		err = tx.Exec("update yshop_user set integral = integral + ?" +
			" where id = ?",order.Uid,order.GainIntegral).Error
		if err != nil {
			global.YSHOP_LOG.Error(err)
			return err
		}
		//增加流水
		number,_ := com.StrTo(order.GainIntegral).Float64()
		mark := "购买商品赠送积分" + com.ToStr(order.GainIntegral) + "积分"
		err = models.Income(tx,order.Uid,"购买商品赠送积分","integral","gain",
			mark,com.ToStr(order.Id),number,number)
		if err != nil {
			global.YSHOP_LOG.Error(err)
			return err
		}
	}

	//todo 分销

	return nil
}

//创建订单
func (d *Order) CreateOrder() (*models.YshopStoreOrder, error) {
	var err error
	tx := global.YSHOP_DB.Begin()
	defer func() {
		if err != nil {
			tx.Rollback()
		} else {
			tx.Commit()
		}
	}()
	d.ComputeParam = &params.ComputeOrderParam{
		AddressId:    d.OrderParam.AddressId,
		CouponId:     d.OrderParam.CouponId,
		UseIntegral:  d.OrderParam.UseIntegral,
		ShippingType: d.OrderParam.ShippingType,
	}
	computeVo, err := d.ComputeOrder()
	if err != nil {
		return nil, err
	}

	//todo 门店

	var (
		userAddress models.YshopUserAddress
		totalNum    = 0
		cartIds     = make([]string, 0)
		//integral = 0
		gainIntegral = 0
	)
	err = global.YSHOP_DB.Model(&models.YshopUserAddress{}).
		Where("uid = ?", d.Uid).
		Where("id = ?", d.OrderParam.AddressId).
		First(&userAddress).Error
	if err != nil {
		return nil, errors.New("地址出错")
	}

	cacheDto, _ := getCacheOrderInfo(d.Uid, d.Key)
	cartInfo := cacheDto.CartInfo
	for _, cart := range cartInfo {
		err = cart_service.CheckStock(cart.ProductId, cart.CartNum, cart.ProductAttrUnique)
		if err != nil {
			return nil, err
		}
		cartIds = append(cartIds, strconv.FormatInt(cart.Id, 10))
		totalNum = totalNum + cart.CartNum

		//积分
		gain := cart.ProductInfo.GiveIntegral
		if gain > 0 {
			gainIntegral = gainIntegral + cart.CartNum*gain
		}

	}
	worker, _ := util.NewWorker(int64(1))
	orderSn := worker.GetId()
	detailAddr := userAddress.Province + " " + userAddress.City + " " + userAddress.District + " " + userAddress.Detail
	storeOrder := &models.YshopStoreOrder{
		Uid:            d.Uid,
		OrderId:        strconv.FormatInt(orderSn, 10),
		RealName:       userAddress.RealName,
		UserPhone:      userAddress.Phone,
		UserAddress:    detailAddr,
		CartId:         strings.Join(cartIds, ","),
		TotalNum:       totalNum,
		TotalPrice:     computeVo.TotalPrice,
		TotalPostage:   computeVo.PayPostage,
		CouponId:       d.OrderParam.CouponId,
		CouponPrice:    computeVo.CouponPrice,
		PayPrice:       computeVo.PayPrice,
		PayPostage:     computeVo.PayPostage,
		DeductionPrice: computeVo.DeductionPrice,
		Paid:           orderEnum.PAY_STATUS_0,
		UseIntegral:    computeVo.UseIntegral,
		BackIntegral:   0,
		GainIntegral:   gainIntegral,
		Mark:           d.OrderParam.Mark,
		Cost:           cacheDto.PriceGroup.CostPrice,
		Unique:         d.Key,
		ShippingType:   d.OrderParam.ShippingType,
		PayType:        d.OrderParam.PayType,
	}
	err = tx.Model(&models.YshopStoreOrder{}).
		Select("uid", "order_id", "real_name", "user_phone", "user_address", "cart_id", "total_num",
			"total_price", "total_postage", "coupon_id", "coupon_price", "pay_price", "pay_postage", "deduction_price",
			"paid", "use_integral", "back_integral", "gain_integral", "mark", "unique", "shipping_type", "pay_type").
		Create(storeOrder).Error
	if err != nil {
		return nil, errors.New("订单生成失败")
	}
	//todo 扣积分
	//todo 消费优惠券
	orderInfoList := make([]models.YshopStoreOrderCartInfo, 0)
	//减库存加销量
	for _, vo := range cartInfo {
		err = tx.Exec("update yshop_store_product_attr_value set stock=stock - ?, sales=sales + ?"+
			" where product_id = ? and `unique` = ? and stock >= ?",
			vo.CartNum, vo.CartNum, vo.ProductId, vo.ProductAttrUnique, vo.CartNum).Error
		if err != nil {
			return nil, errors.New("库存扣减失败-00000")
		}
		err = tx.Exec("update yshop_store_product set stock=stock - ?, sales=sales + ?"+
			" where id = ? and stock >= ?",
			vo.CartNum, vo.CartNum, vo.ProductId, vo.CartNum).Error
		if err != nil {
			return nil, errors.New("库存扣减失败-00001")
		}

		b, _ := json.Marshal(vo)
		uuid := ksuid.New()
		orderCartInfo := models.YshopStoreOrderCartInfo{
			Oid:          storeOrder.Id,
			OrderId:      storeOrder.OrderId,
			CartId:       vo.Id,
			ProductId:    vo.ProductId,
			CartInfo:     string(b),
			Unique:       uuid.String(),
			IsAfterSales: 1,
		}
		orderInfoList = append(orderInfoList, orderCartInfo)
	}

	//保存购物车商品信息
	err = tx.Model(&models.YshopStoreOrderCartInfo{}).Create(orderInfoList).Error
	if err != nil {
		return nil, errors.New("订单创建失败-00001")
	}

	//增加状态
	err = models.AddStoreOrderStatus(tx, storeOrder.Id, "yshop_create_order", "订单生成")
	if err != nil {
		return nil, errors.New("订单创建失败-00002")
	}

	//todo 订单自动取消处理

	return storeOrder, nil
}

func (d *Order) GetOrderInfo() (*ordervo.StoreOrder,error) {
	var (
		order *models.YshopStoreOrder
		vo    ordervo.StoreOrder
	)

	maps := make(map[string]interface{})
	maps["order_id"] = d.OrderId
	if d.Uid > 0 {
		maps["uid"] = d.Uid
	}
	err := global.YSHOP_DB.Model(&models.YshopStoreOrder{}).
		Where(maps).First(&order).Error
	if err != nil {
		global.YSHOP_LOG.Error(err)
		return nil, err
	}
	copier.Copy(&vo, order)

	return &vo,nil
}

//处理订单状态
func HandleOrder(order *ordervo.StoreOrder) *ordervo.StoreOrder {
	var (
		orderInfoList []models.YshopStoreOrderCartInfo
		cart          cartVo.Cart
		statusDto     orderDto.Status
	)
	global.YSHOP_DB.Model(&models.YshopStoreOrderCartInfo{}).Where("oid = ?", order.Id).Find(&orderInfoList)
	cartInfo := make([]cartVo.Cart, 0)
	for _, orderInfo := range orderInfoList {
		json.Unmarshal([]byte(orderInfo.CartInfo), &cart)
		cart.Unique = orderInfo.Unique
		cartInfo = append(cartInfo, cart)
	}

	order.CartInfo = cartInfo

	if order.Paid == 0 {
		statusDto.Class = "nobuy"
		statusDto.Msg = "未支付"
		statusDto.Type = "0"
		statusDto.Title = "未支付"
	} else if order.RefundStatus == 1 {
		statusDto.Class = "state-sqtk"
		statusDto.Msg = "商家审核中，请耐心等待"
		statusDto.Type = "-1"
		statusDto.Title = "申请退款中"
	} else if order.RefundStatus == 2 {
		statusDto.Class = "state-sqtk"
		statusDto.Msg = "已经为你退款，感谢您的支付"
		statusDto.Type = "-2"
		statusDto.Title = "已退款"
	} else if order.Status == 0 {
		if order.ShippingType == 1 {
			statusDto.Class = "state-nfh"
			statusDto.Msg = "商家未发货，请耐心等待"
			statusDto.Type = "1"
			statusDto.Title = "未发货"
		}
	} else if order.Status == 2 {
		statusDto.Class = "state-ypj"
		statusDto.Msg = "已收货，快去评价一下吧"
		statusDto.Type = "3"
		statusDto.Title = "待评价"
	} else if order.RefundStatus == 3 {
		statusDto.Class = "state-ytk"
		statusDto.Msg = "交易完成，感谢您的支持"
		statusDto.Type = "4"
		statusDto.Title = "交易完成"
	}

	if order.PayType == "weixin" {
		statusDto.PayType = "微信支付"
	} else {
		statusDto.PayType = "余额支付"
	}
	order.StatusDto = statusDto

	return order
}

func (d *Order) Check() (map[string]interface{}, error) {
	if d.Key == "" {
		return nil, errors.New("参数错误")
	}
	var order *models.YshopStoreOrder
	error := global.YSHOP_DB.Model(&models.YshopStoreOrder{}).
		Where("`unique` = ?", d.Key).
		Where("uid = ?", d.Uid).First(&order).Error
	if error == nil {
		orderExtendDto := &orderDto.OrderExtend{
			Key:     d.Key,
			OrderId: order.OrderId,
		}

		return gin.H{
			"status": "EXTEND_ORDER",
			"result": orderExtendDto,
			"msg":    "订单已生成",
		}, nil
	}

	return nil, nil
}

//计算订单
func (d *Order) ComputeOrder() (*ordervo.Compute, error) {
	global.YSHOP_LOG.Info(d.ComputeParam)
	var (
		payPostage     = 0.00
		couponPrice    = 0.00
		deductionPrice = 0.00
		usedIntegral   = 0
		payIntegral    = 0
	)
	cacheDto, err := getCacheOrderInfo(d.Uid, d.Key)
	if err != nil {
		return nil, errors.New("订单已过期，请重新刷新当前页面")
	}
	payPrice := cacheDto.PriceGroup.TotalPrice

	//todo 运费模板
	//目前运费统一0

	//todo 目前不处理门店
	payPrice = payPrice + payPostage

	//todo 秒杀 砍价 拼团

	//todo 优惠券

	//todo 积分抵扣

	return &ordervo.Compute{
		TotalPrice:     cacheDto.PriceGroup.TotalPrice,
		PayPrice:       payPrice,
		PayPostage:     payPostage,
		CouponPrice:    couponPrice,
		DeductionPrice: deductionPrice,
		UseIntegral:    usedIntegral,
		PayIntegral:    payIntegral,
	}, nil

}

//确认订单
func (d *Order) ConfirmOrder() (*ordervo.ConfirmOrder, error) {
	cartService := cart_service.Cart{
		Uid:     d.Uid,
		CartIds: d.CartId,
		Status:  1,
	}
	vo := cartService.GetCartList()
	invalid := vo["invalid"].([]cartVo.Cart)
	valid := vo["valid"].([]cartVo.Cart)
	if len(invalid) > 0 {
		return nil, errors.New("有失效的购物车，请重新提交")
	}
	if len(valid) == 0 {
		return nil, errors.New("请提交购买的商品")
	}

	var (
		deduction      = false //抵扣
		enableIntegral = true  //积分
		userAddress    models.YshopUserAddress
	)
	//获取默认地址
	global.YSHOP_DB.Model(&models.YshopUserAddress{}).
		Where("uid = ?", d.Uid).
		Where("is_default = ?", 1).
		First(&userAddress)
	priceGroup := getOrderPriceGroup(valid, &userAddress)
	cacheKey := cacheOrderInfo(d.Uid, valid, priceGroup, orderDto.Other{})
	//优惠券 todo
	var user userVO.User

	e := copier.Copy(&user, d.User)
	if e != nil {
		global.YSHOP_LOG.Error(e)
	}
	return &ordervo.ConfirmOrder{
		AddressInfo:    userAddress,
		CartInfo:       valid,
		PriceGroup:     priceGroup,
		UserInfo:       user,
		OrderKey:       cacheKey,
		Deduction:      deduction,
		EnableIntegral: enableIntegral,
	}, nil

}

func cacheOrderInfo(uid int64, cartInfo []cartVo.Cart, priceGroup orderDto.PriceGroup, other orderDto.Other) string {
	uuid := ksuid.New()
	key := uuid.String()
	cache := orderDto.Cache{
		CartInfo:   cartInfo,
		PriceGroup: priceGroup,
		Other:      other,
	}
	newKey := constant.ORDER_INFO + strconv.FormatInt(uid, 10) + key
	redis.Set(newKey, cache, 1000)
	return key
}

func getCacheOrderInfo(uid int64, key string) (orderDto.Cache, error) {
	newKey := constant.ORDER_INFO + strconv.FormatInt(uid, 10) + key
	b, error := redis.Get(newKey)
	if error != nil {
		return orderDto.Cache{}, error
	}
	var cache orderDto.Cache
	json.Unmarshal(b, &cache)
	return cache, nil
}

func delCacheOrderInfo(uid int64, key string) {
	newKey := constant.ORDER_INFO + strconv.FormatInt(uid, 10) + key
	redis.Delete(newKey)
}

func getOrderPriceGroup(cartInfo []cartVo.Cart, userAddress *models.YshopUserAddress) orderDto.PriceGroup {
	var (
		//storePostage float64
		//storeFreePostage float64
		totalPrice float64
		costPrice  float64
		//vipPrice float64
		//payIntegral float64
	)
	//计算价格
	for _, val := range cartInfo {
		dc1 := decimal.NewFromFloat(val.TruePrice).Mul(decimal.NewFromFloat(float64(val.CartNum)))
		sum1, _ := dc1.Float64()
		totalPrice = totalPrice + sum1

		dc2 := decimal.NewFromFloat(val.CostPrice).Mul(decimal.NewFromFloat(float64(val.CartNum)))
		sum2, _ := dc2.Float64()
		costPrice = costPrice + sum2
		//
		//dc3 := decimal.NewFromFloat(val.VipTruePrice).Mul(decimal.NewFromFloat(float64(val.CartNum)))
		//sum3,_ := dc3.Float64()
		//vipPrice = vipPrice + sum3

	}

	return orderDto.PriceGroup{
		//StoreFreePostage: storeFreePostage,
		TotalPrice: totalPrice,
		CostPrice:  costPrice,
	}
}





func (d *Order) GetAll() vo.ResultList {
	maps := make(map[string]interface{})
	if d.Name != "" {
		maps["name"] = d.Name
	}
	if d.Enabled >= 0 {
		maps["is_show"] = d.Enabled
	}
	switch d.IntType {
	case -9:
	case 0:
		maps["paid"] = 0
		maps["refund_status"] = 0
		maps["status"] = 0

	case 1:
		maps["paid"] = 1
		maps["refund_status"] = 0
		maps["status"] = 0
	case 2:
		maps["paid"] =1
		maps["refund_status"] = 0
		maps["status"] = 1
	case 3:
		maps["paid"] = 1
		maps["refund_status"] = 0
		maps["status"] = 2
	case 4:
		maps["paid"] = 1
		maps["refund_status"] = 0
		maps["status"] = 3
	case -1:
		maps["paid"] = 1
		maps["refund_status"] = 1
	case -2:
		maps["paid"] = 0
		maps["refund_status"] = 2
	}

	total, list := models.GetAdminAllOrder(d.PageNum, d.PageSize, maps)

	var (
		orderInfoList []models.YshopStoreOrderCartInfo
		cart          cartVo.Cart
		newList []models.YshopStoreOrder
	)
	for _ ,order := range list {
		global.YSHOP_DB.Model(&models.YshopStoreOrderCartInfo{}).Where("oid = ?", order.Id).Find(&orderInfoList)
		cartInfo := make([]cartVo.Cart, 0)
		for _, orderInfo := range orderInfoList {
			json.Unmarshal([]byte(orderInfo.CartInfo), &cart)
			cartInfo = append(cartInfo, cart)
		}
		order.CartInfo = cartInfo

		_status := orderStatus(order.Paid,order.Status,order.RefundStatus)
		order.OrderStatus = _status
		order.OrderStatusName = orderStatusStr(order.Paid,order.Status,order.ShippingType,order.RefundStatus)
		order.PayTypeName = payTypeName(order.PayType,order.Paid)
		//global.YSHOP_LOG.Info(order.CartInfo)

		newList = append(newList, order)
	}




	return vo.ResultList{Content: newList, TotalElements: total}
}

func orderStatus(paid, status, refund_status int) int {
	//todo  1-未付款 2-未发货 3-退款中 4-待收货 5-待评价 6-已完成 7-已退款
	_status := 0

	if paid == 0 && status == 0 && refund_status == 0 {
		_status = 1
	} else if paid == 1 && status == 0 && refund_status == 0 {
		_status = 2
	} else if paid == 1 && refund_status == 1 {
		_status = 3
	} else if paid == 1 && status == 1 && refund_status == 0 {
		_status = 4
	} else if paid == 1 && status == 2 && refund_status == 0 {
		_status = 5
	} else if paid == 1 && status == 3 && refund_status == 0 {
		_status = 6
	} else if paid == 1 && refund_status == 2 {
		_status = 7
	}

	return _status

}

func orderStatusStr(paid, status, shipping_type, refund_status int) string {
	statusName := ""
	if paid == 0 && status == 0 {
		statusName = "未支付"
	} else if paid == 1 && status == 0 && shipping_type == 1 && refund_status == 0 {
		statusName = "未发货"
	} else if paid == 1 && status == 0 && shipping_type == 2 && refund_status == 0 {
		statusName = "未核销"
	} else if paid == 1 && status == 1 && shipping_type == 1 && refund_status == 0 {
		statusName = "待收货"
	} else if paid == 1 && status == 1 && shipping_type == 2 && refund_status == 0 {
		statusName = "未核销"
	} else if paid == 1 && status == 2 && refund_status == 0 {
		statusName = "待评价"
	} else if paid == 1 && status == 3 && refund_status == 0 {
		statusName = "已完成"
	} else if paid == 1 && refund_status == 1 {
		statusName = "退款中"
	} else if paid == 1 && refund_status == 2 {
		statusName = "已退款"
	}

	return statusName
}

func payTypeName(pay_type string, paid int) string {
	payTypeName := "未支付"
	if paid == 1 {
		switch pay_type {
		case "weixin":
			payTypeName = "微信支付"
		case "yue":
			payTypeName = "余额支付"
		case "integral":
			payTypeName = "积分兑换"
		}
	}

	return payTypeName
}

func (d *Order) Del() error {
	return models.DelByStoreOrder(d.Ids)
}


func (d *Order) Save() error {
	return models.UpdateByStoreOrder(d.M)
}


func (d *Order) Deliver() error {
	if d.M.Status != 0 {
		return errors.New("订单状态错误")
	}
	var express models.YshopExpress
    err := global.YSHOP_DB.Model(&models.YshopExpress{}).Where("name = ?",d.M.DeliveryName).First(&express).Error
	if err != nil {
		return errors.New("请先添加快递公司")
	}
	global.YSHOP_LOG.Info(d.M.DeliveryId)
	d.M.Status = 1
	d.M.DeliverySn = express.Code
	return models.UpdateByStoreOrder(d.M)
}
