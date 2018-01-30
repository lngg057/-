DROP TABLE IF EXISTS `affiliation_user`;
CREATE TABLE `affiliation_user` (
  `affiliationUserId` int(11) NOT NULL AUTO_INCREMENT COMMENT '推广人Id',
  `appuserId` int(11) NOT NULL COMMENT 'app_user 对应的ID',
  `affiliationUserStatus` smallint(6) DEFAULT '0' COMMENT '推广人状态 0-激活 1-未激活',
  `createTime` datetime NOT NULL COMMENT '注册时间',
  `promotionName` varchar(64) DEFAULT NULL COMMENT '推广人名称',
  `totalClickNum` int(11) NOT NULL DEFAULT '0' COMMENT '推广点击数',
  `totalOrderNum` int(11) NOT NULL DEFAULT '0' COMMENT '总推广订单数',
  `totalGainedAmt` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '总获得收益数',
  `totalDrawAmt` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '总提款数',
  `affiliationUserSource` smallint(6) DEFAULT NULL COMMENT '推广用户来源',
  PRIMARY KEY (`affiliationUserId`),
  KEY `FK_AFFILIATION_USER_2_APP_USER` (`appuserId`),
  CONSTRAINT `FK_AFFILIATION_USER_2_APP_USER` FOREIGN KEY (`appuserId`) REFERENCES `app_user` (`appuserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `affiliation_goods`;
CREATE TABLE `affiliation_goods` (
  `affiliationGoodsId` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `startTime` datetime NOT NULL COMMENT '返利开启日期',
  `endTime` datetime NOT NULL COMMENT '返利截止日期',
  `rebateStatus` smallint(6) DEFAULT '0' COMMENT '返利状态 0-否  1-开启 ',
  `createRebateName` varchar(64) DEFAULT NULL,
  `isHot` smallint(6) DEFAULT '0' COMMENT '是否热推商品 0-否 1-是',
  PRIMARY KEY (`affiliationGoodsId`),
  KEY `FK_AFFILIATION_GOODS_2_PRODUCT` (`productId`,`categoryId`),
  KEY `FK_AFFILIATION_GOODS_2_PRODUCT_CATEGORY` (`categoryId`),
  CONSTRAINT `FK_AFFILIATION_GOODS_2_PRODUCT_CATEGORY` FOREIGN KEY (`categoryId`) REFERENCES `product_category` (`categoryId`),
  CONSTRAINT `FK_AFFILIATION_GOODS_2_PRODUCT` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `affiliation_order`;
CREATE TABLE `affiliation_order` (
  `affiliatinOrderId` int(11) NOT NULL AUTO_INCREMENT COMMENT '推广订单Id',
  `salesOrderId` int(11) NOT NULL COMMENT '订单Id',
  `affiliationUserId` int(11) NOT NULL COMMENT '推广用户Id',
  `creatTime` datetime NOT NULL COMMENT '创建订单时间',
  `completeTime` datetime DEFAULT NULL COMMENT '完成订单时间',
  `orderStatus` smallint(6) NOT NULL COMMENT '订单状态',
  `orderAmt` decimal(12,2) NOT NULL COMMENT '订单金额',
  `orderGainedAmt` decimal(12,2) NOT NULL COMMENT '订单产生收益',
  PRIMARY KEY (`affiliatinOrderId`),
  KEY `FK_AFFILIATION_ORDER_2_SALES_ORDER` (`salesOrderId`),
  KEY `FK_AFFILIATION_ORDER_2_AFFILIATION_USER` (`affiliationUserId`),
  CONSTRAINT `FK_AFFILIATION_ORDER_2_AFFILIATION_USER` FOREIGN KEY (`affiliationUserId`) REFERENCES `affiliation_user` (`affiliationUserId`),
  CONSTRAINT `FK_AFFILIATION_ORDER_2_SALES_ORDER` FOREIGN KEY (`salesOrderId`) REFERENCES `sales_order` (`salesOrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `affiliation_rebate_way`;
CREATE TABLE `affiliation_rebate_way` (
  `affiliationRebateId` int(11) NOT NULL AUTO_INCREMENT COMMENT '推广返利方式Id',
  `affiliationRebateName` varchar(64) DEFAULT NULL COMMENT '返利方式名称',
  `rebateEndAmt` decimal(12,2) NOT NULL COMMENT '返利最大金额',
  `rebateStartAmt` decimal(12,2) NOT NULL COMMENT '返利最小金额',
  `rebateStatus` smallint(6) NOT NULL COMMENT '返利状态',
  `updateBy` int(12) NOT NULL COMMENT '操作人',
  PRIMARY KEY (`affiliationRebateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `affiliation_day_statistics`;
CREATE TABLE `affiliation_day_statistics` (
  `affiliationDayId` int(11) NOT NULL AUTO_INCREMENT,
  `affiliationUserId` int(11) NOT NULL COMMENT '推广人Id',
  `affiliationTime` datetime NOT NULL COMMENT '推广日期',
  `dayClickNum` int(11) NOT NULL DEFAULT '0',
  `creatOrderAmt` decimal(12,2) NOT NULL,
  `completeOrderAmt` decimal(12,2) NOT NULL,
  PRIMARY KEY (`affiliationDayId`),
  KEY `FK_AFFILIATION_DAY_2_AFFILIATION_USER` (`affiliationUserId`),
  CONSTRAINT `FK_AFFILIATION_DAY_2_AFFILIATION_USER` FOREIGN KEY (`affiliationUserId`) REFERENCES `affiliation_user` (`affiliationUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `affiliation_year__statistics`;
CREATE TABLE `affiliation_year__statistics` (
  `affiliationYearId` int(11) NOT NULL AUTO_INCREMENT,
  `affiliationUserId` int(11) NOT NULL COMMENT '推广人ID',
  `completeOrderAmt` decimal(12,2) NOT NULL COMMENT '月推广完成订单金额',
  `creatOrderAmt` decimal(12,2) DEFAULT NULL COMMENT '月推广生成订单总金额',
  `mouthClickNum` int(11) NOT NULL COMMENT '月推广点击数',
  `affiliationMouth` smallint(6) NOT NULL COMMENT '推广月数',
  PRIMARY KEY (`affiliationYearId`),
  KEY `FK_AFFILIATION_YEAR_2_AFFILIATION_USER` (`affiliationUserId`),
  CONSTRAINT `FK_AFFILIATION_YEAR_2_AFFILIATION_USER` FOREIGN KEY (`affiliationUserId`) REFERENCES `affiliation_user` (`affiliationUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table 'app_user' add isAffiliation smallint(6) NOT NULL default '0' COMMENT '是否是代理用户 0-否  1-是';
alter table 'sales_order' add affiliationUserId int(11) DEFAULT NULL COMMENT '代理用户ID';
alter table 'product_category' add rate decimal(6,2) DEFAULT '0.00' COMMENT '佣金比例';