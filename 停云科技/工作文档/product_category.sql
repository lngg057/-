/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : goods

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-01-15 15:41:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category` (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL COMMENT '父目录id',
  `productTypeId` int(11) DEFAULT NULL,
  `categoryType` smallint(6) NOT NULL DEFAULT '1' COMMENT '无用，暂时保留',
  `categoryCode` varchar(32) NOT NULL COMMENT '目录编码，ak，主要用于url生成。',
  `categoryName` varchar(128) NOT NULL COMMENT '目录名称',
  `categoryDescription` text COMMENT '目录描述',
  `keywords` varchar(256) DEFAULT NULL COMMENT '关键词、meta关键词',
  `metaDescription` varchar(256) DEFAULT NULL COMMENT 'meta描述',
  `templatePath` varchar(128) DEFAULT NULL COMMENT '模板路径',
  `depth` smallint(6) DEFAULT NULL COMMENT '深度',
  `hasChildren` smallint(6) DEFAULT NULL COMMENT '是否有子目录\r\n            1=有\r\n            0=无',
  `parentPath` varchar(128) NOT NULL COMMENT '祖先目录路径，例如1.5 表示nokia目录的祖先目录结构路径是： 商品根目录->手机目录',
  `categoryPath` varchar(128) NOT NULL COMMENT '自身目录路径，例如1.5.8. 表示诺基亚目录的结构路径是： 商品根目录->手机目录->诺基亚目录。最后的8是诺基亚目录的主键。',
  `imageUrl` varchar(255) DEFAULT NULL COMMENT '图片url',
  `sortOrder` int(11) NOT NULL COMMENT '排序值，一般值越小，越靠前',
  `status` smallint(6) NOT NULL COMMENT '0=前台不可见\r\n            1=前台可见',
  `displayFlag` varchar(32) DEFAULT NULL COMMENT '自定义的显示标志\r\n            0=标签页\r\n            1= new\r\n            2= hot\r\n            可出现多个，用半角逗号分隔,最末一个也要半角逗号，如 0,2,   1,2,',
  `pinyinIndex` varchar(8) DEFAULT NULL COMMENT '拼音索引，例如a,b..m..',
  `itemCount` int(11) DEFAULT '0' COMMENT '目录下的商品的数量',
  `activeItemCount` int(11) DEFAULT '0' COMMENT '前台可见商品个数,即上架商品个数',
  `createBy` int(11) DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `metaTitle` varchar(500) DEFAULT NULL,
  `robots` smallint(6) DEFAULT '0',
  `commissionRate` decimal(5,4) DEFAULT '0.0000' COMMENT '一级目录代理佣金比率',
  PRIMARY KEY (`categoryId`),
  UNIQUE KEY `AK_CATEGORYTYPE_CATEGORYCODE` (`categoryType`,`categoryCode`),
  KEY `FK_PRODUCT_CATEGORY_2_PRODUCT_CATEGORY` (`parentId`),
  KEY `FK_PRODUCT_CATEGORY_2_PRODUCT_TYPE` (`productTypeId`),
  CONSTRAINT `FK_PRODUCT_CATEGORY_2_PRODUCT_CATEGORY` FOREIGN KEY (`parentId`) REFERENCES `product_category` (`categoryId`),
  CONSTRAINT `FK_PRODUCT_CATEGORY_2_PRODUCT_TYPE` FOREIGN KEY (`productTypeId`) REFERENCES `product_type` (`productTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=1186 DEFAULT CHARSET=utf8;
