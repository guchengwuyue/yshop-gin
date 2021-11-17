<h1 style="text-align: center">yshop-gin意象商城后台管理系统</h1>




#### 项目简介
yshop-gin意象商城后台管理系统(目前版本v1.0)基于当前流行技术组合的前后端商城管理系统：Gin+Gorm+Casbin+Jwt+Redis+Mysql8+Vue
的前后端分离电商管理系统，权限控制采用RBAC，支持商城多级分类，商品管理、商品sku、图片素材、数据字典与数据权限管理，支持动态路由等


#### 项目文档（还在完善中...，小伙伴记得star）

 文档地址：[https://gitee.com/guchengwuyue/yshop-gin/wikis/pages](http://gitee.com/guchengwuyue/yshop-gin/wikis/pages)


#### 项目源码

|     |   后端源码  |   前端源码  |
|---  |--- | --- |
|  码云  |  https://gitee.com/guchengwuyue/yshop-gin   |  https://gitee.com/guchengwuyue/yshop-gin-vue   |
|  github   | https://github.com/guchengwuyue/yshop-gin  |  https://github.com/guchengwuyue/yshop-gin-vue |


####  系统功能
- 用户管理：提供用户的相关配置 
- 角色管理：对权限与菜单进行分配，可根据部门设置角色的数据权限 
- 菜单管理：已实现菜单动态路由，后端可配置化 
- 部门管理：可配置系统组织架构，树形表格展示 
- 岗位管理：配置各个部门的职位 
- 字典管理：可维护常用一些固定的数据，如：状态，性别等 
- 日志管理：用户操日志记录 
- 素材管理：图片素材库 <br>
- 分类管理：商品多级分类 <br>
- sku管理：商品sku规则管理 <br>
- 商品管理：可以添加单规格或者多规格商品含有百度编辑器 <br>

#### 详细结构

```
- app 应用模块
    - controllers 控制器模块
    - models 模型模块
    - service 服务模块
      - product_serive
      ......
- conf 公共配置
- docs swagger
- middleware 中间件
	- cors.go 
	......
- pkg 程序应用包
  - app
  - casbin
  - jwt
  .....
- routere 路由
- logs 日志存放
- runtime 资源目录
```
#### 配置、启动、部署
```
1、安装go>=1.15,这个可以https://studygolang.com/dl下载

2、开启mod： go env -w GO111MODULE=on

3、配置代理：go env -w GOPROXY=https://goproxy.cn,direct 这个让下载依赖速度更快

4。下载项目：git clone https://gitee.com/guchengwuyue/yshop-gin.git

5、go mod tidy 安装所需依赖

6、导入sql/yshop_go.sql,修改conf/app.ini 里数据库与redis配置

7、本地运行air -c .air.conf 启动即可

8、线上部署： go build  打包然后上传服务器命令： nohup ./go-mall & 

9、配置nginx 反向代理即可
```
#### 功能说明
0、素材库
| ![输入图片说明](https://images.gitee.com/uploads/images/2021/1009/111026_1317d805_477893.png "suicai.png") |
|--|

1、商品分类
| ![输入图片说明](https://images.gitee.com/uploads/images/2021/1009/110639_af31d4e3_477893.png "shop1.png") |
|--|
| ![输入图片说明](https://images.gitee.com/uploads/images/2021/1009/110741_52c0ec39_477893.png "fenlei2.png") |
|--|
2、商品sku
| ![输入图片说明](https://images.gitee.com/uploads/images/2021/1009/110820_ca7f0034_477893.png "guige1.png") |
|--|
| ![输入图片说明](https://images.gitee.com/uploads/images/2021/1009/110830_c5221dae_477893.png "guige2.png") |
3、商品管理
|  ![输入图片说明](https://images.gitee.com/uploads/images/2021/1009/110908_81785443_477893.png "shangpin1.png")|
|--|
| ![输入图片说明](https://images.gitee.com/uploads/images/2021/1009/110917_2dbcfe03_477893.png "shangpin2.png") |
| ![输入图片说明](https://images.gitee.com/uploads/images/2021/1009/110938_0aee30d6_477893.png "shangpin3.png") |
|--|

4、系统用户
| ![输入图片说明](https://images.gitee.com/uploads/images/2021/1009/111101_7cc3c7f0_477893.png "yonghu.png") |
|--|
5、系统角色
| ![输入图片说明](https://images.gitee.com/uploads/images/2021/1009/111136_bdc744be_477893.png "juese.png") |
|--|
6、系统菜单
| ![输入图片说明](https://images.gitee.com/uploads/images/2021/1009/111202_9ffbd62a_477893.png "caidan1.png") |
|--|



#### 技术选型
* 1 后端使用技术
    * 1.1 gin
    * 1.2 jwt
    * 1.3 redis
    * 1.5 Mysql8
    * 1.6 Gorm
    * 1.7 copier
    * 1.8 ksuid
    * 1.9 Redis
    * 1.10 swagger
    * 1.11 Casbin
        
* 前端使用技术
    * 2.1 Vue 全家桶
    * 2.2 Element

#### 特别鸣谢

- go-gin-example:https://github.com/EDDYCJY/go-gin-example
- gorm:https://gorm.io/
- casbin:https://casbin.org/
- vue:https://github.com/vuejs/vue
- element:https://github.com/ElemeFE/element

