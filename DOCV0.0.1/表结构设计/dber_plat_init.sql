-- 平台zk参数初始化
INSERT INTO zk_param(path,_value,content) values('com/dber/shop/customer_recent_view_days','1','用户到店记录表统计周期及该表数据保留几天记录。');
INSERT INTO zk_param(path,_value,content) values('com/dber/shop/plat_score','100','店铺评分时，平台给予所有店铺的基础分数');
INSERT INTO zk_param(path,_value,content) values('com/dber/shop/vip_card_days_of_month','30','店铺年卡统一为每月天数');

INSERT INTO zk_param(path,_value,content) values('com/dber/shop/group/coach_price_percent','90','店铺团体课指定教练时，店铺支付给教练的费用（教练评估价的百分比）');
INSERT INTO zk_param(path,_value,content) values('com/dber/shop/group/coach_reserve_price_percent','10','店铺团体课指定教练时，店铺支付给教练的定金费用（教练评估价的百分比）');
INSERT INTO zk_param(path,_value,content) values('com/dber/shop/group/other_shop_price_percent','50','店铺团体课额外收费时，店铺获取百分比');
INSERT INTO zk_param(path,_value,content) values('com/dber/shop/group/other_coach_price_percent','20','店铺团体课额外收费时，教练获取百分比');
INSERT INTO zk_param(path,_value,content) values('com/dber/shop/group/other_plat_price_percent','15','店铺团体课额外收费时，平台获取百分比');
INSERT INTO zk_param(path,_value,content) values('com/dber/shop/group/other_promotion_price_percent','15','店铺团体课额外收费时，促销基金获取百分比');

INSERT INTO zk_param(path,_value,content) values('com/dber/shop/income/plat_price_percent','1','店铺所有收入平台抽取百分比');
INSERT INTO zk_param(path,_value,content) values('com/dber/shop/income/promotion_price_percent','1','店铺所有收入，促销基金抽取百分比');


-- 预订标的策略设置
INSERT INTO booking_strategy(id,name,before_time,ent_time,book_bofore_time,book_after_time,
		book_shortest_time,book_longest_time,book_current_start_offset,book_offset_days,content) 
values(1,'店铺场地预订策略',630,1320,0,5,60,720,30,7,
	'默认店铺场地预订策略，加载到内存，每个店铺使用时，使用自己的营业时间段覆盖默认时间段');

INSERT INTO booking_strategy(id,name,before_time,ent_time,book_bofore_time,book_after_time,
		book_shortest_time,book_longest_time,book_current_start_offset,book_offset_days,content) 
values(2,'教练预约策略',630,1290,0,30,60,60,480,7,
	'平台教练预约策略');

-- 字典信息

-- 消费项目：
编号 消费名目 （支付主体） （收入主体）
10000 门店消费(10001 门店消费收取、10000 门店消费支付)

11000 私教课程费
	（11001 私教课程费收取、11002 私教课程费私教抽成、11003 私教课程费奖金池抽成、11004 私教课程费平台抽成、11005 私教课程费促销抽成，11020 私教课时费支付
	11006 私教课未按时制作授课计划、11007 私教课没有制作授课计划、11008 私教课授课迟到、11009 私教课授课结果未按时做统计，
	11010 私教课未按时制作授课计划服务费返回、11011 私教课没有制作授课计划服务费返回、11012 私教课授课迟到服务费返回、11013 私教课未按时做授课结果记录服务费返回，
	11014 私教课退订费用支付、11015 私教课退订收取费用、11016 私教课退订教练抽成、11017 私教课退订平台抽成、11018 私教课退订奖金池抽成、
	11019 私教课退订促销抽成
	）
	
12 懒惰惩罚（12001 懒惰惩罚收取、12002 懒惰惩罚平台抽成、12003 懒惰惩罚懒惰基金收取、12005 懒惰惩罚）

13 年卡销售（13001 年卡销售收取、13002 年卡销售平台抽成、13003 购买转让年卡、13004 年卡转让店铺收取、13005 年卡转让平台抽成、13006 年卡转让促销抽成、13007 购买年卡、13008 转让年卡）

14 团体课程费
	（14001 支付团体课程教练费尾款、14002 支付团体课程教练费定金、
	14003 团体单项店铺收取、14004 团体单项教练抽成、14005 团体单项平台抽成、14006 团体单项促销抽成、14007 团体单项费用支出
	14008 预订团体单项支出、14009 预订团体单项收费、14010 预订团体单项教练抽成、14011 预订团体单项平台抽成、14012 预订团体单项促销抽成
	14013 退订团体单项支出、14014 退订团体单项收费、14015 退订团体单项教练抽成、14016 退订团体单项平台抽成、14017 退订团体单项促销抽成
	）
	
15 订场消费
	（15001 场地预约费、15002 场地退订费，15003 场地预约收费、15004 场地预约平台抽成、15005 场地预约促销抽成
	15006 场地消费费、15007 场地消费收费、15008 场地消费平台抽成、15009 场地消费奖金池抽成、15010 场地消费促销抽成）
	
16 锻炼计划服务
	（16001 购买健身计划、16002 健身计划收费、16003 健身计划平台抽成
	16004 健身计划完成超时罚款、16005 健身计划完成超时补偿、16006 健身计划超时平台抽成、16007 健身计划超时促销抽成
	）
	
