/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50734
Source Host           : localhost:3306
Source Database       : entreprehome

Target Server Type    : MYSQL
Target Server Version : 50734
File Encoding         : 65001

Date: 2023-05-10 18:23:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `account` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(20) NOT NULL,
  `identity` varchar(20) NOT NULL,
  `avatar` varchar(60) DEFAULT 'avatar.png',
  `lock` int(1) DEFAULT '0' COMMENT '标记是否被锁',
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('19515540135', '123123', '投资者', 'avatar.png', '0');

-- ----------------------------
-- Table structure for `company`
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `comp_name` varchar(50) NOT NULL COMMENT '公司名称',
  `comp_typeId` int(6) NOT NULL COMMENT '公司类型所对应id',
  `comp_shangshi` int(1) DEFAULT NULL COMMENT '公司是否上市1代表上市0代表未上市',
  `comp_price` int(16) DEFAULT NULL COMMENT '公司市值',
  `comp_investHigh` int(16) NOT NULL COMMENT '公司预估投资上限 以万为单位',
  `comp_investLow` int(16) NOT NULL COMMENT '公司预估投资下限 以万为单位',
  `comp_intro` varchar(255) DEFAULT NULL COMMENT '公司简介',
  `comp_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id 编号',
  `comp_account` varchar(255) NOT NULL,
  PRIMARY KEY (`comp_id`,`comp_name`),
  KEY `comp_account` (`comp_account`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `emp_name` varchar(50) NOT NULL COMMENT '员工名称',
  `emp_sex` varchar(10) DEFAULT NULL COMMENT '性别',
  `emp_age` int(4) DEFAULT NULL COMMENT '年龄',
  `emp_birthday` date DEFAULT NULL COMMENT '生日',
  `emp_id` varchar(18) NOT NULL COMMENT '身份证号',
  `emp_company` varchar(255) NOT NULL COMMENT '所在公司名称',
  `emp_number` varchar(255) NOT NULL COMMENT '员工编号',
  `emp_phone` varchar(11) NOT NULL COMMENT '手机号',
  `emp_address` varchar(255) DEFAULT NULL COMMENT '家庭住址',
  `emp_position` varchar(255) NOT NULL COMMENT '职务',
  `emp_graduationSch` varchar(255) NOT NULL COMMENT '毕业学校',
  `emp_honor` varchar(255) DEFAULT NULL COMMENT '荣誉 经历',
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `emp_account` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`,`emp_id`,`emp_number`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `operator` varchar(1024) DEFAULT NULL,
  `method` varchar(1024) DEFAULT NULL,
  `parameters` varchar(1024) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `id` int(60) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6200 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------

-- ----------------------------
-- Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `proj_name` varchar(50) NOT NULL COMMENT '项目名称',
  `proj_typeId` int(6) NOT NULL COMMENT '项目类型',
  `proj_intro` varchar(255) NOT NULL COMMENT '项目简介',
  `proj_needHigh` int(16) NOT NULL COMMENT '项目所需资金上限',
  `proj_needLow` int(16) NOT NULL COMMENT '项目所需资金下限',
  `proj_headAccount` varchar(20) DEFAULT NULL COMMENT '项目负责人账号',
  `id` int(16) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`,`proj_name`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------

-- ----------------------------
-- Table structure for `reportmsg`
-- ----------------------------
DROP TABLE IF EXISTS `reportmsg`;
CREATE TABLE `reportmsg` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `reported_account` varchar(255) NOT NULL COMMENT '被举报者',
  `whistleblower_account` varchar(255) NOT NULL COMMENT '举报者',
  `reason` varchar(255) DEFAULT '无' COMMENT '举报原因',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reportmsg
-- ----------------------------

-- ----------------------------
-- Table structure for `send`
-- ----------------------------
DROP TABLE IF EXISTS `send`;
CREATE TABLE `send` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(255) NOT NULL COMMENT '动作发起者',
  `receiver` varchar(255) NOT NULL COMMENT '动作接收者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of send
-- ----------------------------

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(50) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `stu_name` varchar(255) NOT NULL,
  `stu_sex` varchar(255) DEFAULT NULL,
  `stu_age` int(5) DEFAULT NULL,
  `stu_project` varchar(255) DEFAULT NULL,
  `stu_birthday` date DEFAULT NULL,
  `stu_id` char(18) NOT NULL COMMENT '身份证号',
  `stu_phone` varchar(100) NOT NULL COMMENT '手机号',
  `stu_address` varchar(255) DEFAULT NULL,
  `stu_highestSch` varchar(255) NOT NULL,
  `stu_graduationSch` varchar(255) NOT NULL,
  `stu_major` varchar(255) NOT NULL,
  `stu_account` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`stu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------

-- ----------------------------
-- Table structure for `type`
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `type_name` varchar(60) NOT NULL,
  `type_id` int(10) NOT NULL,
  PRIMARY KEY (`type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('咨询类', '3');
INSERT INTO `type` VALUES ('商贸类', '5');
INSERT INTO `type` VALUES ('文化传媒广告类', '2');
INSERT INTO `type` VALUES ('科技类', '1');
INSERT INTO `type` VALUES ('管理类', '4');
