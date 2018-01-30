/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.118
Source Server Version : 50022
Source Host           : 192.168.2.118:3306
Source Database       : goods

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2016-07-13 10:21:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for app_version
-- ----------------------------
DROP TABLE IF EXISTS `app_version`;
CREATE TABLE `app_version` (
  `id` smallint(11) NOT NULL auto_increment COMMENT '自增主键',
  `internalVerNo` int(11) unsigned zerofill NOT NULL COMMENT '内部版本号 12  \r\n每进行一次版本更新，该字段就进行加1操作，用来标志与客户端对应的更新',
  `externalVerNo` varchar(32) NOT NULL COMMENT '外部版本号 1.1.1.160707 \r\n\r\n主版本号:功能模块有较大改动，比如增加多个模块或者整体架构变化时提升该版本号\r\n子版本号:功能有一定的增加或变化，比如增加权限控制，增加自定义视图等功能时提升该版本号\r\n阶段版本号 :一般是bug修复或者是小改动，要经常发布修订版，时间间隔不限，修复一个严重的bug即可发布一个新的版本号\r\n日期版本号 :用于记录修改项目的当前日期，每次版本号的更新需要同步更新日期版本号',
  `versionDescribe` varchar(32) default NULL COMMENT '版本简介 \r\n更新介绍界面第一行的文字描述',
  `versionDetail` varchar(255) default NULL COMMENT '版本详情  \r\n更新介绍界面的详情文字描述',
  `appType` smallint(11) NOT NULL COMMENT 'app类型 \r\n1 安卓客户端；2 ios客户端；3 Windows Phone客户端； 4 PC客户端',
  `downloadURL` varchar(255) default NULL COMMENT 'app下载地址',
  `isPublic` smallint(11) default '1' COMMENT '版本是否对外公布  \r\n1 对外发布；0 不对外发布 \r\n标志当前客户端的版本是否仍在使用，如果不再使用了，该字段标志为不对外发布',
  `isEnforceUpdate` smallint(11) default '0' COMMENT '版本是否要强制升级 \r\n1 强制升级；0 不强制升级',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of app_version
-- ----------------------------
INSERT INTO `app_version` VALUES ('1', '00000000004', '1.2.2', 'Android客户端V1.2.2发布', '1.版本检测提示；\r\n2.更新地址信息；\r\n3.下单、编辑和添加地址流程等优化。', '1', 'https://play.google.com/store/apps/details?id=ph.goods', '1', '0');
INSERT INTO `app_version` VALUES ('2', '00000000004', '1.0', '', '', '2', null, '0', '0');