17 店铺收入（17001 店铺收入平台抽成、17002 店铺收入促销抽成）

18 体能测试
	（18001 体能测试收费、18002 体能测试教练抽成、18003 体能测试促销补偿、18004 体能测试购买）
	
19 体验服务（19001 体验课差额补缴、19002 体验课店铺补偿、19003 体验课教练补偿、19005 体验课奖金池补偿、19006 体验课促销补偿）

20 促销服务（）

21 退卡（21001 退卡手续费支出、21002 退卡手续费收取）

--店铺账单类型：
shop(
10001 门店消费收取 common               
11001 私教课程费收取 coacher
11015 私教课退订收取费用 coacher_cancel
12001 懒惰惩罚收取 lazy_punishment
13001 年卡销售收取 vip_card
13007 年卡转让收取 vip_card_transfer
14001 支付团体课程教练费尾款 group_coacher_final_payment
14002 支付团体课程教练费定金 group_coacher_earnest
14003 团体单项店铺收取 _group
14009 预订团体单项收费 group_earnest
14014 退订团体单项收费 group_earnest_cancel
15003 场地预约收费 booking_earnest
15007 场地消费收费 booking
18001 体能测试收费 fitness_test
19002 体验课店铺补偿 trial_class_compensation 
	)

lazy_punishment(
12003 懒惰惩罚懒惰基金收取
)

plat(
11004 私教课程费平台抽成 coacher
11017 私教课退订平台抽成 coacher_cancel
12002 懒惰惩罚平台抽成 lazy_punishment
13002 年卡销售平台抽成 vip_card
13005 年卡转让平台抽成 vip_card_transfer
14005 团体单项平台抽成 _group
14011 预订团体单项平台抽成 group_earnest
14016 退订团体单项平台抽成 group_earnest_cancel
15004 场地预约平台抽成 booking_earnest
15008 场地消费平台抽成 booking
16003 健身计划平台抽成 fitness_plan
16006 健身计划超时平台抽成 fitness_plan_overtime
17001 店铺收入平台抽成 shop
21002 退卡手续费收取
	)

promotion(
11005 私教课程费促销抽成 coacher
11019 私教课退订促销抽成 coacher_cancel
13006 年卡转让促销抽成 vip_card_transfer
14006 团体单项促销抽成 _group
14012 预订团体单项促销抽成 group_earnest
14017 退订团体单项促销抽成 group_earnest_cancel
15005 场地预约促销抽成 booking_earnest
15010 场地消费促销抽成 booking
16007 健身计划超时促销抽成 fitness_plan_overtime
17002 店铺收入促销抽成 shop
18003 体能测试促销补偿 fitness_test
19006 体验课促销补偿 trial_class_compensation
	)

coacher_bonus(
11003 私教课程费奖金池抽成 coacher
11018 私教课退订奖金池抽成 coacher_cancel
15009 场地消费奖金池抽成 booking
19005 体验课奖金池补偿 trial_class_compensation
)

customer(
10000 门店消费支付
11010 私教课未按时制作授课计划服务费返回 coacher_plan_overtime
11011 私教课没有制作授课计划服务费返回 coacher_plan_no
11012 私教课授课迟到服务费返回 coacher_plan_late
11013 私教课未按时做授课结果记录服务费返回 coacher_plan_result_record
11014 私教课退订费用支付 coacher_cancel
11020 私教课时费支付 coacher
12005 懒惰惩罚
13003 购买转让年卡 vip_card_transfer_buy
13007 购买年卡 vip_card
13008 转让年卡 vip_card_transfer
14007 团体单项费用支出 _group
14008 预订团体单项支出 group_earnest
14013 退订团体单项支出 group_earnest_cancel
15001 场地预约费 booking_earnest
15002 场地退订费 booking_earnest_cancel
15006 场地消费费 booking
16001 购买健身计划 fitness_plan
16005 健身计划完成超时补偿 fitness_plan_overtime
18004 体能测试购买 fitness_test
19001 体验课差额补缴 trial_class_excess
21001 退卡手续费支出
)

coacher(
11002 私教课程费私教抽成 coacher
11006 私教课未按时制作授课计划 coacher_plan_overtime
11007 私教课没有制作授课计划 coacher_plan_no
11008 私教课授课迟到 coacher_plan_late
11009 私教课授课结果未按时做统计 coacher_plan_result_record
11016 私教课退订教练抽成 coacher_cancel
14004 团体单项教练抽成 _group
14010 预订团体单项教练抽成 group_earnest
14015 退订团体单项教练抽成 group_earnest_cancel
16002 健身计划收费 fitness_plan
16004 健身计划完成超时罚款 fitness_plan_overtime
18002 体能测试教练抽成 fitness_test
19003 体验课教练补偿 trial_class_compensation
)


-- 账单类型：1-常规消费,2-私教课程，3-懒惰惩罚，4-年卡销售，5-团体课程费，6-体能测试费
INSERT INTO dict_category(id,category,sys,content) values(1,'账单类型','bill','系统所有账单流水的类型，在dict的value中，前面3位表示');