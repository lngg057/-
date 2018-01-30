/*
Navicat MySQL Data Transfer

Source Server         : 停云环境
Source Server Version : 50627
Source Host           : 47.90.77.202:3306
Source Database       : tingyun0225

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2017-03-02 19:21:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for promo_rule
-- ----------------------------
DROP TABLE IF EXISTS `promo_rule`;
CREATE TABLE `promo_rule` (
  `promoRuleId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '优惠名称',
  `promoCode` varchar(64) DEFAULT NULL COMMENT '优惠码',
  `promoWay` smallint(6) NOT NULL COMMENT '促销方式:0:满立减 1:促销打折',
  `promoAmount` int(11) NOT NULL,
  `shortDescription` text COMMENT '短描述',
  `description` text COMMENT '长描述',
  `expireTime` int(6) DEFAULT NULL,
  `startTime` datetime NOT NULL COMMENT '优惠开始时间',
  `endTime` datetime DEFAULT NULL COMMENT '优惠结束时间',
  `promoType` tinyint(6) NOT NULL COMMENT '优惠类型 1.优惠卷优惠  2.优惠码优惠 99.注册类GC',
  `status` smallint(6) NOT NULL COMMENT '状态 1.启用  0.禁用',
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  `createBy` int(11) DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `sortOrder` int(11) DEFAULT NULL COMMENT '排序值',
  `remainUseCount` int(11) DEFAULT NULL COMMENT 'GC剩余使用次数',
  `maxUseCount` int(11) DEFAULT NULL COMMENT 'GC最大使用次数',
  `mobileImage` varchar(255) DEFAULT NULL COMMENT '优惠规则在H5显示的图片路径',
  `frontImage` varchar(255) DEFAULT NULL COMMENT '优惠规则在front显示的图片路径',
  `ruleLink` varchar(255) DEFAULT NULL COMMENT '图片链接url',
  `display` smallint(6) DEFAULT '0' COMMENT '是否显示在首页 0：不显示  1:显示',
  PRIMARY KEY (`promoRuleId`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of promo_rule
-- ----------------------------
INSERT INTO `promo_rule` VALUES ('1', 'Register', null, '0', '250', 'Registration earn 300 GC', '', '7', '2016-06-01 00:00:00', null, '99', '1', '2016-06-13 08:58:06', '2016-06-17 15:39:25', '1', '1', '1', null, null, null, null, null, null, '0');
INSERT INTO `promo_rule` VALUES ('2', 'Referral friends', null, '0', '100', 'Referral a friend earn 100 GC', '', '7', '2016-06-01 00:00:00', null, '98', '1', '2016-06-13 09:06:39', '2016-07-12 11:46:45', '1', '17885', '1', null, null, null, null, null, null, '0');
INSERT INTO `promo_rule` VALUES ('3', 'Shopback Promos', 'SHOPBACK300', '0', '300', 'Shopback 300', '', null, '2016-06-18 00:00:00', '2016-06-30 23:59:59', '2', '-1', '2016-06-13 09:12:38', '2016-06-17 16:56:47', '1', '1', '1', null, null, null, null, null, null, '0');
INSERT INTO `promo_rule` VALUES ('4', 'BAG WEEKEND PROMOTION', 'BAG100', '0', '100', 'women bags promotion, sales, discount', '', null, '2016-06-25 00:00:00', '2016-06-26 23:59:59', '2', '-1', '2016-06-24 12:57:34', '2016-06-24 12:57:34', '1', '1', '1', null, null, null, null, null, null, '0');
INSERT INTO `promo_rule` VALUES ('5', 'shippingFree', 'SHIPPINGFREE', '0', '0', 'shippingFree', '', null, '2016-06-20 00:00:00', '2016-06-29 23:59:59', '97', '1', '2016-06-22 15:40:42', '2016-06-22 15:40:42', '1', '1', '1', null, null, null, null, null, null, '0');
INSERT INTO `promo_rule` VALUES ('6', 'kevin test', 'kevin666', '0', '10', 'test code', '', null, '2016-07-01 00:00:00', '2016-07-01 23:59:59', '2', '-1', '2016-07-01 18:48:54', '2016-07-01 18:48:54', '1', '1', '1', null, null, null, null, null, null, '0');
INSERT INTO `promo_rule` VALUES ('7', 'Fashion Weekend Sale', 'FASHION100', '0', '100', 'Fashion Weekend Sale, Promo, Discount', '', null, '2016-07-01 00:00:00', '2016-07-03 23:59:59', '2', '-1', '2016-07-01 18:54:40', '2016-07-01 20:36:21', '17885', '1', '17885', null, null, null, null, null, null, '0');
INSERT INTO `promo_rule` VALUES ('8', '50 OFF (min of P500)', 'L50', '0', '50', 'Discount', '', null, '2016-07-08 00:00:00', '2016-07-10 23:59:59', '2', '-1', '2016-07-07 14:21:01', '2016-07-07 18:35:54', '17885', '17885', '17885', null, null, null, null, null, null, '0');
INSERT INTO `promo_rule` VALUES ('9', '100 OFF (min spend of P1000)', 'L100', '0', '100', 'Discount', '', null, '2016-07-08 00:00:00', '2016-07-10 23:59:59', '2', '-1', '2016-07-07 18:37:52', '2016-07-07 18:37:52', '17885', '17885', '17885', null, null, null, null, null, null, '0');
INSERT INTO `promo_rule` VALUES ('10', '150 OFF (min spend of P1500)', 'L150', '0', '150', 'Discount', '', null, '2016-07-08 00:00:00', '2016-07-10 23:59:59', '2', '-1', '2016-07-07 18:38:46', '2016-07-07 18:38:46', '17885', '17885', '17885', null, null, null, null, null, null, '0');
INSERT INTO `promo_rule` VALUES ('11', 'PAYDAY SALE', 'PYDY10', '1', '10', 'Payday Sale', '', null, '2016-07-15 00:00:00', '2016-07-17 23:59:59', '2', '-1', '2016-07-14 11:54:06', '2016-07-14 20:29:12', '17885', '17885', '17885', null, null, null, null, null, null, '0');
INSERT INTO `promo_rule` VALUES ('12', 'SAVE299', 'SBP1VRB0X', '0', '299', 'At least 300 cash off 299', '', null, '2016-07-19 00:00:00', '2016-07-19 23:59:59', '96', '1', '2016-07-18 19:38:13', '2016-07-19 19:40:19', '17885', '1', '103', null, '0', '100', null, null, null, '0');
INSERT INTO `promo_rule` VALUES ('13', 'CLEAROUT SALE', 'CLT2016', '1', '15', 'Clearout Sale, Discount', '', '7', '2016-08-08 00:00:00', '2016-09-18 23:59:59', '95', '1', '2016-08-08 11:19:10', '2016-09-30 19:25:59', '17885', '34862', '17885', null, null, null, 'others/160819/-8996817772889490344.jpg', 'others/160819/-8101731365928749981.jpg', 'https://www.goods.ph/clear-out.html', '0');
INSERT INTO `promo_rule` VALUES ('14', 'VIP 4k to 6999', 'SAVEATGOODSPH', '1', '20', '20% OFF, Discount', '', null, '2016-08-08 00:00:00', '2016-11-16 23:59:59', '2', '0', '2016-08-08 16:30:15', '2016-11-17 12:44:54', '17885', '17885', '17885', null, null, null, '', '', null, '0');
INSERT INTO `promo_rule` VALUES ('15', 'VIP 7k and above', 'GOODSVIP', '1', '30', '30% OFF, Discount', '', null, '2016-08-08 00:00:00', '2016-11-16 23:59:59', '2', '0', '2016-08-08 16:31:12', '2016-11-17 12:44:40', '17885', '17885', '17885', null, null, null, '', '', null, '0');
INSERT INTO `promo_rule` VALUES ('16', 'Free Promos', null, '2', '0', 'Free Gc', '', null, '2016-08-08 00:00:00', null, '94', '1', '2016-08-10 21:00:00', '2016-09-08 15:18:17', '17885', '34862', '1', null, null, null, '', '', null, '0');
INSERT INTO `promo_rule` VALUES ('17', 'Aileen Supplier', 'AILEEN10OFF', '1', '10', 'Discount, Supplier', '', null, '2016-09-21 00:00:00', '2016-09-26 23:59:59', '2', '-1', '2016-09-20 20:45:59', '2016-09-20 20:45:59', '17885', '17885', '17885', null, null, null, '', '', null, null);
INSERT INTO `promo_rule` VALUES ('18', 'Lekani Supplier', 'LEKANI20OFF', '1', '20', 'Discount, Supplier', '', null, '2016-09-21 00:00:00', '2016-11-16 23:59:59', '2', '1', '2016-09-20 20:48:31', '2016-11-17 12:44:34', '17885', '17885', '17885', null, null, null, '', '', null, null);
INSERT INTO `promo_rule` VALUES ('19', 'Wawawei Supplier', 'WAWAWEI10OFF', '1', '10', 'Discount, Supplier, Sale', '', null, '2016-09-21 00:00:00', '2016-10-09 23:59:59', '2', '1', '2016-09-20 20:49:51', '2016-10-10 16:50:10', '17885', '17885', '17885', null, null, null, '', '', null, null);
INSERT INTO `promo_rule` VALUES ('20', 'Caite Supplier', 'CAITE15OFF', '1', '15', 'DISCOUNT, SALE', '', null, '2016-09-21 00:00:00', '2016-10-09 23:59:59', '2', '1', '2016-09-20 20:55:21', '2016-10-10 16:49:28', '17885', '17885', '17885', null, null, null, '', '', null, null);
INSERT INTO `promo_rule` VALUES ('21', 'Smile Smile Supplier', 'SMILE10OFF', '1', '10', 'SALE, DISCOUNT', '', null, '2016-09-21 00:00:00', '2016-10-09 23:59:59', '2', '1', '2016-09-20 20:58:19', '2016-10-10 16:49:18', '17885', '17885', '17885', null, null, null, '', '', null, null);
INSERT INTO `promo_rule` VALUES ('22', 'Aileen Supplier', 'AILEEN10OFF', '1', '10', 'Sale, Discount', '', null, '2016-09-21 00:00:00', '2016-10-09 23:59:59', '2', '1', '2016-09-20 21:00:05', '2016-10-10 16:49:03', '17885', '17885', '17885', null, null, null, '', '', null, null);
INSERT INTO `promo_rule` VALUES ('23', 'Ehao-Dist', '20POWERBANK', '1', '25', 'ehao distribution', '', null, '2016-09-22 00:00:00', '2017-05-19 23:59:59', '2', '1', '2016-09-22 09:41:36', '2017-01-16 09:45:13', '34862', '34907', '34862', null, null, null, '', '', null, null);
INSERT INTO `promo_rule` VALUES ('24', 'Amazing freebies for you!', 'FREEBIES', '0', '0', 'Amazing freebies for you!', '', null, '2016-09-27 00:00:00', '2016-10-14 23:59:59', '2', '1', '2016-09-27 17:15:11', '2016-09-30 19:18:54', '1', '1', '1', null, null, null, 'others/160927/-4785265681813116805.jpg', 'others/160928/-8870275682956202447.jpg', null, '0');
INSERT INTO `promo_rule` VALUES ('25', 'Payday 50 OFF', '50PYDY', '0', '50', 'Discount, Sale', '', null, '2016-09-30 00:00:00', '2016-10-02 23:59:59', '2', '1', '2016-09-29 16:22:19', '2016-09-29 16:31:14', '17885', '17885', '17885', null, null, null, '', '', null, null);
INSERT INTO `promo_rule` VALUES ('26', 'Payday 80 OFF', '80PYDY', '0', '80', 'Sale, Discount', '', null, '2016-09-30 00:00:00', '2016-10-02 23:59:59', '2', '-1', '2016-09-29 16:28:50', '2016-09-29 21:50:04', '17885', '17885', '17885', null, null, null, '', '', null, null);
INSERT INTO `promo_rule` VALUES ('27', 'Payday 100 OFF', '100PYDY', '0', '100', 'Sales, Discounts', '', null, '2016-09-30 00:00:00', '2016-10-02 23:59:59', '2', '1', '2016-09-29 16:37:52', '2016-09-29 16:37:52', '17885', '17885', '17885', null, null, null, '', '', null, null);
INSERT INTO `promo_rule` VALUES ('28', 'Payday 150 OFF', '150PYDY', '0', '150', 'Sales, Discounts', '', null, '2016-09-30 00:00:00', '2016-10-02 23:59:59', '2', '1', '2016-09-29 16:49:51', '2016-09-29 16:49:51', '17885', '17885', '17885', null, null, null, '', '', null, null);
INSERT INTO `promo_rule` VALUES ('29', 'VIP2k', 'VIP15OFF', '1', '15', 'Sale, Discount', 'Sale, Discount', null, '2016-10-01 00:00:00', '2016-11-16 23:59:59', '2', '1', '2016-09-30 15:24:54', '2016-11-17 12:44:00', '17885', '17885', '17885', null, null, null, '', '', null, null);
INSERT INTO `promo_rule` VALUES ('30', 'VIP (No Min Purchase)', '15OFFVIP', '1', '15', 'SALES, DISCOUNT', '', null, '2016-10-06 00:00:00', '2016-11-16 23:59:59', '2', '1', '2016-10-06 18:45:17', '2016-11-17 12:43:44', '17885', '17885', '17885', null, null, null, '', '', null, null);
INSERT INTO `promo_rule` VALUES ('31', 'VIP (Min of P4000)', 'VIP20OFF', '1', '20', 'SALES, DISCOUNT', '', null, '2016-10-06 00:00:00', '2016-11-16 23:59:59', '2', '1', '2016-10-06 18:46:58', '2016-11-17 12:43:16', '17885', '17885', '17885', null, null, null, '', '', null, null);
INSERT INTO `promo_rule` VALUES ('32', 'VIP (Min of P7000)', 'VIP30OFF', '1', '30', 'SALES, DISCOUNT', '', null, '2016-10-06 00:00:00', '2016-11-16 23:59:59', '2', '1', '2016-10-06 18:49:23', '2016-11-17 12:42:08', '17885', '17885', '17885', null, null, null, '', '', null, null);
INSERT INTO `promo_rule` VALUES ('33', 'VIP 7k and above (Internal CS use only)', 'VIP7K', '1', '20', 'Discount', '', null, '2016-10-11 00:00:00', '2016-11-17 23:59:59', '2', '1', '2016-10-11 12:42:24', '2016-11-17 14:52:33', '17885', '17885', '17885', null, null, null, '', '', null, null);
INSERT INTO `promo_rule` VALUES ('34', 'VIP 4k and above (Internal CS use only)', 'VIP4K', '1', '20', 'Sales, Discount', '', null, '2016-10-14 00:00:00', '2016-10-15 23:59:59', '2', '1', '2016-10-14 14:19:16', '2016-10-14 14:19:16', '17885', '17885', '17885', null, null, null, '', '', null, null);
INSERT INTO `promo_rule` VALUES ('35', 'SHOPBACK 11 /11 ', 'SHOPBACK11', '1', '11', 'Discount', '', null, '2016-11-03 00:00:00', '2016-11-14 23:59:59', '2', '1', '2016-11-03 07:54:57', '2016-11-03 07:54:57', '17885', '17885', '17885', null, null, null, '', '', null, null);
INSERT INTO `promo_rule` VALUES ('36', 'Special Code 15k', 'SPECIALCODE', '1', '30', 'dISCOUNT', '', null, '2016-11-03 00:00:00', '2016-11-04 23:59:59', '2', '1', '2016-11-03 14:01:35', '2016-11-03 14:01:35', '17885', '17885', '17885', null, null, null, '', '', null, null);
INSERT INTO `promo_rule` VALUES ('37', 'IVOUCHERCODE', 'GPH10OFF', '1', '10', 'Discount, Sale', '', null, '2016-11-21 00:00:00', '2016-11-30 23:59:59', '2', '1', '2016-11-21 14:53:21', '2016-12-02 18:04:53', '17885', '17885', '17885', null, null, null, '', '', null, null);
INSERT INTO `promo_rule` VALUES ('38', 'Shopback Black Friday', 'SB15', '1', '15', 'Sale, Discount', '', null, '2016-11-25 00:00:00', '2016-11-30 23:59:59', '2', '1', '2016-11-23 17:46:27', '2016-11-23 17:51:37', '17885', '17885', '17885', null, null, null, '', '', null, null);
INSERT INTO `promo_rule` VALUES ('39', 'Christmas VIP Code', 'XMASVIP', '1', '5', 'Investor vip order', '', null, '2016-12-02 00:00:00', '2016-12-02 23:59:59', '2', '1', '2016-12-02 15:06:23', '2016-12-02 15:07:42', '34862', '34862', '34862', null, null, null, '', '', null, '0');
INSERT INTO `promo_rule` VALUES ('40', 'SHOPBACKCNY', 'SHOPBACKCNY', '1', '10', 'Discount, Promotions', '', null, '2017-01-09 00:00:00', '2017-01-31 23:59:59', '2', '1', '2017-01-09 09:29:40', '2017-01-09 09:29:40', '17885', '17885', '17885', null, null, null, '', '', null, null);
INSERT INTO `promo_rule` VALUES ('41', 'FreeGC200', 'FREEGC200', '0', '200', 'FreeGC200', '<p style=\"box-sizing:border-box;margin-top:0px;margin-bottom:20px;font-family:&quot;Open Sans&quot;, sans-serif;font-size:13px;border-radius:0px !important;\">out-of-stock compensation&nbsp;</p>\n<p class=\"MsoNormal\" style=\"box-sizing:border-box;margin-top:0px;margin-bottom:20px;font-family:&quot;Open Sans&quot;, sans-serif;font-size:13px;border-radius:0px !important;\"><i style=\"box-sizing:border-box;\"><span style=\"box-sizing:border-box;border-radius:0px !important;font-family:Calibri;font-size:10pt;\">order must NOT cost lower than the P200</span></i></p>', '30', '2017-03-02 00:00:00', '2017-12-31 23:59:59', '93', '1', '2017-03-02 14:20:43', '2017-03-02 14:23:20', '1', '1', '1', null, null, null, '', '', null, null);
