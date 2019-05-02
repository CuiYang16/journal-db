/*
 Navicat Premium Data Transfer

 Source Server         : 本地-bishe
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : data_management

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 02/05/2019 22:05:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow`  (
  `borrow_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '借阅表',
  `borrow_time` date NULL DEFAULT NULL COMMENT '借阅时间',
  `return_time` date NULL DEFAULT NULL COMMENT '归还时间',
  `reality_days` int(255) NULL DEFAULT NULL COMMENT '实际借阅天数',
  `is_overdue` tinyint(1) NULL DEFAULT 0 COMMENT '是否逾期',
  `overdue_days` int(255) NULL DEFAULT 0 COMMENT '逾期天数',
  `penalty` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '罚金',
  `is_payment` tinyint(1) NULL DEFAULT 0 COMMENT '是否缴纳',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户外键',
  `journal_id` int(11) NULL DEFAULT NULL COMMENT '资料外键',
  PRIMARY KEY (`borrow_id`) USING BTREE,
  INDEX `borrow_id`(`borrow_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `data_id`(`journal_id`) USING BTREE,
  INDEX `borrow_id_2`(`borrow_id`, `user_id`, `journal_id`) USING BTREE,
  CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`journal_id`) REFERENCES `journal_details` (`journal_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrow
-- ----------------------------
INSERT INTO `borrow` VALUES (1, '2019-05-02', '2019-07-02', NULL, 0, 0, 0.00, 0, 0, 1, 96);
INSERT INTO `borrow` VALUES (2, '2019-05-02', '2019-07-02', NULL, 0, 0, 0.00, 0, 0, 1, 95);
INSERT INTO `borrow` VALUES (3, '2019-05-02', '2019-07-02', NULL, 0, 0, 0.00, 0, 0, 1, 89);
INSERT INTO `borrow` VALUES (4, '2019-05-02', '2019-07-02', NULL, 0, 0, 0.00, 0, 0, 1, 93);
INSERT INTO `borrow` VALUES (5, '2019-04-30', '2019-07-02', NULL, 0, 0, 0.00, 0, 0, 1, 93);
INSERT INTO `borrow` VALUES (6, '2019-05-02', '2019-07-02', NULL, 0, 0, 0.00, 0, 0, 1, 86);
INSERT INTO `borrow` VALUES (7, '2019-05-02', '2019-07-02', NULL, 0, 0, 0.00, 0, 0, 1, 96);
INSERT INTO `borrow` VALUES (8, '2019-05-02', '2019-07-02', NULL, 0, 0, 0.00, 0, 0, 1, 86);
INSERT INTO `borrow` VALUES (9, '2019-04-28', '2019-05-01', NULL, 0, 0, 0.00, 0, 0, 1, 86);
INSERT INTO `borrow` VALUES (10, '2019-05-02', '2019-07-02', NULL, 0, 0, 0.00, 0, 0, 1, 87);
INSERT INTO `borrow` VALUES (11, '2019-05-01', '2019-07-02', NULL, 0, 0, 0.00, 0, 0, 1, 80);

-- ----------------------------
-- Table structure for fair_information
-- ----------------------------
DROP TABLE IF EXISTS `fair_information`;
CREATE TABLE `fair_information`  (
  `fair_information_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '书展信息',
  `fair_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '书展名称',
  `fair_theme` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '书展主题',
  `fair_site` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '书展地点',
  `fair_start_time` timestamp(0) NULL DEFAULT NULL COMMENT '书展开始时间',
  `fair_end_time` timestamp(0) NULL DEFAULT NULL COMMENT '书展结束时间',
  `fair_host` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主办方',
  `sponsor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '赞助商',
  `organizer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '承办者',
  `fair_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '书展图片',
  `fair_describe` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '书展介绍',
  `is_delete` tinyint(1) NULL DEFAULT NULL COMMENT '是否已删除',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户外键（创建人）',
  PRIMARY KEY (`fair_information_id`) USING BTREE,
  INDEX `fair_information_id`(`fair_information_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `fair_information_id_2`(`fair_information_id`, `user_id`) USING BTREE,
  CONSTRAINT `fair_information_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fair_information
-- ----------------------------
INSERT INTO `fair_information` VALUES (1, 'test', 'a', 'a', '2019-04-21 06:00:00', '2019-04-21 20:03:00', '1', '1', '1', '1555751145961-journal.jpg', '1', 0, 1);
INSERT INTO `fair_information` VALUES (2, 'test2', 'b', '内蒙古呼和浩特内蒙古工业大学', '2019-04-21 18:47:56', '2019-04-21 18:47:59', '2', '2', '2', '1555751145961-journal.jpg', '2', 1, 1);
INSERT INTO `fair_information` VALUES (3, '特', '没有', '', '2019-04-22 15:39:23', '2019-04-29 15:39:23', '我', '我', '我', '1555751145961-journal.jpg', '<p><strong>驱蚊器翁</strong></p>\n<ol>\n<li style=\"text-align: left;\"><strong>撒地方斯蒂芬</strong></li>\n<li style=\"text-align: left;\"><span style=\"background-color: #ffff00;\"><strong>接口</strong></span></li>\n</ol>', 0, 1);
INSERT INTO `fair_information` VALUES (4, 'jsjjs可是可是', '单方事故的说法', '骨灰级美女规划局', '2019-04-23 09:38:15', '2019-04-30 09:38:15', '根据', '就', '高合金钢', '1555751145961-journal.jpg', '<p>高合金钢焊接工几号给</p>', 0, 1);
INSERT INTO `fair_information` VALUES (5, '地方fg', '风格和风格和', '复合弓发过火', '2019-04-23 09:41:15', '2019-04-30 09:41:15', '蛊惑江湖', '规划局规划', '规划', '1555751145961-journal.jpg', '<p>规划局规划风格和风格和</p>', 0, 1);
INSERT INTO `fair_information` VALUES (6, '电饭sdfsdfsdfsdfsd撒地方斯蒂芬', '电饭锅电饭锅', 'TT', '2019-04-23 09:43:43', '2019-04-30 09:43:43', '555', '55', '55', '1555751145961-journal.jpg', '<p>尔特让他儿童&nbsp;</p>', 0, 1);
INSERT INTO `fair_information` VALUES (7, '电饭锅水电费', '', '', '2019-04-23 09:45:12', NULL, '', '', '', '1555751145961-journal.jpg', '<p>防守打法</p>', 0, 1);
INSERT INTO `fair_information` VALUES (9, 'sdfs', 'dfgsdf', 'sdf', '2019-04-23 10:35:48', '2019-04-30 10:35:48', 'sdf', 'sdfsd', 'sdfsdfds', '1555751145961-journal.jpg', '<p>dfgdrewr23</p>', 0, 1);
INSERT INTO `fair_information` VALUES (10, 'dfg', 'dfg', 'dfg', '2019-04-23 10:37:33', '2019-04-30 10:37:33', 'dfgd', 'ge4', 'er4', '1555751145961-journal.jpg', '<p>drgfsdrf</p>', 0, 1);
INSERT INTO `fair_information` VALUES (11, 'sdf', 'werw', 'we', '2019-04-23 10:39:09', '2019-05-22 00:00:00', 'we', 'fsdf', 'sfs', NULL, '<p>uyghj456t4</p>', 0, 1);
INSERT INTO `fair_information` VALUES (12, 'sdfs', 'dfgfhdfg', 'ghr5e', '2019-04-23 10:40:41', '2019-05-22 00:00:00', 'rt', 'fgh', 'fghr', NULL, '<p>yhuktude</p>', 0, 1);
INSERT INTO `fair_information` VALUES (13, '5645', '6456', '45t', '2019-04-23 10:44:11', '2019-05-22 00:00:00', 'ert', 'ert', 'ert', NULL, '<p>erterterterte</p>', 0, 1);
INSERT INTO `fair_information` VALUES (14, 'dfgdfg', 'dfger4te', 'dfg', '2019-04-23 10:45:23', '2019-05-22 00:00:00', 'dfg', 'dfg', 'fg', '1555987534740-journal-fair.jpg', '<p>dfgdfgdfg</p>', 0, 1);
INSERT INTO `fair_information` VALUES (16, '豆腐干豆腐', 'asdasd', 'asdasdasd', '2019-04-23 11:17:06', '2019-05-22 00:00:00', 'wdawdasd', 'wdad', 'wadasd', '1555989440146-journal-fair.jpg', '<p>awdasdasd</p>', 0, 1);
INSERT INTO `fair_information` VALUES (17, '456yrt', '45ygr tg', 'trt', '2019-04-09 00:00:00', '2019-05-22 00:00:00', 'rtyrt', 'r', 'yrt', '1556007268346-journal-fair.jpg', '<p>dsffsdfsdfsdf<strong>asdfasda</strong></p>\n<p style=\"text-align: center;\">&nbsp;</p>\n<p style=\"text-align: center;\"><strong>ghujdADAS</strong></p>', 0, 1);
INSERT INTO `fair_information` VALUES (18, '666', '555', '5676', '2019-04-23 11:27:55', '2019-04-30 11:27:55', 'y7', 'uy', 'juiju', '1556007047524-journal-fair.jpg', '<p>erfgdfgdsfgdfg</p>', 0, 1);
INSERT INTO `fair_information` VALUES (19, 'rdtgdft', '45terger', 'wef', '2019-04-23 11:38:10', '2019-04-30 11:38:10', 'wef', 'sf', 'sdfs', '1555990714772-journal-fair.jpg', '<p>yhfghesrt3<span style=\"background-color: #ccffff;\">4tdergdfg</span></p>', 0, 1);

-- ----------------------------
-- Table structure for fair_journal
-- ----------------------------
DROP TABLE IF EXISTS `fair_journal`;
CREATE TABLE `fair_journal`  (
  `fair_journal_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '书展_资料',
  `fair_information_id` int(11) NULL DEFAULT NULL COMMENT '书展外键',
  `journal_id` int(11) NULL DEFAULT NULL COMMENT '资料外键',
  PRIMARY KEY (`fair_journal_id`) USING BTREE,
  INDEX `fair_data_id`(`fair_journal_id`) USING BTREE,
  INDEX `fair_information_id`(`fair_information_id`, `journal_id`) USING BTREE,
  INDEX `journal_id`(`journal_id`) USING BTREE,
  CONSTRAINT `fair_journal_ibfk_1` FOREIGN KEY (`fair_information_id`) REFERENCES `fair_information` (`fair_information_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fair_journal_ibfk_2` FOREIGN KEY (`journal_id`) REFERENCES `journal_details` (`journal_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fair_user
-- ----------------------------
DROP TABLE IF EXISTS `fair_user`;
CREATE TABLE `fair_user`  (
  `fair_user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '书展用户',
  `fair_information_id` int(11) NULL DEFAULT NULL COMMENT '书展外键',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '参加用户外键',
  PRIMARY KEY (`fair_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for journal_details
-- ----------------------------
DROP TABLE IF EXISTS `journal_details`;
CREATE TABLE `journal_details`  (
  `journal_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资料表',
  `journal_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资料名称',
  `journal_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '杂志图片',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者（可多个）',
  `journal_level` int(255) NULL DEFAULT NULL COMMENT '杂志级别',
  `journal_join_time` timestamp(0) NULL DEFAULT NULL COMMENT '入库时间',
  `publish_time` date NULL DEFAULT NULL COMMENT '出版时间',
  `reel_number` int(11) NULL DEFAULT NULL COMMENT '卷号',
  `issue` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '期号（yyyy-mm）',
  `total_issue` int(255) NULL DEFAULT NULL COMMENT '总期号',
  `CN` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国内统一刊号(CNxx-xxxx/xx)',
  `ISBN` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国际标准书号',
  `ISSN` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国际标准刊号（ISSN xxxx-xxxx）',
  `publication_cycle` int(255) NULL DEFAULT NULL COMMENT '出版周期',
  `publishing_house` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出版社',
  `journal_host` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主办',
  `is_foreign` tinyint(1) NULL DEFAULT NULL COMMENT '是否是国外',
  `publishing_area` int(255) NULL DEFAULT NULL COMMENT '出版地区\r\n',
  `jounal_language` int(255) NULL DEFAULT NULL COMMENT '出版语言\r\n',
  `foreign_codes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国外代号（mxxxx）',
  `domestic_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国内代号(x-xxx)',
  `format` int(255) NULL DEFAULT NULL COMMENT '开本',
  `page_number` int(255) NULL DEFAULT NULL COMMENT '页数',
  `is_borrow` tinyint(1) NULL DEFAULT 1 COMMENT '是否可借阅',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述简介',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否已删除',
  `type_id` int(255) NULL DEFAULT NULL COMMENT '资料类别外键',
  `journal_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资料类别外键（数组）',
  PRIMARY KEY (`journal_id`) USING BTREE,
  INDEX `data_id`(`journal_id`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of journal_details
-- ----------------------------
INSERT INTO `journal_details` VALUES (1, '青年文摘', '5c3d4b76_ea6f.jpg', NULL, NULL, '2019-03-12 11:29:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 12.00, '阿斯达四大', 0, 1, NULL);
INSERT INTO `journal_details` VALUES (10, '地方11111', '5c3d4b76_ea6f.jpg', '6', 1, '2019-04-18 11:01:24', '2019-04-17', 6, '6', 6, '6', '6', '6', 6, '6', '6', 0, 6, 1, '6', '6', 66, 6, 1, 6.00, '', 0, 3, '[3]');
INSERT INTO `journal_details` VALUES (15, '提供的发给', '5c3d4b76_ea6f.jpg', '', 1, '2019-04-18 12:55:40', NULL, NULL, '', NULL, '', '', '', NULL, '', '', 0, 6, 1, '', '', NULL, NULL, 1, NULL, '', 0, 1002, '[1,1002]');
INSERT INTO `journal_details` VALUES (76, '撒旦法', '5c3d4b76_ea6f.jpg', '765', 2, '2019-04-18 17:01:43', '2019-04-11', 567, '56', 56, '56', '56', '67', 67, '677', '67', 0, 7, 1, '67', '76', 67, 67, 1, 8.00, '发给他元话费更好地发给或多方', 0, 3003, '[3,3003]');
INSERT INTO `journal_details` VALUES (77, '电饭锅电饭锅的', '5c3d4b76_ea6f.jpg', '风格和南方', 2, '2019-04-18 17:06:40', '2019-04-18', 6578, '678', 678, '678', '678', '678', 678, '678', '678', 1, 6, 3, '678', '678', 678678, 678, 1, 8678.00, '跟团游鸡肤鹤发', 0, 3003, '[3,3003]');
INSERT INTO `journal_details` VALUES (78, '研讨会发给回复', '5c3d4b76_ea6f.jpg', '规范化就发个号', 3, '2019-04-18 17:09:17', '2019-04-02', 678, '678', 678, '678', '678', '678', 678, '678', '678', 0, 23, 1, '678', '678', 678, 678, 1, 678.00, '库遇见过', 0, 4003, '[4,4003]');
INSERT INTO `journal_details` VALUES (79, '风格和风格', '5c3d4b76_ea6f.jpg', '任天野', 2, '2019-04-18 17:13:41', '2019-04-10', 789, '53', 35, '35', '35', '3535', 35, '35', '35', 0, 4, 1, '35', '35', 35, 35, 1, 35.00, '风格和风格和', 0, 1002, '[1,1002]');
INSERT INTO `journal_details` VALUES (80, '电饭锅电饭锅', '5c3d4b76_ea6f.jpg', '567与', 1, '2019-04-18 17:15:39', '2019-04-17', 8, '8', NULL, '', '', '', NULL, '', '', 0, 24, 1, '', '', NULL, NULL, 1, NULL, '高合金钢', 0, 3, '[3]');
INSERT INTO `journal_details` VALUES (81, '鼎折覆餗', '5c3d4b76_ea6f.jpg', '规划局', 2, '2019-04-18 17:17:31', '2019-04-03', 7, '', NULL, '', '', '', NULL, '', '', 0, 5, 1, '', '', NULL, NULL, 1, NULL, '', 0, 5002, '[5,5002]');
INSERT INTO `journal_details` VALUES (82, '环节', '5c3d4b76_ea6f.jpg', '环节', 2, '2019-04-18 17:31:06', '2019-04-11', 6, '6', 6, '6', '6', '6', 6, '', '6', 1, 7, 1, '6', '6', 6, 6, 1, 6.00, '', 0, 3003, '[3,3003]');
INSERT INTO `journal_details` VALUES (86, '333333', '5c3d4b76_ea6f.jpg', '1', 2, '2019-04-19 14:25:31', '2019-04-17', 1, '2019-1', 1, 'CN11-1111/A', '9780596520687', '1111-1111', 4, '内蒙古出版社', '1', 0, 3, 1, 'm111', '1-111', 4, 1, 0, 1.00, '678铁观音金太阳', 0, 3002, '[3,3002]');
INSERT INTO `journal_details` VALUES (87, '特', '5c3d4b76_ea6f.jpg', '阿萨德', 2, '2019-04-20 15:42:39', '2019-04-18', 1, '2019-1', 1, 'CN11-1111/A', '9780596520687', '1111-1111', 3, '1', '1', 0, 2, 1, 'm1234', '1-111', 4, 1, 1, 1.00, 'asdasd', 0, 1002, '[1,1002]');
INSERT INTO `journal_details` VALUES (88, '1', '5c3d4b76_ea6f.jpg', '1', 1, '2019-04-20 15:46:34', '2019-04-10', 1, '2019-1', 1, 'CN11-1111/A', '9780596520687', '1111-1111', 2, '1', '1', 0, 2, 1, 'M111', '1-111', 4, 1, 1, 1.00, 'ADSASD', 1, 3003, '[3,3003]');
INSERT INTO `journal_details` VALUES (89, '11111', '5c3d4b76_ea6f.jpg', '1111', 1, '2019-04-20 15:52:24', '2019-04-10', 1, '2019-1', 1, 'CN11-1111/A', '9780596520687', '1111-1111', 4, '1', '1', 0, 1, 1, 'm1234', '1-111', 4, 1, 1, 1.00, 'asdadads', 0, 3003, '[3,3003]');
INSERT INTO `journal_details` VALUES (93, '123123123', '5c3d4b76_ea6f.jpg', '1111', 1, '2019-04-20 16:18:28', '2019-04-18', 1, '2019-1', 1, 'cn11-1111/A', '9780596520687', '1111-1111', 3, '1', '1', 0, 5, 1, 'm123', '1-111', 4, 1, 1, 1.00, 'sdfsadf', 0, 3, '[3]');
INSERT INTO `journal_details` VALUES (94, '1', '5c3d4b76_ea6f.jpg', '1', 1, '2019-04-20 17:04:58', '2019-04-18', 1, '2019-2', 1, 'cn11-1111/A', '9780596520687', '1111-2222', 5, '1', '1', 0, 6, 1, 'm122', '1-222', 4, 1, 1, 1.00, '<p><strong>sdasdfasdsdfsdfsdfsdfsdfsdfsdfsdfsdfd</strong><span style=\"text-decoration: underline; color: #ff6600;\"><em>撒旦法撒大声地</em></span></p>', 0, 4, '[4]');
INSERT INTO `journal_details` VALUES (95, '撒旦法', '5c3d4b76_ea6f.jpg', '阿达', 2, '2019-04-28 14:47:38', '2019-04-25', 12, '2019-2', 12, 'cn11-1111/A', '9780596520687', '1111-2222', 7, '1', '1', 0, 4, 1, 'm123', '1-211', 4, 12, 1, 1.00, '<p>sdfsdfwerfwqerqw&nbsp;</p>', 0, 3003, '[3,3003]');
INSERT INTO `journal_details` VALUES (96, '撒地方斯蒂芬', '5c3d4b76_ea6f.jpg', 'asdasd', 2, '2019-04-28 17:28:18', '2019-04-18', 12, '2018-3', 12, 'cn11-1111/A', '9780596520687', '2345-3456', 7, 'wsd', 'sdf', 0, 5, 1, 'm123', '1-555', 4, 12, 1, 2.00, '<p>45tgedrfgsdfsc</p>', 0, 3002, '[3,3002]');

-- ----------------------------
-- Table structure for journal_images
-- ----------------------------
DROP TABLE IF EXISTS `journal_images`;
CREATE TABLE `journal_images`  (
  `images_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `journal_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`images_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of journal_images
-- ----------------------------
INSERT INTO `journal_images` VALUES (1, '1555574451361-journal-addition.jpg', 'E:/img/1555574451361-journal-addition.jpg', 73);
INSERT INTO `journal_images` VALUES (2, '1555574451610-journal-addition.jpg', 'E:/img/1555574451610-journal-addition.jpg', 73);
INSERT INTO `journal_images` VALUES (3, '1555574554526-journal-addition.jpg', 'E:/img/1555574554526-journal-addition.jpg', 74);
INSERT INTO `journal_images` VALUES (4, '1555574554850-journal-addition.jpg', 'E:/img/1555574554850-journal-addition.jpg', 74);
INSERT INTO `journal_images` VALUES (5, '1555574570595-journal-addition.jpg', 'E:/img/1555574570595-journal-addition.jpg', 75);
INSERT INTO `journal_images` VALUES (6, '1555574570771-journal-addition.jpg', 'E:/img/1555574570771-journal-addition.jpg', 75);
INSERT INTO `journal_images` VALUES (7, '1555574571175-journal-addition.jpg', 'E:/img/1555574571175-journal-addition.jpg', 75);
INSERT INTO `journal_images` VALUES (8, '1555574571610-journal-addition.jpg', 'E:/img/1555574571610-journal-addition.jpg', 75);
INSERT INTO `journal_images` VALUES (9, '1555578136884-journal-addition.jpg', 'E:/img/1555578136884-journal-addition.jpg', 76);
INSERT INTO `journal_images` VALUES (10, '1555578136909-journal-addition.jpg', 'E:/img/1555578136909-journal-addition.jpg', 76);
INSERT INTO `journal_images` VALUES (11, '1555578431499-journal-addition.jpg', 'E:/img/1555578431499-journal-addition.jpg', 77);
INSERT INTO `journal_images` VALUES (12, '1555578431663-journal-addition.jpg', 'E:/img/1555578431663-journal-addition.jpg', 77);
INSERT INTO `journal_images` VALUES (13, '1555578432360-journal-addition.jpg', 'E:/img/1555578432360-journal-addition.jpg', 77);
INSERT INTO `journal_images` VALUES (14, '1555578590822-journal-addition.jpg', 'E:/img/1555578590822-journal-addition.jpg', 78);
INSERT INTO `journal_images` VALUES (15, '1555578590563-journal-addition.jpg', 'E:/img/1555578590563-journal-addition.jpg', 78);
INSERT INTO `journal_images` VALUES (16, '1555578854520-journal-addition.jpg', 'E:/img/1555578854520-journal-addition.jpg', 79);
INSERT INTO `journal_images` VALUES (17, '1555578959526-journal-addition.jpg', 'E:/img/1555578959526-journal-addition.jpg', 80);
INSERT INTO `journal_images` VALUES (18, '1555579070112-journal-addition.jpg', 'E:/img/1555579070112-journal-addition.jpg', 81);
INSERT INTO `journal_images` VALUES (19, '1555579905030-journal-addition.jpg', 'E:/img/1555579905030-journal-addition.jpg', 82);
INSERT INTO `journal_images` VALUES (23, '1555665581537-journal-addition.jpg', 'E:/img/1555665581537-journal-addition.jpg', 86);
INSERT INTO `journal_images` VALUES (24, '1556443795210-journal-addition.jpg', 'E:/img/1556443795210-journal-addition.jpg', 96);
INSERT INTO `journal_images` VALUES (25, '1556443795222-journal-addition.jpg', 'E:/img/1556443795222-journal-addition.jpg', 96);

-- ----------------------------
-- Table structure for journal_type
-- ----------------------------
DROP TABLE IF EXISTS `journal_type`;
CREATE TABLE `journal_type`  (
  `type_id` int(20) NOT NULL COMMENT '资料类别表(三级)',
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资料类别名',
  `type_level` int(255) NULL DEFAULT NULL COMMENT '类别级别',
  `type_index` int(255) NULL DEFAULT NULL COMMENT '排序索引',
  `type_describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别描述',
  `parent_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`type_id`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of journal_type
-- ----------------------------
INSERT INTO `journal_type` VALUES (1, '自然科学', 1, 3, NULL, -1);
INSERT INTO `journal_type` VALUES (2, '计算机', 1, 2, NULL, -1);
INSERT INTO `journal_type` VALUES (3, '444444444', 1, 5, 'asd', -1);
INSERT INTO `journal_type` VALUES (4, 'test', 1, 4, 'asdas', -1);
INSERT INTO `journal_type` VALUES (5, '567ftgyret', 1, 1, 'sdcdf', -1);
INSERT INTO `journal_type` VALUES (6, 'test_onload', 1, 6, 'asdqwdasdczxc', -1);
INSERT INTO `journal_type` VALUES (1001, '农业科技', 2, NULL, NULL, 1);
INSERT INTO `journal_type` VALUES (1002, '信息科技', 2, NULL, NULL, 1);
INSERT INTO `journal_type` VALUES (2001, '软件工程', 2, NULL, NULL, 2);
INSERT INTO `journal_type` VALUES (2002, '通信工程', 2, NULL, NULL, 2);
INSERT INTO `journal_type` VALUES (3001, '1111111111', 2, NULL, 'ds', 3);
INSERT INTO `journal_type` VALUES (3002, 'dfgsdfwe', 2, NULL, 'sdfcsdf', 3);
INSERT INTO `journal_type` VALUES (3003, 'xzczxc', 2, NULL, 'ererw', 3);
INSERT INTO `journal_type` VALUES (4001, '567uth', 2, NULL, 'fgdfrgdfg', 4);
INSERT INTO `journal_type` VALUES (4003, 'sdddd', 2, NULL, 'ssss', 4);
INSERT INTO `journal_type` VALUES (5001, 'dfgsdf', 2, NULL, 'sdfsdf', 5);
INSERT INTO `journal_type` VALUES (5002, 'dfdfg345r34rwefr', 2, NULL, '', 5);
INSERT INTO `journal_type` VALUES (5003, '电饭锅', 2, NULL, '', 5);
INSERT INTO `journal_type` VALUES (1001001, '植物保护', 3, NULL, NULL, 1001);
INSERT INTO `journal_type` VALUES (1001002, '园艺', 3, NULL, NULL, 1001);
INSERT INTO `journal_type` VALUES (5001001, 'hjk发给或多方', 3, NULL, '电饭锅', 5001);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限',
  `permission_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permission_descride` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限描述',
  PRIMARY KEY (`permission_id`) USING BTREE,
  INDEX `permission_id`(`permission_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色表',
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名',
  `role_descride` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'admin', NULL);
INSERT INTO `role` VALUES (2, 'editor', NULL);

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `role_permission_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限',
  `role_id` int(11) NULL DEFAULT NULL,
  `permission_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`role_permission_id`) USING BTREE,
  INDEX `role_permission_id`(`role_permission_id`) USING BTREE,
  INDEX `role_id`(`role_id`, `permission_id`) USING BTREE,
  INDEX `permission_id`(`permission_id`) USING BTREE,
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`permission_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for slide_show
-- ----------------------------
DROP TABLE IF EXISTS `slide_show`;
CREATE TABLE `slide_show`  (
  `slide_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `show_flag` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`slide_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of slide_show
-- ----------------------------
INSERT INTO `slide_show` VALUES (10, '1556248026044-journal.jpg', 'E:/img/1556248026044-journal.jpg', NULL);
INSERT INTO `slide_show` VALUES (11, '1556248163009-journal.jpg', 'E:/img/1556248163009-journal.jpg', NULL);
INSERT INTO `slide_show` VALUES (12, '1556248260611-journal.jpg', 'E:/img/1556248260611-journal.jpg', NULL);
INSERT INTO `slide_show` VALUES (15, '1556445515303-slide.png', 'E:/img/1556445515303-slide.png', NULL);
INSERT INTO `slide_show` VALUES (16, '1556454943642-slide.jpg', 'E:/img/1556454943642-slide.jpg', NULL);
INSERT INTO `slide_show` VALUES (17, '1556502449407-slide.jpg', 'E:/img/1556502449407-slide.jpg', NULL);
INSERT INTO `slide_show` VALUES (18, '1556503067659-slide.jpg', 'E:/img/1556503067659-slide.jpg', NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `user_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `user_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户电话',
  `user_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户邮箱',
  `user_sex` tinyint(1) NULL DEFAULT NULL COMMENT '性别',
  `user_head_portrait` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `last_login_time` timestamp(0) NULL DEFAULT NULL COMMENT '最后一次登录时间',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `user_id_2`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '$2a$10$c33lBhfeXZCWq3F4tMX6uepbkdwm4mk7JgSX9gLh5qgr9Ln1b7NI6', '15555555555', '12345678@qq.com', 1, 'e1cf12c07bf6458992569e67927d767e.png', '2019-04-29 17:52:56', 1);
INSERT INTO `user` VALUES (15, 'test', '$2a$10$o1vHv7JPeXH9pd/5CtOMs.sDt79R16goNJ.hvVMmv5vfp06f6ouEO', '15288888888', '12345678@qq.com', 1, '1556439305760-user-avatar.jpg', '2019-04-29 10:42:12', 0);
INSERT INTO `user` VALUES (65, '三生三世', '$2a$10$BlL22pBvwf5HdjCK39tE3u540OmBW24esjQM88DrVGgVY96Qx8IP.', '15288888888', '123456@qq.com', 1, '1555574451610-journal-addition.jpg', NULL, 0);
INSERT INTO `user` VALUES (66, 'asdadad', '$2a$10$MOVWgazvhjMPFdr5NWl/7uIJ6NWiKpCggspwuQRdjex6VX/PVOfpi', '15566666666', '123445@qq.com', 1, '1555574451361-journal-addition.jpg', NULL, 1);
INSERT INTO `user` VALUES (68, 'sdafasd', '$2a$10$Wb79ds7FaeJfskycZTiu/.TvzumaoaNYjQNE8KHskvJxza8/3sH2e', '18888888888', 'ajisdhjikasd@qq.com', 1, '1555563731426-journal.jpg', NULL, 0);
INSERT INTO `user` VALUES (73, '新的风格胜多负少', '$2a$10$00D5CoTY4vVNI9zePg6.Be48Sy4Ej.tR/yA5eJrb1/aOwCNgDxe.u', '15888888888', 'asdefasdajnk@163.com', 1, '1556523826935-user-avatar.jpg', NULL, 0);
INSERT INTO `user` VALUES (74, 'sdfsdfsdf', '$2a$10$saiYTdL3rbTnxuDQFib5eO5q.UQRdtVq0OF/TXr0WNo6PRbP/vCne', '15555555555', 'sdfsdfdfs@qq.com', 0, '1556523987276-user-avatar.jpg', NULL, 0);
INSERT INTO `user` VALUES (75, 'asdasd', '$2a$10$q6pW6/N3Ld1sRbS7nBthkeNEzXp.ATx..769WzooncNe1HJlFgZPG', '15888888888', 'adasdhjkasd@qq.com', 1, NULL, NULL, 0);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户角色关联',
  `user_id` int(11) NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`user_role_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  INDEX `user_role_id`(`user_role_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `user_id_2`(`user_id`, `role_id`) USING BTREE,
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1);
INSERT INTO `user_role` VALUES (2, 1, 2);
INSERT INTO `user_role` VALUES (5, 15, 1);
INSERT INTO `user_role` VALUES (6, 15, 2);
INSERT INTO `user_role` VALUES (8, 65, 1);
INSERT INTO `user_role` VALUES (9, 65, 2);
INSERT INTO `user_role` VALUES (10, 66, 1);
INSERT INTO `user_role` VALUES (12, 68, 1);
INSERT INTO `user_role` VALUES (23, 73, 1);
INSERT INTO `user_role` VALUES (22, 73, 2);
INSERT INTO `user_role` VALUES (24, 74, 1);
INSERT INTO `user_role` VALUES (25, 74, 2);
INSERT INTO `user_role` VALUES (26, 75, 1);
INSERT INTO `user_role` VALUES (27, 75, 2);

SET FOREIGN_KEY_CHECKS = 1;
