-- 2015-07-20 execute --
/*
Navicat MySQL Data Transfer

Source Server         : slave
Source Server Version : 50543
Source Host           : 10.10.3.17:3306
Source Database       : transaction

Target Server Type    : MYSQL
Target Server Version : 50543
File Encoding         : 65001

Date: 2015-07-13 10:49:25
*/
SET character_set_client = utf8;
SET character_set_connection = utf8;
SET character_set_database = utf8;
SET character_set_results = utf8;
SET character_set_server = utf8;
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_tansaction_right_resources
-- ----------------------------
DROP TABLE IF EXISTS `tb_tansaction_right_resources`;
CREATE TABLE `tb_tansaction_right_resources` (
  `id` bigint(20) NOT NULL,
  `limit_Id` int(11) DEFAULT NULL,
  `url_domain` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `param` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `is_delete` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_trans_account
-- ----------------------------
DROP TABLE IF EXISTS `tb_trans_account`;
CREATE TABLE `tb_trans_account` (
  `id` bigint(11) NOT NULL,
  `customer_id` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `account_type` char(2) DEFAULT NULL COMMENT '账户类型',
  `customer_name` varchar(32) DEFAULT NULL COMMENT '用户名称',
  `freeze_uncash_amount` decimal(15,2) DEFAULT NULL COMMENT '冻结不可提现金额',
  `freeze_cash_amount` decimal(15,2) DEFAULT NULL COMMENT '冻结提现金额',
  `uncash_amount` decimal(15,2) DEFAULT NULL COMMENT '不可提现金额',
  `cash_amount` decimal(15,2) DEFAULT NULL COMMENT '可提现金额',
  `stat` char(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `balance`  decimal(15,2) ,
  `remark` varchar(255) DEFAULT NULL,
  `total_crash` decimal(15,2),
  `check_value` varchar(32) DEFAULT NULL COMMENT '账户的认证信息，是账户的用户名和其他的身份标示的加密，采用des编码',
  `parrent_id` bigint(11) DEFAULT NULL ,
  `version` int(11),
  `pay_psd` varchar(32) DEFAULT NULL,
  `query_psd` varchar(32) DEFAULT NULL,
  `is_delete` char(2) DEFAULT NULL ,
  `salt` varchar(20),
  `mobile` char(12) DEFAULT NULL,
  `mail` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_trans_account_bankcards
-- ----------------------------
DROP TABLE IF EXISTS `tb_trans_account_bankcards`;
CREATE TABLE `tb_trans_account_bankcards` (
  `id` bigint(20) NOT NULL,
  `bank_id` varchar(32) DEFAULT NULL,
  `bank_name` varchar(128) DEFAULT NULL COMMENT '银行名称',
  `create_bank` varchar(128) DEFAULT NULL COMMENT '开户行',
  `bank_mobile` char(11) DEFAULT NULL COMMENT '绑定手机号',
  `bank_box` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `account_id` bigint(20) DEFAULT NULL,
  `customer_id` varchar(32) DEFAULT NULL,
  `bank_three` smallint(6),
  `bank_create_date` datetime,
  `bank_end_date` datetime,
  `is_check` char(1) DEFAULT NULL COMMENT '用户是否已验证银行信息',
  `check_date` datetime DEFAULT NULL  ,
  `check_code` varchar(32) DEFAULT NULL  ,
  `create_date` datetime DEFAULT NULL  ,
  `create_type` char(1) DEFAULT NULL COMMENT '创建方式，系统创建，操作人',
  `bank_type` char(1) DEFAULT NULL COMMENT '银行卡类型，借记卡，信用卡',
  `remark` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `is_delete` char(1) DEFAULT NULL,
  `card_id` varchar(32) DEFAULT NULL,
  `card_holder` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_trans_account_op
-- ----------------------------
DROP TABLE IF EXISTS `tb_trans_account_op`;
CREATE TABLE `tb_trans_account_op` (
  `id` bigint(20) NOT NULL,
  `custom_id` varchar(32) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `op_type` char(1) DEFAULT NULL,
  `op_create_date` datetime,
  `op_name` varchar(32) DEFAULT NULL ,
  `op_id` bigint(20) DEFAULT NULL ,
  `remark` varchar(255) DEFAULT NULL,
  `accout_type` char(1) DEFAULT NULL,
  `is_delete` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_trans_account_seq
-- ----------------------------
DROP TABLE IF EXISTS `tb_trans_account_seq`;
CREATE TABLE `tb_trans_account_seq` (
  `id` bigint(20) NOT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `seg_flag` char(1) DEFAULT NULL COMMENT '帐务变动方向 0-来帐 1-往帐',
  `customer_id` varchar(32) DEFAULT NULL,
  `change_type` char(2) DEFAULT NULL COMMENT ' 01充值  02支付  03提现 \n04 内部调账  05 结息 06利息税 07原交易退款 08原交易撤销',
  `pre_cash_amount` DECIMAL(15,2) DEFAULT NULL  COMMENT '资金变化前cash_amount数值',
  `pre_uncash_amount` DECIMAL(15,2) DEFAULT NULL  COMMENT '资金变化前uncash_amount数值',
  `change_cash_amount` DECIMAL(15,2) DEFAULT NULL COMMENT '资金cash_amount变化的量',
  `change_uncash_amount` DECIMAL(15,2) DEFAULT NULL COMMENT '资金uncash_amount变化的量',
  `after_cash_amount` DECIMAL(15,2) DEFAULT NULL  COMMENT '资金变化后cash_amount数值',
  `after_uncash_amount` DECIMAL(15,2) DEFAULT NULL  COMMENT '资金变化后uncash_amount数值',
  `refsn_trans` bigint(20) DEFAULT NULL COMMENT '关联流水,change_type对应不同的表，充值流水 支付流水 提现流水',
  `trans_order_id` bigint(20) DEFAULT NULL COMMENT '交易订单号',
  `create_time` datetime DEFAULT NULL ,
  `remark` varchar(255) DEFAULT NULL ,
  `work_date` datetime DEFAULT NULL COMMENT '与会计凭证进行核算的日期',
  `version` int(11) DEFAULT NULL,
  `is_delete` char(1) DEFAULT NULL ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_trans_account_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_trans_account_type`;
CREATE TABLE `tb_trans_account_type` (
  `id` bigint(20) NOT NULL,
  `if_monitor` char(2) DEFAULT NULL COMMENT '是否监管',
  `type_name` varchar(32) DEFAULT NULL COMMENT ' 类型名称',
  `monitor_bank_type` varchar(16) DEFAULT NULL COMMENT '监管开户行行别',
  `monitor_account` varchar(32) DEFAULT NULL COMMENT ' 监管账号',
  `monitor_account_name` varchar(32) DEFAULT NULL,
  `if_trans_out` char(2) DEFAULT NULL COMMENT '是否允许平台内转帐,此字段主要用于控制不同客户之间的相同类型子账户是否可以互转',
  `if_accrual` char(1) DEFAULT NULL COMMENT '是否计息',
  `if_fixedbank_input` char(1) DEFAULT NULL COMMENT '确定该子账户是否必须从绑定的卡充值',
  `if_fixedbank_put` char(1) DEFAULT NULL COMMENT '确定该子账户是否必须从提定的卡提现',
  `version` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `is_delete` char(1) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_trans_adjust_seq
-- ----------------------------
DROP TABLE IF EXISTS `tb_trans_adjust_seq`;
CREATE TABLE `tb_trans_adjust_seq` (
  `id` bigint(20) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `is_delete` char(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `trans_no` bigint(20) DEFAULT NULL COMMENT '要被调账的交易流水',
  `why_adjust` char(2) DEFAULT NULL,
  `op_id` bigint(20) DEFAULT NULL , 
  `op_name` varchar(32) DEFAULT NULL ,
  `result` char(2) DEFAULT NULL COMMENT '调账的结果，0删除，1添加金额，2减少金额，3添加交易流水',
  `account` decimal(15,2) DEFAULT NULL COMMENT '调账的金额，及交易流水增加或者减少',
  `trans_sn` bigint(11) DEFAULT NULL COMMENT '被删除的，被增加的交易流水',
  `check_user` bigint(20) DEFAULT NULL ,
  `check_time` datetime DEFAULT NULL ,
  `check_state` char(2) DEFAULT NULL COMMENT '审核状态01－待审核02－审核通过',
  `remark` varchar(255) DEFAULT NULL,
  `asile_no` bigint(20) DEFAULT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `trans_type` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_trans_aisle_bank
-- ----------------------------
DROP TABLE IF EXISTS `tb_trans_aisle_bank`;
CREATE TABLE `tb_trans_aisle_bank` (
  `id` bigint(20) NOT NULL,
  `bank_type` varchar(32) DEFAULT NULL COMMENT '通道支持的银行卡列表',
  `version` int(11) DEFAULT NULL,
  `is_delete` char(1) DEFAULT NULL  ,
  `create_time` datetime DEFAULT NULL,
  `aisle_no` bigint(20) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_trans_aisle_fee
-- ----------------------------
DROP TABLE IF EXISTS `tb_trans_aisle_fee`;
CREATE TABLE `tb_trans_aisle_fee` (
  `id` bigint(20) NOT NULL,
  `aisle_no` bigint(20) DEFAULT NULL  ,
  `rate` decimal(15,2) DEFAULT NULL  ,
  `aisle_name` varchar(32) DEFAULT NULL  ,
  `priority` smallint(6) DEFAULT NULL  ,
  `limit_amount` decimal(15,2) DEFAULT NULL  ,
  `fee_method` char(2) DEFAULT NULL  ,
  `fee_cycle` char(2) DEFAULT NULL  ,
  `fee_mode` char(1) DEFAULT NULL  ,
  `version` int(11) DEFAULT NULL,
  `is_delete` char(1) DEFAULT NULL  ,
  `create_time` datetime DEFAULT NULL,
  `status` char(1) DEFAULT NULL  ,
  `tran_type` char(2) DEFAULT NULL  ,
  `fee_down` decimal(15,2) DEFAULT NULL  ,
  `fee_up` decimal(15,2) DEFAULT NULL ,
  `remak` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_trans_bank
-- ----------------------------
DROP TABLE IF EXISTS `tb_trans_bank`;
CREATE TABLE `tb_trans_bank` (
  `id` bigint(20) NOT NULL,
  `bank_code` varchar(32) DEFAULT NULL,
  `bank_name` varchar(32) DEFAULT NULL  ,
  `bank_type` varchar(16) DEFAULT NULL COMMENT '自定义行别',
  `center_bank_type` varchar(16) DEFAULT NULL COMMENT '行别',
  `city_code` varchar(255) DEFAULT NULL COMMENT '银行所在的城市代码 支付系统中的',
  `ccpc_code` char(4) DEFAULT NULL COMMENT '所属CCPC代码',
  `version` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `is_delete` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_trans_bind_bank_op
-- ----------------------------
DROP TABLE IF EXISTS `tb_trans_bind_bank_op`;
CREATE TABLE `tb_trans_bind_bank_op` (
  `id` bigint(20) NOT NULL,
  `change_type` char(2) DEFAULT NULL  ,
  `account_id` bigint(20) DEFAULT NULL  ,
  `bank_type` varchar(16) DEFAULT NULL  ,
  `bank_addr` varchar(32) DEFAULT NULL  ,
  `bank_card_no` varchar(32) DEFAULT NULL ,
  `card_bind_time` datetime DEFAULT NULL ,
  `remark` varchar(255) DEFAULT NULL ,
  `version` int(11) DEFAULT NULL,
  `is_delete` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_trans_bw_list
-- ----------------------------
DROP TABLE IF EXISTS `tb_trans_bw_list`;
CREATE TABLE `tb_trans_bw_list` (
  `id` bigint(20) NOT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `op_id` bigint(20) DEFAULT NULL  ,
  `op_name` varchar(32) DEFAULT NULL  ,
  `account_name` varchar(32) DEFAULT NULL,
  `is_delete` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_trans_card_bin
-- ----------------------------
DROP TABLE IF EXISTS `tb_trans_card_bin`;
CREATE TABLE `tb_trans_card_bin` (
 `id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(32) DEFAULT NULL COMMENT '发卡行名称',
  `code` char(10) DEFAULT NULL COMMENT '机构代码',
  `card_name` varchar(32) DEFAULT NULL COMMENT '卡名',
  `card_length` varchar(32) DEFAULT NULL COMMENT '卡长度',
  `card_id` varchar(32) DEFAULT NULL COMMENT '主账户',
  `create_bank_length` varchar(18) DEFAULT NULL COMMENT '发卡行标示长度',
  `create_bank` varchar(18) DEFAULT NULL COMMENT '发卡行标示',
  `card_type` varchar(32) DEFAULT NULL COMMENT '卡类型',
  `remark` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `is_delete` char(1) DEFAULT NULL,
  `card_type_code` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_trans_card_bin
-- ----------------------------

-- ----------------------------
-- Table structure for tb_trans_city
-- ----------------------------
DROP TABLE IF EXISTS `tb_trans_city`;
CREATE TABLE `tb_trans_city` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `city_code` varchar(32) DEFAULT NULL  ,
  `city_level` char(2) DEFAULT NULL COMMENT '1-全国2-省3-市',
  `level_name` varchar(32) DEFAULT NULL COMMENT '地区名称',
  `super_level_code` varchar(32) DEFAULT NULL COMMENT '上级城市代码,全国定义为0000',
  `version` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `is_delete` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_trans_freeze_seq
-- ----------------------------
DROP TABLE IF EXISTS `tb_trans_freeze_seq`;
CREATE TABLE `tb_trans_freeze_seq` (
  `id` bigint(20) NOT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `customer_id` varchar(32) DEFAULT NULL,
  `freeze_cash_amount` decimal(15,2) DEFAULT NULL COMMENT '可提现冻结发生额',
  `freeze_uncash_amount` decimal(15,2) DEFAULT NULL,
  `change_type` char(2) DEFAULT NULL COMMENT '01充值  02支付  03提现 \n04 内部调账  05 结息 06利息税 07原交易退款 08原交易撤销',
  `refsn_trans` bigint(11) DEFAULT NULL COMMENT '关联流水',
  `refsn_trans_batchid` varchar(64) DEFAULT NULL COMMENT '原批次号',
  `state` char(2) DEFAULT NULL COMMENT '00冻结 01解冻',
  `create_time` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL ,
  `work_date` datetime DEFAULT NULL  ,
  `version` int(11) DEFAULT NULL,
  `is_delete` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_trans_login_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_trans_login_info`;
CREATE TABLE `tb_trans_login_info` (
  `id` bigint(20) NOT NULL,
  `login_name` varchar(32) DEFAULT NULL  ,
  `account_id` bigint(20) DEFAULT NULL  ,
  `account_flag` char(2) DEFAULT NULL COMMENT '用户所属客户标识,01:主登陆名02:企业自建登陆名员',
  `login_pwd` varchar(64) DEFAULT NULL ,
  `login_pwd_date` datetime DEFAULT NULL ,
  `mobile` varchar(32) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `state` char(2) DEFAULT NULL COMMENT '00：待激活01：离线02：在线03：注销',
  `expire_time` datetime DEFAULT NULL  ,
  `rand_num` varchar(32) DEFAULT NULL  ,
  `user_type` char(2) DEFAULT NULL COMMENT '0管理员1业务主管2操作员',
  `last_login_time` datetime DEFAULT NULL,
  `allow_error_login_count` int(11) DEFAULT NULL COMMENT '错误登陆次数,每天登陆错误超过一定次数后，当天拒绝登陆',
  `version` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `is_delete` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_trans_pay_root
-- ----------------------------
DROP TABLE IF EXISTS `tb_trans_pay_root`;
CREATE TABLE `tb_trans_pay_root` (
  `id` bigint(20) NOT NULL,
  `asile_no` bigint(20) DEFAULT NULL,
  `asile_name` varchar(32) DEFAULT NULL ,
  `amount` decimal(15,2) DEFAULT NULL ,
  `is_split` char(1) DEFAULT NULL ,
  `split_count` int(11) DEFAULT NULL ,
  `parrent_id` bigint(20) DEFAULT NULL ,
  `split_time` datetime DEFAULT NULL ,
  `success_pay_time` datetime DEFAULT NULL ,
  `trans_stat` char(1) DEFAULT NULL ,
  `trans_type` char(2) DEFAULT NULL ,
  `version` int(11) DEFAULT NULL,
  `trans_sn` bigint(20) DEFAULT NULL COMMENT '实际交易流水',
  `remark` varchar(128) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `is_delete` char(2) DEFAULT NULL,
  `batch_id` bigint(20) DEFAULT NULL COMMENT '交易批次号',
  `business_type` char(2) DEFAULT NULL COMMENT 'COMMENT ''01充值  02支付  03提现 \n04 内部调账  05 结息 06利息税 07原交易退款 08原交易撤销',
  `work_time` datetime DEFAULT NULL,
  `error_type` char(2) DEFAULT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `idevice_type` char(2) DEFAULT NULL,
  `trans_create_time` datetime DEFAULT NULL,
  `trans_come` varchar(128) DEFAULT NULL,
  `account_name` char(18) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_trans_pay_seq
-- ----------------------------
DROP TABLE IF EXISTS `tb_trans_pay_seq`;
CREATE TABLE `tb_trans_pay_seq` (
  `id` bigint(20) NOT NULL,
  `work_id` varchar(64) DEFAULT NULL COMMENT '业务订单主键',
  `tran_stat` char(2) DEFAULT NULL COMMENT '交易状态，支付中，撤销，支付完成',
  `pay_account_type` char(2) DEFAULT NULL  ,
  `is_split` char(1) DEFAULT NULL ,
  `pay_account_name` varchar(32) DEFAULT NULL,
  `tran_type` char(8) DEFAULT NULL  ,
  `asile_type` char(2) DEFAULT NULL COMMENT '接入通道类型，是快捷还是网银等等',
  `create_date` datetime DEFAULT NULL  ,
  `end_date` datetime DEFAULT NULL ,
  `success_date` datetime DEFAULT NULL ,
  `order_crash` decimal(15,2) DEFAULT NULL ,
  `pay_crash` decimal(15,2) DEFAULT NULL  ,
  `fact_crash` decimal(15,2) DEFAULT NULL ,
  `money_type` varchar(16) DEFAULT NULL ,
  `idevice_type` char(2) DEFAULT NULL COMMENT '接入支付平台，是apad，pc 还是移动端',
  `come_url` varchar(256) DEFAULT NULL ,
  `pay_bank_id` bigint(20) DEFAULT NULL COMMENT '用户银行卡编号',
  `pay_bank_name` varchar(32) DEFAULT NULL COMMENT  '持卡人姓名',
  `pay_identity_card` varchar(32) DEFAULT NULL COMMENT '开户身份证号',
  `pay_bank_mobile` int(11) DEFAULT NULL COMMENT '银行卡绑定手机号',
  `pay_bank_create_date` datetime DEFAULT NULL COMMENT '银行卡有效开始时间',
  `pay_bank_end_date` datetime DEFAULT NULL COMMENT '银行卡有效截止时间',
  `pay_create_bank` varchar(32) DEFAULT NULL COMMENT '开户行',
  `pay_bank_type` varchar(4) DEFAULT NULL COMMENT '银行卡类型',
  `pay_type` char(2) DEFAULT NULL COMMENT '支付类型,账户交易，银行卡交易等等',
  `note_stat` char(1) DEFAULT NULL ,
  `is_pay_account` char(1) DEFAULT NULL COMMENT '支付方是否是平台用户',
  `payee_account_type` char(1) DEFAULT NULL COMMENT '收款方是平台账户类型',
  `payee_account_id` bigint(20) DEFAULT NULL COMMENT ' 收款方账户id',
  `pay_bank_addr_no` varchar(4) DEFAULT NULL COMMENT '付款方开户行地区代码',
  `is_aisle_pay` char(1) DEFAULT NULL COMMENT '是否第三方通道支',
  `aisle_fee` decimal(15,2) DEFAULT NULL  ,
  `aisle_real_amount` decimal(15,2) DEFAULT NULL  ,
  `expire_time` datetime DEFAULT NULL COMMENT '未支付失效时间',
  `settle_date` datetime DEFAULT NULL COMMENT '结算日期,外部系统提供，供外部系统对账用 ',
  `check_state` char(2) DEFAULT NULL COMMENT ' 对账状态,00未对账 01 对帐中 02已对账成功 03 对帐失败',
  `to_url` varchar(256) DEFAULT NULL,
  `split_count` int(11) DEFAULT NULL ,
  `parent_id` bigint(20) DEFAULT NULL ,
  `asile_no` bigint(20) DEFAULT NULL ,
  `batch_id` bigint(20) DEFAULT NULL,
  `payee_account_name` varchar(32) DEFAULT NULL ,
  `payee_bank_no` bigint(20) DEFAULT NULL COMMENT ' 收款方帐号',
  `payee_bank_name` varchar(32) DEFAULT NULL COMMENT '收款方帐号户名',
  `payee_bank_type` char(2) DEFAULT NULL COMMENT '收款方银行卡类型',
  `payee_create_bank` varchar(32) DEFAULT NULL COMMENT '收款方银行卡开户行',
  `payee_bank_addr_no` varchar(4) DEFAULT NULL COMMENT ' 收款方开户行地区代码 ',
  `good_id` varchar(64) DEFAULT NULL ,
  `good_remark` varchar(128) DEFAULT NULL ,
  `remark` varchar(256) DEFAULT NULL ,
  `version` int(11) DEFAULT NULL,
  `is_payee_account` char(1) DEFAULT NULL ,
  `is_delete` char(1) DEFAULT NULL ,
  `business_type` char(2) DEFAULT NULL COMMENT '01充值  02支付  03提现 \n04 内部调账  05 结息 06利息税 07原交易退款 08原交易撤销',
  `goods_count` int(11) DEFAULT NULL,
  `pay_sn` bigint(20) DEFAULT NULL ,
  `payer_mobile_mail` varchar(32) DEFAULT NULL,
  `payee_mobile_mail` varchar(32) DEFAULT NULL,
  `fee_type` char(4) DEFAULT NULL,
  `pay_account_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_trans_quickbuck
-- ----------------------------
DROP TABLE IF EXISTS `tb_trans_quickbuck`;
CREATE TABLE `tb_trans_quickbuck` (
  `id` bigint(20) NOT NULL,
  `pay_name` varchar(16) DEFAULT NULL COMMENT '收款方姓名',
  `pay_account_id` bigint(20) DEFAULT NULL COMMENT '付收款方账户',
  `money_type` char(1) DEFAULT NULL COMMENT '货比类型',
  `amount` decimal(15,2) DEFAULT NULL ,
  `deal_id` varchar(32) DEFAULT NULL COMMENT '块钱交易号',
  `deal_fee` decimal(10,2) DEFAULT NULL COMMENT '块钱交易费',
  `payee_fee` decimal(10,2) DEFAULT NULL,
  `payer_fee` decimal(10,2) DEFAULT NULL,
  `result_flag` char(2) DEFAULT NULL COMMENT '块钱执行结果,true或者false',
  `failure_cause` int(11) DEFAULT NULL COMMENT '失败原因代码',
  `pay_phone` char(12) DEFAULT NULL,
  `pay_mail` varchar(32) DEFAULT NULL,
  `order_id` varchar(64) DEFAULT NULL,
  `pay_bank_addrno` char(8) DEFAULT NULL ,
  `pay_bank_type` varchar(16) DEFAULT NULL COMMENT '付收款方开户行行别',
  `pay_bank_name` varchar(16) DEFAULT NULL COMMENT '付收款方银行名称',
  `pay_bank_cardno` varchar(16) DEFAULT NULL COMMENT '收付款方帐号',
  `trans_start_time` datetime DEFAULT NULL COMMENT '交易开始时间',
  `trans_end_time` datetime DEFAULT NULL COMMENT '交易结束时间',
  `order_amount` decimal(15,2) DEFAULT NULL COMMENT '订单金额',
  `succeed_amount` decimal(15,2) DEFAULT NULL COMMENT '成功转入金额',
  `version` int(11) DEFAULT NULL,
  `is_delete` char(2) DEFAULT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `work_time` datetime DEFAULT NULL,
  `trans_type` char(2) DEFAULT NULL,
  `business_type` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_trans_recharge_seq
-- ----------------------------
DROP TABLE IF EXISTS `tb_trans_recharge_seq`;
CREATE TABLE `tb_trans_recharge_seq` (
  `id` bigint(20) NOT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `account_name` varchar(32) DEFAULT NULL COMMENT '用户名',
  `recharge_type` char(2) DEFAULT NULL COMMENT '充值类型,1汇款、2网银、3账户验证d等等',
  `bank_type` char(2) DEFAULT NULL COMMENT '行别',
  `bank_code` varchar(32) DEFAULT NULL COMMENT '行号,支付系统行号',
  `bank_name` varchar(32) DEFAULT NULL COMMENT ' 开户行行名',
  `bank_addr_no` varchar(4) DEFAULT NULL COMMENT '开户行地区代码',
  `bank_card_no` varchar(32) DEFAULT NULL COMMENT '账号',
  `bank_card_name` varchar(32) DEFAULT NULL COMMENT '户名',
  `amount` decimal(15,2) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL ,
  `bank_result_code` varchar(32) DEFAULT NULL COMMENT '银行返回码',
  `bank_result_note` varchar(256) DEFAULT NULL COMMENT '银行备注',
  `result_code` varchar(32) DEFAULT NULL COMMENT '返回码,给客户展现',
  `result_note` varchar(256) DEFAULT NULL COMMENT '返回说明,给客户展现',
  `bank_time` datetime DEFAULT NULL COMMENT '银行回执更新时间',
  `state` char(2) DEFAULT NULL COMMENT '状态,00 待充值,01 充值中,02 成功,03 失败',
  `check_state` char(2) DEFAULT NULL COMMENT ' 对账状态,00未对账,01 对帐中,02已对账成功,03 对帐失败',
  `work_date` datetime DEFAULT NULL ,
  `settle_date` datetime DEFAULT NULL COMMENT '结算日期,外部系统提供，供外部系统对账用',
  `check_date` datetime DEFAULT NULL COMMENT '通道结算日期',
  `asile_no` bigint(11) DEFAULT NULL ,
  `version` int(11) DEFAULT NULL,
  `is_delete` char(1) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `business_type` char(2) DEFAULT NULL,
  `recharge_sn` bigint(20) DEFAULT NULL,
  `idevice_type` char(2) DEFAULT NULL,
  `batch_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_trans_reconcilseq
-- ----------------------------
DROP TABLE IF EXISTS `tb_trans_reconcilseq`;
CREATE TABLE `tb_trans_reconcilseq` (
  `id` bigint(20) NOT NULL,
  `trans_seq` bigint(20) DEFAULT NULL COMMENT '交易流',
  `create_time` datetime DEFAULT NULL COMMENT '对账时间',
  `version` int(11) DEFAULT NULL,
  `is_delete` char(1) DEFAULT NULL  ,
  `account_id` bigint(20) DEFAULT NULL ,
  `asile_no` bigint(20) DEFAULT NULL  ,
  `error_type` char(2) DEFAULT NULL COMMENT '差错类型,对账出差错的具体原因1银行少帐2银行多帐3.平台少帐4平台多帐5.金额不平',
  `order_id` varchar(64) DEFAULT NULL COMMENT '业务订单号',
  `trans_type` char(2) DEFAULT NULL COMMENT ' 交易类型，1取现，2支付，3提现',
  `business_type` char(2) DEFAULT NULL COMMENT '业务线类型',
  `bank_send_sn` varchar(64) DEFAULT NULL COMMENT ' 银行端的流水',
  `trade_amount` decimal(15,2) DEFAULT NULL COMMENT '交易金额',
  `manual_flag` char(1) DEFAULT NULL COMMENT '是否人工处理标志',
  `bank_trade_state` char(2) DEFAULT NULL COMMENT ' 银行交易状态,0支付成功1支付失败2超时',
  `platform_trade_state` char(2) DEFAULT NULL COMMENT '平台交易状态,0支付成功1支付失败2超时',
  `adjust_state` char(2) DEFAULT NULL COMMENT '调账状态0-未调账，1－已调账',
  `remark` varchar(128) DEFAULT NULL,
  `asile_account` varchar(64) DEFAULT NULL,
  `deal_id` varchar(64) DEFAULT NULL,
  `bank_amount` decimal(15,2) DEFAULT NULL,
  `asile_name` varchar(20) DEFAULT NULL,
  `pay_bank_type` varchar(16) DEFAULT NULL,
  `pay_bank_name` varchar(16) DEFAULT NULL,
  `pay_bank_cardno` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_trans_refundbill
-- ----------------------------
DROP TABLE IF EXISTS `tb_trans_refundbill`;
CREATE TABLE `tb_trans_refundbill` (
  `id` bigint(20) NOT NULL,
  `refund_sn` bigint(20) DEFAULT NULL COMMENT '外部系统生成,root表中查找',
  `pay_sn` bigint(20) DEFAULT NULL COMMENT '原支付流水',
  `tran_type` char(2) DEFAULT NULL COMMENT ' 交易类型',
  `refund_type` char(2) DEFAULT NULL COMMENT ' 退款类型 1直接退款2担保支付退款',
  `account_id` bigint(20) DEFAULT NULL,
  `order_id` varchar(64) DEFAULT NULL,
  `order_note` varchar(255) DEFAULT NULL COMMENT '订单说明',
  `payee_account_id` bigint(20) DEFAULT NULL COMMENT '原收款方客户号',
  `payer_account_id` bigint(20) DEFAULT NULL COMMENT '原付款方客户号直接退款可为空',
  `payer_bank_type` varchar(16) DEFAULT NULL COMMENT '付款方开户行行别',
  `payer_bank_code` varchar(16) DEFAULT NULL COMMENT ' 行号支付系统行号',
  `payer_bank_name` varchar(16) DEFAULT NULL COMMENT '款方开户行行名',
  `payer_bank_addrno` char(8) DEFAULT NULL COMMENT '付款方开户行地区代码',
  `payer_bank_cardno` varchar(32) DEFAULT NULL COMMENT '付款方帐号',
  `payer_bank_card_name` varchar(32) DEFAULT NULL COMMENT '付款方帐号户名',
  `state` char(2) DEFAULT NULL COMMENT '00-退款申请01-退款拒绝02-退款处理中03-退款成功04-退款失败',
  `payer_remark` varchar(128) DEFAULT NULL COMMENT '原付款方退款理由',
  `payee_remark` varchar(128) DEFAULT NULL COMMENT '收款方退款说明',
  `create_time` datetime DEFAULT NULL,
  `work_date` datetime DEFAULT NULL COMMENT ' 会计结算日期',
  `fee` decimal(15,2) DEFAULT NULL,
  `fee_cust_id` varchar(16) DEFAULT NULL COMMENT '付手续费方',
  `fee_state` char(2) DEFAULT NULL COMMENT '手续费状态00事前未统计/01事前已统计10事后未计算/11事后已计算',
  `cash_amount` decimal(15,2) DEFAULT NULL COMMENT ' 退款金额',
  `payer_ailse_no` bigint(20) DEFAULT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `is_delete` char(2) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `error_remark` varchar(64) DEFAULT NULL,
  `trade_amount` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_trans_right
-- ----------------------------
DROP TABLE IF EXISTS `tb_trans_right`;
CREATE TABLE `tb_trans_right` (
  `id` bigint(20) NOT NULL,
  `limit_name` varchar(32) DEFAULT NULL,
  `parent_limit_id` int(11) DEFAULT NULL,
  `if_audit` char(1) DEFAULT NULL COMMENT '是否需要审核',
  `menu_level` varchar(32) DEFAULT NULL COMMENT ' 菜单级别,为空是按钮权限',
  `url_domain` varchar(255) DEFAULT NULL COMMENT '应用URL的应用前缀',
  `url` varchar(255) DEFAULT NULL COMMENT '叶子节点的URL',
  `version` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `is_delete` char(1) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_trans_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_trans_role`;
CREATE TABLE `tb_trans_role` (
  `id` bigint(20) NOT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `parrent_id` bigint(20) DEFAULT NULL,
  `is_delete` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_trans_shop_notify
-- ----------------------------
DROP TABLE IF EXISTS `tb_trans_shop_notify`;
CREATE TABLE `tb_trans_shop_notify` (
  `id` bigint(20) NOT NULL,
  `account_id` bigint(20) DEFAULT NULL COMMENT '发起结算的用户id',
  `create_time` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `is_delete` char(1) DEFAULT NULL COMMENT '1为罗计删除，0为正常',
  `msg_type` char(2) DEFAULT NULL COMMENT '消息类型',
  `order_id` varchar(64) DEFAULT NULL COMMENT '货主确认的交易订单',
  `remark` varchar(255) DEFAULT NULL,
  `palt_name` varchar(32) DEFAULT NULL COMMENT '传递消息的平台名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_trans_withdraw_ask
-- ----------------------------
DROP TABLE IF EXISTS `tb_trans_withdraw_ask`;
CREATE TABLE `tb_trans_withdraw_ask` (
  `id` bigint(20) NOT NULL,
  `account_id` bigint(20) DEFAULT NULL COMMENT '提现申请人',
  `create_time` datetime DEFAULT NULL  ,
  `version` int(11) DEFAULT NULL,
  `is_delete` char(1) DEFAULT NULL COMMENT '1为逻辑删除，0为正常状态',
  `account` decimal(15,2) DEFAULT NULL COMMENT '提现金额',
  `check_user` bigint(20) DEFAULT NULL COMMENT '审核人',
  `check_time` datetime DEFAULT NULL COMMENT '审核时间',
  `check_name` varchar(32) DEFAULT NULL COMMENT '审核人',
  `check_remark` varchar(255) DEFAULT NULL COMMENT ' 审核意见',
  `remark` varchar(255) DEFAULT NULL,
  `bank_id` varchar(32) DEFAULT NULL COMMENT '提现资金打入银行卡，必须是经过验证的银行卡',
  `bank_name` varchar(255) DEFAULT NULL COMMENT ' 申请提现的银行名称',
  `bank_mobile` varchar(255) DEFAULT NULL COMMENT '银行绑定手机号',
  `bank_create` varchar(255) DEFAULT NULL COMMENT '银行卡开户行',
  `ask_status` char(2) DEFAULT NULL COMMENT '申请状态，成功失败',
  `ask_result` char(2) DEFAULT NULL,
  `withdraw_type` char(2) DEFAULT NULL,
  `withdraw_seq_sn` bigint(20) DEFAULT NULL,
  `account_name` varchar(32) DEFAULT NULL,
  `amount_type` char(2) DEFAULT NULL,
  `bank_amount` varchar(32) DEFAULT NULL,
  `withdraw_sn` bigint(20) DEFAULT NULL,
  `bank_result` varchar(32) DEFAULT NULL,
  `bank_remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_trans_withdraw_export_job
-- ----------------------------
DROP TABLE IF EXISTS `tb_trans_withdraw_export_job`;
CREATE TABLE `tb_trans_withdraw_export_job` (
  `id` bigint(20) NOT NULL,
  `job_id` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `is_delete` char(1) DEFAULT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `file_path` varchar(4096) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_trans_withdraw_seq
-- ----------------------------
DROP TABLE IF EXISTS `tb_trans_withdraw_seq`;
CREATE TABLE `tb_trans_withdraw_seq` (
  `account_id` bigint(20) DEFAULT NULL  ,
  `id` bigint(20) NOT NULL,
  `account_type` char(2) DEFAULT NULL COMMENT '账户类型',
  `bank_id` bigint(20) DEFAULT NULL COMMENT '用户银行卡编号',
  `bank_name` varchar(32) DEFAULT NULL,
  `bank_type` varchar(2) DEFAULT NULL COMMENT ' 银行卡类型',
  `bank_code` varchar(32) DEFAULT NULL COMMENT '支付系统行号',
  `create_bank` varchar(32) DEFAULT NULL,
  `bank_addr_no` varchar(4) DEFAULT NULL COMMENT '付款方开户行地区代码',
  `bank_card_name` varchar(32) DEFAULT NULL COMMENT '户名',
  `amount` decimal(15,2) DEFAULT NULL COMMENT '金额',
  `withdraw_type` char(2) DEFAULT NULL COMMENT '提现类型,1-实时提现 2-非实时提现',
  `create_time` datetime DEFAULT NULL ,
  `work_date` datetime DEFAULT NULL COMMENT '会计日期',
  `state` char(2) DEFAULT NULL COMMENT '00 提现申请登记（基金监管时用）01登记成功 02登记失败（基金监管时用）03支付中（已生成提现流水）04 提现成功05提现失败',
  `asile_no` bigint(11) DEFAULT NULL  ,
  `fee` decimal(21,0) DEFAULT NULL ,
  `fee_cust_id` varchar(64) DEFAULT NULL COMMENT '付手续费方',
  `fee_state` char(2) DEFAULT NULL COMMENT '手续费状态,00事前未统计,01事前已统计',
  `bank_result_code` varchar(32) DEFAULT NULL COMMENT '银行返回码',
  `bank_result_note` varchar(128) DEFAULT NULL COMMENT ' 银行备注',
  `settle_date` datetime DEFAULT NULL COMMENT '结算日期',
  `check_date` datetime DEFAULT NULL COMMENT '审核日期',
  `version` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `is_delete` char(1) DEFAULT NULL ,
  `account_name` varchar(32) DEFAULT NULL,
  `withdraw_sn` bigint(20) DEFAULT NULL ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

