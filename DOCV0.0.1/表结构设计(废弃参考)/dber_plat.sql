CREATE TABLE `fitness_service` (
`id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
`name` varchar(50) NOT NULL COMMENT '健身服务名称',
`share` tinyint NOT NULL COMMENT '共用共享程度：1-可共用，2-不共用，3-半共用',
`coach_type` tinyint NOT NULL COMMENT '私教类型：1-私人教练，2-团体教练，3-不支持教练',
`group_lesson` tinyint NOT NULL COMMENT '是否允许团体课程：1-允许，2-不允许',
`booking` tinyint NOT NULL COMMENT '是否支持预订：1-是，2-否',
`individual` tinyint NOT NULL COMMENT '是否支持散客接待：1-支持、2-不支持',
`unit` varchar(5) NOT NULL COMMENT '用来统计场地个数、服务位置个数、最大容纳人数的单位',
PRIMARY KEY (`id`) 
)
AUTO_INCREMENT=1000
COMMENT='平台支持的健身服务项目';

CREATE TABLE `booking_strategy` (
`id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
`name` varchar(50) NOT NULL COMMENT '策略名称',
`begin_time` int NOT NULL DEFAULT 0 COMMENT '当天可预约起始时间，单位分钟',
`ent_time` int NOT NULL DEFAULT 1440 COMMENT '当天可预约结束时间，单位分钟',
`book_bofore_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '被预约时间段前置强制占用时间',
`book_after_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '被预约时间段后置强制占用时间',
`book_shortest_time` int UNSIGNED NOT NULL DEFAULT 60 COMMENT '最短预约时长',
`book_longest_time` int UNSIGNED NOT NULL DEFAULT 60 COMMENT '最长预约时长',
`book_current_start_offset` int UNSIGNED NOT NULL DEFAULT 55 COMMENT '预订起始时间隔当前时间至少为多长，单位分钟',
`book_offset_days` int UNSIGNED NOT NULL DEFAULT 8 COMMENT '可预订包括今天几天内的标的，单位天',
`content` varchar(500) NULL COMMENT '描述',
PRIMARY KEY (`id`) 
)
AUTO_INCREMENT=1000
COMMENT='标的预约时间策略表\r\n所有时间没有说明时皆以分钟为单位\r\n所有预约时间区间为前闭后开';

CREATE TABLE `img` (
`id` int UNSIGNED NOT NULL AUTO_INCREMENT,
`bs_id` bigint UNSIGNED NOT NULL,
`_type` smallint UNSIGNED NOT NULL COMMENT '业务类型：\r\n1-店铺环境\r\n2-场地图片（操课厅、拳击台）\r\n3-服务项目图解\r\n4-教练认证头像\r\n5-用户认证头像等\r\n6-店铺二维码\r\n7-教练认证证书\r\n8-体能测试结果',
`path` varchar(100) NOT NULL COMMENT '图片路径',
`_status` tinyint NOT NULL DEFAULT 1 COMMENT '状态：1-可用，2-删除，3-过期',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '图片创建时间',
PRIMARY KEY (`id`) ,
INDEX (`bs_id`)
)
AUTO_INCREMENT=1000
COMMENT='服务项目图片';

CREATE TABLE `dict` (
`id` int UNSIGNED NOT NULL AUTO_INCREMENT,
`category_id` smallint(20) UNSIGNED NOT NULL,
`enum_name` varchar(30) NOT NULL COMMENT '代码中的枚举名称',
`value` smallint UNSIGNED NOT NULL,
`label` varchar(20) NOT NULL,
`content` varchar(100) NULL COMMENT '字典项描述',
PRIMARY KEY (`id`) ,
INDEX (`category_id`)
)
AUTO_INCREMENT=1000;

CREATE TABLE `dict_category` (
`id` smallint UNSIGNED NOT NULL,
`category` varchar(20) NOT NULL COMMENT '字典类型名称',
`sys` varchar(30) NOT NULL COMMENT '系统名称',
`content` varchar(200) NULL COMMENT '描述',
PRIMARY KEY (`id`) 
)
AUTO_INCREMENT=1000
COMMENT='字典数据在对应业务系统里面一般以枚举表示\r\n相关业务方可以利用字典表数据查询了解相关系统字典信息';

