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

 Date: 23/04/2021 16:04:43
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
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES (2, 'BILL2016_002', '香皂、肥皂、药皂', '日用品-皂类', '块', 1000.00, 10000.00, 2, 1, '2020-03-23 04:20:40', NULL, NULL, 13);
INSERT INTO `bill` VALUES (4, 'BILL2016_004', '橄榄油', '食品-进口食用油', '斤', 200.00, 9800.00, 2, 1, '2020-04-10 03:12:13', NULL, NULL, 7);
INSERT INTO `bill` VALUES (6, 'BILL2016_006', '美国大杏仁', '食品-坚果', '袋', 300.00, 5000.00, 2, 1, '2020-04-14 06:08:09', NULL, NULL, 4);
INSERT INTO `bill` VALUES (8, 'BILL2016_008', '不锈钢盘碗', '日用品-厨房用具', '个', 600.00, 6000.00, 2, 1, '2020-04-14 05:12:13', NULL, NULL, 14);
INSERT INTO `bill` VALUES (9, 'BILL2016_009', '塑料杯', '日用品-杯子', '个', 350.00, 1750.00, 2, 1, '2020-02-04 11:40:20', NULL, NULL, 14);
INSERT INTO `bill` VALUES (10, 'BILL2016_010', '豆瓣酱', '食品-调料', '瓶', 200.00, 2000.00, 2, 1, '2020-01-29 05:07:03', NULL, NULL, 8);
INSERT INTO `bill` VALUES (11, 'BILL2016_011', '海之蓝', '饮料-国酒', '瓶', 50.00, 10000.00, 1, 1, '2020-04-14 16:16:00', NULL, NULL, 1);
INSERT INTO `bill` VALUES (12, 'BILL2016_012', '芝华士', '饮料-洋酒', '瓶', 20.00, 6000.00, 1, 1, '2020-06-09 17:00:00', 1, '2021-04-04 17:21:05', 2);
INSERT INTO `bill` VALUES (13, 'BILL2016_013', '长城红葡萄酒', '饮料-红酒', '瓶', 60.00, 800.00, 2, 1, '2020-04-14 15:23:00', NULL, NULL, 1);
INSERT INTO `bill` VALUES (14, 'BILL2016_014', '泰国香米', '食品-大米', '斤', 400.00, 5000.00, 2, 1, '2020-05-09 15:20:00', NULL, NULL, 3);
INSERT INTO `bill` VALUES (19, 'BILL438374218', '苹果醋', NULL, '箱', 85.50, 4500.00, 1, 1, '2021-04-04 12:19:46', 1, '2021-04-04 17:24:30', 2);
INSERT INTO `bill` VALUES (21, 'BILL-2021-002', '房价', NULL, '加分', 10.00, 234.00, 1, 1, '2021-04-21 21:53:57', 1, '2021-04-21 21:58:54', 1);

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
-- Records of provider
-- ----------------------------
INSERT INTO `provider` VALUES (1, 'BJ_GYS001', '北京三木堂商贸有限公司', '长期合作伙伴，主营产品:茅台、五粮液、郎酒、酒鬼酒、泸州老窖、赖茅酒、法国红酒等', '张国强', '13566667777', '010-58858787', '北京市丰台区育芳园北路', 1, '2020-03-21 16:52:07', NULL, NULL);
INSERT INTO `provider` VALUES (2, 'HB_GYS001', '石家庄帅益食品贸易有限公司', '长期合作伙伴，主营产品:饮料、水饮料、植物蛋白饮料、休闲食品、果汁饮料、功能饮料等', '王军', '13309094212', '0311-67738876', '河北省石家庄新华区', 1, '2020-04-13 04:20:40', '2021-04-21 14:31:37', 1);
INSERT INTO `provider` VALUES (3, 'GZ_GYS001', '深圳市泰香米业有限公司', '初次合作伙伴，主营产品：良记金轮米,龙轮香米等', '郑程瀚', '13402013312', '0755-67776212', '广东省深圳市福田区深南大道6006华丰大厦', 1, '2020-03-21 16:56:07', NULL, NULL);
INSERT INTO `provider` VALUES (4, 'GZ_GYS002', '深圳市喜来客商贸有限公司', '长期合作伙伴，主营产品：坚果炒货.果脯蜜饯.天然花茶.营养豆豆.特色美食.进口食品.海味零食.肉脯肉', '林妮', '18599897645', '0755-67772341', '广东省深圳市福龙工业区B2栋3楼西', 1, '2020-03-22 16:52:07', NULL, NULL);
INSERT INTO `provider` VALUES (5, 'JS_GYS001', '兴化佳美调味品厂', '长期合作伙伴，主营产品：天然香辛料、鸡精、复合调味料', '徐国洋', '13754444221', '0523-21299098', '江苏省兴化市林湖工业区', 1, '2020-02-22 16:52:07', NULL, NULL);
INSERT INTO `provider` VALUES (7, 'BJ_GYS003', '北京国粮食用油有限公司', '初次合作伙伴，主营产品：花生油、大豆油、小磨油等', '王驰', '13344441135', '010-588134111', '北京大兴青云店开发区', 1, '2020-04-13 00:00:00', NULL, NULL);
INSERT INTO `provider` VALUES (8, 'ZJ_GYS001', '慈溪市广和绿色食品厂', '长期合作伙伴，主营产品：豆瓣酱、黄豆酱、甜面酱，辣椒，大蒜等农产品', '薛圣丹', '18099953223', '0574-34449090', '浙江省宁波市慈溪周巷小安村', 1, '2020-01-21 06:02:07', NULL, NULL);
INSERT INTO `provider` VALUES (9, 'GX_GYS001', '优百商贸有限公司', '长期合作伙伴，主营产品：日化产品', '李立国', '13323566543', '0771-98861134', '广西南宁市秀厢大道42-1号', 1, '2020-03-21 19:52:07', NULL, NULL);
INSERT INTO `provider` VALUES (11, 'GZ_GYS003', '广州市白云区美星五金制品厂', '长期合作伙伴，主营产品：海绵床垫、坐垫、靠垫、海绵枕头、头枕等', '梁天', '13562276775', '020-85542231', '广州市白云区钟落潭镇福龙路20号', 1, '2020-01-21 06:12:17', NULL, NULL);
INSERT INTO `provider` VALUES (12, 'BJ_GYS004', '北京隆盛日化科技', '长期合作伙伴，主营产品：日化环保清洗剂，家居洗涤专卖、洗涤用品网、墙体除霉剂、墙面霉菌清除剂等', '孙欣', '13689865678', '010-35576786', '北京市大兴区旧宫', 1, '2020-01-21 12:51:11', NULL, NULL);
INSERT INTO `provider` VALUES (13, 'SD_GYS001', '山东豪克华光联合发展有限公司', '长期合作伙伴，主营产品：洗衣皂、洗衣粉、洗衣液、洗洁精、消杀类、香皂等', '吴洪转', '13245468787', '0531-53362445', '山东济阳济北工业区仁和街21号', 1, '2020-01-28 10:52:07', NULL, NULL);
INSERT INTO `provider` VALUES (18, 'HB_GYS028', '物产公司', NULL, '张三', '12738283882', NULL, '广东省中山市', 1, '2021-04-21 14:30:59', '2021-04-21 14:31:19', 1);

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
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (2, 'SMBMS-EMPLOYEE', '普通员工', 1, '2020-02-02 00:01:00', 1, '2021-04-04 21:36:53');
INSERT INTO `role` VALUES (3, 'SMBMS-MANAGER', '经理', 1, '2020-02-03 00:00:00', 1, '2021-04-04 21:36:29');
INSERT INTO `role` VALUES (4, 'SMBMS-ADMIN', '管理员', 1, '2021-04-04 21:15:13', 1, '2021-04-21 13:37:07');

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

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '系统管理员', '123123', 2, NULL, '13688889999', '山东省日照市东港区成府路207号', 4, 1, '2020-03-21 16:52:07', 1, '2021-04-04 21:51:57', NULL);
INSERT INTO `user` VALUES (3, 'hanlubiao', '韩路彪', '1111111', 1, NULL, '13688888888', '山东省日照市东港区北辰中心12号', 3, 1, '2020-02-11 19:52:09', 1, '2021-03-19 22:38:18', NULL);
INSERT INTO `user` VALUES (5, 'wangyang', '王洋', '0000000', 2, '2001-12-31', '13444561124', '山东省青岛市三二二区西二旗辉煌国际16层', 3, 1, '2020-06-11 19:09:07', NULL, NULL, NULL);
INSERT INTO `user` VALUES (6, 'zhaoyan123', '赵燕123', 'wjdi1840', 2, NULL, '13666668888', NULL, 2, 1, '2020-04-21 13:54:07', 1, '2021-03-19 22:22:07', NULL);
INSERT INTO `user` VALUES (7, 'sunlei', '孙磊', '111', 1, '1998-09-10', '13366666666', '山东省日照市朝阳区管庄新月小区12楼', 2, 1, '2020-05-06 10:52:07', 1, '2021-03-19 22:41:12', NULL);
INSERT INTO `user` VALUES (9, 'zhangchen', '张晨', '0000000', 1, '1986-03-28', '18098765434', '朝阳区管庄路口北柏林爱乐三期13号楼', 3, 1, '2019-06-09 05:52:37', 1, '2020-04-14 14:15:36', NULL);
INSERT INTO `user` VALUES (11, 'yangguo', '杨过', '0000000', 2, '1989-01-01', '13388886623', '北京市朝阳区北苑家园茉莉园20号楼', 3, 1, '2020-02-01 03:52:07', NULL, NULL, NULL);
INSERT INTO `user` VALUES (12, 'zhaomin', '赵敏', '0000000', 2, '1989-12-04', '18099897657', '山东省临沂市昌平区天通苑3区12号楼', 2, 1, '2020-01-12 12:02:12', 1, '2021-04-19 16:28:01', NULL);
INSERT INTO `user` VALUES (15, 'ysk', '视康', 'wjdi1840', 1, '1998-09-10', '13666668888', '湖南邵阳洞口', 2, NULL, NULL, 1, '2021-04-19 16:15:37', NULL);
INSERT INTO `user` VALUES (18, 'aaa', '半节课', 'wjdi1840', 2, '2000-09-04', '13366666666', '广东省中山市', 2, NULL, NULL, 1, '2021-04-21 12:23:29', NULL);

SET FOREIGN_KEY_CHECKS = 1;
