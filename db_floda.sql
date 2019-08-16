/*
 Navicat Premium Data Transfer

 Source Server         : Floda
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : 182.254.180.106:3306
 Source Schema         : db_floda

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 16/08/2019 08:21:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_address
-- ----------------------------
DROP TABLE IF EXISTS `tb_address`;
CREATE TABLE `tb_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户地址Id',
  `area_name` varchar(20) NOT NULL COMMENT '地区名',
  `parent_id` int(11) NOT NULL COMMENT '父级地区id',
  `is_parent` int(11) DEFAULT '0' COMMENT '是否是父级城市：0-是，1-不是',
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_cart
-- ----------------------------
DROP TABLE IF EXISTS `tb_cart`;
CREATE TABLE `tb_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车Id',
  `user_id` int(11) NOT NULL COMMENT '用户Id',
  `product_id` int(11) NOT NULL COMMENT '商品Id',
  `pro_number` int(11) NOT NULL COMMENT '商品数量',
  `cart_price` double NOT NULL COMMENT '总金额(数量*单价)',
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_categroy
-- ----------------------------
DROP TABLE IF EXISTS `tb_categroy`;
CREATE TABLE `tb_categroy` (
  `cate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类Id',
  `cate_name` varchar(20) NOT NULL COMMENT '类目名称',
  `cate_desc` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_ecaluate
-- ----------------------------
DROP TABLE IF EXISTS `tb_ecaluate`;
CREATE TABLE `tb_ecaluate` (
  `ecal_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价Id',
  `product_id` int(11) NOT NULL COMMENT '商品Id',
  `order_id` int(11) NOT NULL COMMENT '订单Id',
  `user_id` int(11) NOT NULL COMMENT '用户Id',
  `ecal_content` varchar(100) DEFAULT NULL COMMENT '评论内容',
  `ecal_time` datetime DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`ecal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_imgs
-- ----------------------------
DROP TABLE IF EXISTS `tb_imgs`;
CREATE TABLE `tb_imgs` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片Id',
  `img_addr` varchar(255) NOT NULL COMMENT '图片地址',
  `img_desc` varchar(100) DEFAULT NULL COMMENT '图片描述',
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `addr_id` int(11) NOT NULL COMMENT '收货地址id',
  `order_money` double NOT NULL COMMENT '订单总金额',
  `creattime` datetime NOT NULL COMMENT '下单时间',
  `type` int(2) NOT NULL COMMENT '1未付款，2未评价，3已完成',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=193103159 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_detail`;
CREATE TABLE `tb_order_detail` (
  `detail_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单详情id',
  `order_id` int(11) NOT NULL COMMENT '订单表id',
  `pro_order_id` int(11) NOT NULL COMMENT '订单商品id',
  `pro_name` varchar(200) NOT NULL COMMENT '商品名称',
  `pro_number` int(10) NOT NULL COMMENT '购买的商品数量',
  `pro_price` double NOT NULL COMMENT '购买商品单价',
  `isevaluate` int(2) NOT NULL DEFAULT '0' COMMENT '订单商品是否已经评论：0-未评论，1-已评论',
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_product
-- ----------------------------
DROP TABLE IF EXISTS `tb_product`;
CREATE TABLE `tb_product` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品Id',
  `pro_name` varchar(50) NOT NULL COMMENT '商品名称',
  `pro_cateId` int(11) NOT NULL COMMENT '商品类别Id',
  `pro_desc` text NOT NULL COMMENT '商品描述',
  `pro_price` double NOT NULL COMMENT '商品价格',
  `pro_status` int(1) DEFAULT '0' COMMENT '商品状态（0：正常；1：下架）',
  `pro_numbers` int(11) DEFAULT NULL COMMENT '商品总库存',
  `pro_imgId` int(11) DEFAULT NULL COMMENT '商品图片Id',
  PRIMARY KEY (`pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户Id',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT 'MD5加密，用户密码',
  `status` int(1) DEFAULT '0' COMMENT '用户状态（0：正常；1：停用）',
  `telphone` varchar(15) DEFAULT NULL COMMENT '手机号',
  `type` int(2) DEFAULT '1' COMMENT '用户类型，0管理员，1用户',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_user_address
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_address`;
CREATE TABLE `tb_user_address` (
  `user_addr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户地址Id',
  `userId` int(11) NOT NULL COMMENT '用户Id',
  `receiver_name` varchar(20) NOT NULL COMMENT '收货人姓名',
  `receiver_tel` varchar(20) NOT NULL COMMENT '收货人号码',
  `receiver_addr` varchar(100) NOT NULL COMMENT '收货人地址',
  `zip` varchar(10) DEFAULT NULL COMMENT '邮政编码',
  PRIMARY KEY (`user_addr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `tb_userinfo`;
CREATE TABLE `tb_userinfo` (
  `userInfo_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户信息Id',
  `user_id` int(11) NOT NULL COMMENT '用户Id',
  `name` varchar(20) NOT NULL COMMENT '用户姓名（真实姓名）',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `sex` int(2) DEFAULT NULL COMMENT '性别',
  `head` int(2) DEFAULT NULL COMMENT '头像地址:http://182.254.180.106/img/',
  PRIMARY KEY (`userInfo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_wishlist
-- ----------------------------
DROP TABLE IF EXISTS `tb_wishlist`;
CREATE TABLE `tb_wishlist` (
  `wishlist_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `product_id` int(11) NOT NULL COMMENT '商品ID',
  PRIMARY KEY (`wishlist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