CREATE TABLE `account` (
`id` int UNSIGNED NOT NULL AUTO_INCREMENT,
`name` varchar(50) NULL COMMENT '本平台昵称',
`cellphone` varchar(15) NULL COMMENT '手机号',
`password` varchar(64) NULL COMMENT '手机登录密码',
`bind_id` int NULL COMMENT '本账户被绑定的账户id，被绑定后，本账户数据将迁移到被绑定账户上，并且实现本账户',
`_status` tinyint NOT NULL COMMENT '账户状态：\r\n常规状态：\r\n1-启用\r\n2-绑定失效（被认证的其他账户绑定，数据已被迁移到其他账号上）\r\n3-登录锁定',
`pw_expired` tinyint NOT NULL DEFAULT 1 COMMENT '密码是否过期：1-否，2-是',
`_type` tinyint UNSIGNED NOT NULL COMMENT '账户类型：1-健身者，2-私教，3-店铺管理员',
PRIMARY KEY (`id`) 
)
AUTO_INCREMENT=1000
COMMENT='用户账户';

CREATE TABLE `account_third_open` (
`id` bigint NOT NULL,
`name` varchar(50) NULL COMMENT '三方平台昵称',
`open_id` varchar(50) NOT NULL,
`customer_id` int UNSIGNED NULL,
`coacher_id` int UNSIGNED NULL,
`_type` tinyint UNSIGNED NOT NULL COMMENT '账号平台类型：1-微信，2-QQ，3-支付宝，4-新浪微薄',
`shop_manage_id` int UNSIGNED NOT NULL,
INDEX (`open_id`)
)
AUTO_INCREMENT=1000;

CREATE TABLE `promotion_strategy` (
`id` int UNSIGNED NOT NULL AUTO_INCREMENT,
`name` varchar(50) NOT NULL,
`rule_get` varchar(400) NOT NULL COMMENT '优惠使用规则描述',
`rule_use` varchar(400) NOT NULL,
`shop_share` tinyint NOT NULL,
`coacher_share` tinyint NOT NULL,
`coacher_bonus_share` tinyint NOT NULL,
`promotion_share` tinyint NOT NULL,
`invalid_type` tinyint NOT NULL DEFAULT 1 COMMENT '失效类型：1-领取后多少天失效，2-指定失效日期',
`invalid_count_days` smallint NOT NULL DEFAULT 1 COMMENT 'invalid_type为1时表示领取后经过多少天，为2表示活动开始经过多少天失效',
`superposition` tinyint NOT NULL DEFAULT 2 COMMENT '可否叠加使用：1-可，2-否',
`booth_type` tinyint NOT NULL DEFAULT 1 COMMENT '活动界面展位：1-不需要',
`msg` tinyint NOT NULL DEFAULT 1 COMMENT '是否消息推送：1-是，2-否',
`promotion_start_time` datetime NOT NULL COMMENT '活动开始时间',
`promotion_end_time` datetime NOT NULL COMMENT '活动结束时间',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (`id`) ,
INDEX (`promotion_end_time`)
)
AUTO_INCREMENT=1000
COMMENT='优惠规则、使用等暂时每个策略一个接口实现，将来需要形成统一的模板策略服务';

CREATE TABLE `msg` (
`id` int UNSIGNED NOT NULL AUTO_INCREMENT,
`content` varchar(500) NOT NULL,
`_type` tinyint NOT NULL DEFAULT 1 COMMENT '消息类型：1-系统消息',
PRIMARY KEY (`id`) 
)
AUTO_INCREMENT=1000;

CREATE TABLE `promotion_customer` (
`id` bigint UNSIGNED NOT NULL,
`customer_id` int UNSIGNED NOT NULL,
`promotion_id` int UNSIGNED NOT NULL,
`promotion_name` varchar(50) NOT NULL COMMENT '促销名称',
`invalid_date` date NOT NULL COMMENT '失效日期',
`get_date` date NOT NULL COMMENT '获得日期',
`_status` tinyint NOT NULL COMMENT '状态：1-可用，2-过期、3-已用',
PRIMARY KEY (`id`) ,
INDEX (`customer_id`)
)
AUTO_INCREMENT=1000;


ALTER TABLE `dict` ADD CONSTRAINT `fk_dict_dict_category_1` FOREIGN KEY (`category_id`) REFERENCES `dict_category` (`id`);
ALTER TABLE `account_third_open` ADD CONSTRAINT `fk_account_third_open_account_customer_1` FOREIGN KEY (`customer_id`) REFERENCES `account` (`id`);
ALTER TABLE `account_third_open` ADD CONSTRAINT `fk_account_third_open_account_customer_2` FOREIGN KEY (`coacher_id`) REFERENCES `account` (`id`);
ALTER TABLE `promotion_customer` ADD CONSTRAINT `fk_promotion_customer_promotion_strategy_1` FOREIGN KEY (`promotion_id`) REFERENCES `promotion_strategy` (`id`);

