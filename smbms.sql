/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : smbms

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 23/04/2021 16:04:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `billCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '账单编码',
  `productName` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '商品名称',
  `productDesc` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '商品描述',
  `productUnit` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '商品单位',
  `productCount` decimal(20, 2) NOT NULL COMMENT '商品数量',
  `totalPrice` decimal(20, 2) NOT NULL COMMENT '商品总额',
  `isPayment` int(0) NOT NULL COMMENT '是否支付（1：未支付 2：已支付）',
  `createdBy` bigint(0) DEFAULT NULL COMMENT '创建者（userId）',
  `creationDate` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `modifyBy` bigint(0) DEFAULT NULL COMMENT '更新者（userId）',
  `modifyDate` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `providerId` bigint(0) DEFAULT NULL COMMENT '供应商ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for provider
-- ----------------------------
DROP TABLE IF EXISTS `provider`;
CREATE TABLE `provider`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `proCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '供应商编码',
  `proName` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '供应商名称',
  `proDesc` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '供应商详细描述',
  `proContact` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '供应商联系人',
  `proPhone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '联系电话',
  `proFax` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '微信',
  `proAddress` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '地址',
  `createdBy` bigint(0) DEFAULT NULL COMMENT '创建者（userId）',
  `creationDate` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `modifyDate` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `modifyBy` bigint(0) DEFAULT NULL COMMENT '更新者（userId）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `roleCode` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '角色编码',
  `roleName` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '角色名称',
  `createdBy` bigint(0) DEFAULT NULL COMMENT '创建者',
  `creationDate` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `modifyBy` bigint(0) DEFAULT NULL COMMENT '修改者',
  `modifyDate` datetime(0) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `userCode` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '用户编码',
  `userName` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名称',
  `userPassword` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '用户密码',
  `gender` int(0) DEFAULT 1 COMMENT '性别（1:男、 2:女）',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机',
  `address` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地址',
  `userRole` bigint(0) DEFAULT NULL COMMENT '用户角色（取自角色表-角色id）',
  `createdBy` bigint(0) DEFAULT NULL COMMENT '创建者（userId）',
  `creationDate` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `modifyBy` bigint(0) DEFAULT NULL COMMENT '更新者（userId）',
  `modifyDate` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `userPicPath` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户头像',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fkrid`(`userRole`) USING BTREE,
  CONSTRAINT `fkrid` FOREIGN KEY (`userRole`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
