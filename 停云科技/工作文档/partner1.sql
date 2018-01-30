/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.118
Source Server Version : 50022
Source Host           : 192.168.2.118:3306
Source Database       : goods

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2016-10-24 18:06:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for partner
-- ----------------------------
DROP TABLE IF EXISTS `partner`;
CREATE TABLE `partner` (
  `partnerId` int(11) NOT NULL auto_increment COMMENT 'Id',
  `partnerName` varchar(100) default NULL COMMENT '名称',
  `companyName` varchar(100) default NULL COMMENT '公司名称',
  `contactNumber` varchar(32) NOT NULL COMMENT '联系电话',
  `email` varchar(64) NOT NULL COMMENT 'email',
  `content` varchar(3100) default NULL COMMENT '留言内容',
  `createTime` datetime default NULL,
  `updateTime` datetime default NULL,
  `StandbyField` varchar(500) default NULL COMMENT '备用字段',
  `createBy` int(10) default NULL,
  `updateBy` int(10) default NULL,
  `quantity` int(11) default NULL COMMENT '数量',
  `bundles` varchar(255) default NULL,
  `productId` int(11) default NULL,
  `address` varchar(3100) default NULL,
  `status` smallint(6) default NULL COMMENT '状态:1启用,0禁用',
  `password` varchar(50) default NULL COMMENT '密码',
  `contact` varchar(50) default NULL COMMENT '联系人',
  `mobileNumber` varchar(20) default NULL COMMENT '手机号码',
  `partnerRegion` smallint(6) default '0' COMMENT '供应商所在地区 0.China 1.Philippines',
  `displayFlag` smallint(6) default '0' COMMENT '是否显示该供应商商品 0.Yes  1.No',
  `partnerCode` varchar(32) default NULL,
  `birNumber` varchar(32) default NULL COMMENT 'BIR 号码',
  `chargerName` varchar(32) default NULL COMMENT '公司负责人名称',
  `zipCode` varchar(32) default NULL COMMENT '公司所在地邮编',
  `storeHouseRegion` int(11) default NULL COMMENT '仓库所在地区',
  `storeHouseAddress` varchar(255) default NULL COMMENT '公司仓库详细地址',
  `landmark` varchar(255) default NULL COMMENT '仓库所在地地标',
  `pickUpDate` smallint(6) default NULL COMMENT '仓库提货时间:0:Mon-Fri 1:Mon-Sat 2:Mon-Sun',
  `pickUpTime` varchar(32) default NULL COMMENT '仓库提货时间',
  `shopName` varchar(32) default NULL COMMENT '店铺名称',
  `businessNature` smallint(6) default NULL COMMENT '业务性质 0:Global Player/ Global Brand 1:SEA/ National Brand 2:International Retail Chain (3+ countries) 3:Global Player representative 4:Official importer/ distributor of brand (principle) 5:Retail chain (10+ stores) 6:Retailer (<10 stores) 7:White label man',
  `businessYears` smallint(6) default NULL COMMENT '经营年限：0:0-1 1:1-5 2:5-10 3:10 and years above',
  `mainCategoryId` int(12) default NULL COMMENT '主要经营品类',
  `isLicenseValid` smallint(6) default NULL COMMENT '是否有合法执照',
  `isOwner` smallint(6) default NULL COMMENT '是否是商品所有这',
  `intendBrands` varchar(64) default NULL COMMENT '希望销售商品',
  `skuNumber` smallint(6) default NULL COMMENT '店铺销售SKU数量 0:30 sku below 1:30-100 2:100-200 3:200-400 4:400-1000 5:1000-10000 6:1000 and above',
  `otherPlatform` smallint(6) default NULL COMMENT '是否在其他平台销售',
  `bankName` varchar(64) default NULL COMMENT '开户银行名称',
  `accountName` varchar(32) default NULL COMMENT '开户人姓名',
  `accountNumber` varchar(32) default NULL COMMENT '银行账户账号',
  `birRegistration` varchar(64) default NULL COMMENT 'BIR 证书',
  `dtiRegistration` varchar(64) default NULL COMMENT 'DTI/SEC 证书',
  `businessPermit` varchar(64) default NULL COMMENT '执业许可',
  `collectionReceipt` varchar(64) default NULL COMMENT '缴款收据',
  PRIMARY KEY  (`partnerId`),
  UNIQUE KEY `AK_COMPANYNAME` (`companyName`),
  UNIQUE KEY `AK_PARTNERNAME` (`partnerName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
