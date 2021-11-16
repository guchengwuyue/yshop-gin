/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : yshop_go

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 16/11/2021 16:16:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for casbin_rule
-- ----------------------------
DROP TABLE IF EXISTS `casbin_rule`;
CREATE TABLE `casbin_rule` (
  `p_type` varchar(100) DEFAULT NULL,
  `v0` varchar(100) DEFAULT NULL,
  `v1` varchar(100) DEFAULT NULL,
  `v2` varchar(100) DEFAULT NULL,
  `v3` varchar(100) DEFAULT NULL,
  `v4` varchar(100) DEFAULT NULL,
  `v5` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of casbin_rule
-- ----------------------------
BEGIN;
INSERT INTO `casbin_rule` VALUES ('p', '22', '/admin/user', 'get', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '22', '/admin/user', 'post', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '22', '/admin/user', 'put', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '22', '/admin/user', 'delete', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '22', '/admin/auth/logout', 'delete', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '22', '/admin/user/updateAvatar', 'post', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '22', '/admin/auth/info', 'get', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '22', '/admin/roles', 'get', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '22', '/admin/roles', 'post', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '22', '/admin/roles', 'put', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '22', '/admin/roles/*', 'get', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '22', '/admin/roles/menu', 'put', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '22', '/admin/menu/tree', 'get', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '22', '/admin/roles', 'delete', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '22', '/admin/menu', 'get', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '22', '/admin/menu', 'post', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '22', '/admin/menu', 'put', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '22', '/admin/menu', 'delete', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '22', '/admin/dept', 'get', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '22', '/admin/dept', 'post', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '22', '/admin/dept', 'delete', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '22', '/admin/job', 'get', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '22', '/admin/job', 'post', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '22', '/admin/job', 'put', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '22', '/admin/job', 'delete', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '22', '/admin/dict', 'get', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '22', '/admin/dict', 'post', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '22', '/admin/dict', 'put', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '22', '/admin/dict', 'delete', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', 'common', '/admin/dept', 'get', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', 'common', '/admin/dept', 'post', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', 'common', '/admin/dept', 'put', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', 'common', '/admin/dept', 'delete', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', 'common', '/admin/job', 'get', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', 'common', '/admin/job', 'post', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', 'common', '/admin/job', 'put', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', 'common', '/admin/job', 'delete', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', 'common', '/admin/dictDetail', 'get', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', 'common', '/admin/dictDetail', 'delete', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', 'common', '/admin/dictDetail', 'put', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', 'common', '/admin/dictDetail', 'post', '', '', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `pid` bigint NOT NULL COMMENT '上级部门',
  `enabled` tinyint(1) NOT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='部门';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (1, 'YSHOP', 0, 1, '2021-02-26 14:51:14', NULL, 0);
INSERT INTO `sys_dept` VALUES (2, '研发部', 7, 1, '2021-07-19 17:24:03', '2021-11-16 13:48:31', 0);
INSERT INTO `sys_dept` VALUES (5, '运维部', 7, 1, '2019-03-25 09:20:44', NULL, 0);
INSERT INTO `sys_dept` VALUES (6, '测试部', 8, 1, '2021-05-25 14:44:39', NULL, 0);
INSERT INTO `sys_dept` VALUES (7, '华南分部', 1, 1, '2019-03-25 11:04:50', '2021-11-13 13:23:00', 0);
INSERT INTO `sys_dept` VALUES (8, '华北分部', 1, 1, '2019-03-25 11:04:53', NULL, 0);
INSERT INTO `sys_dept` VALUES (11, '人事部', 8, 1, '2019-03-25 11:07:58', NULL, 0);
INSERT INTO `sys_dept` VALUES (12, '7773888', 1, 1, '2021-02-26 15:04:43', NULL, 1);
INSERT INTO `sys_dept` VALUES (13, '333', 1, 0, '2021-02-26 14:28:26', '2021-02-26 14:28:26', 1);
INSERT INTO `sys_dept` VALUES (14, '9922', 13, 1, '2021-02-26 15:05:05', '2021-02-26 14:29:17', 1);
INSERT INTO `sys_dept` VALUES (15, '44', 1, 1, '2021-05-25 14:42:26', '2021-05-25 14:42:26', 1);
INSERT INTO `sys_dept` VALUES (16, '111', 1, 1, '2021-09-05 15:55:42', '2021-09-05 15:55:42', 1);
INSERT INTO `sys_dept` VALUES (17, 'aaaa', 1, 0, '2021-11-11 16:56:57', '2021-11-16 14:28:33', 0);
INSERT INTO `sys_dept` VALUES (18, 'bbbb4', 17, 1, '2021-11-11 16:57:14', '2021-11-11 16:57:14', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='数据字典';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict` VALUES (1, 'user_status', '用户状态', '2019-10-27 20:31:36', NULL, 0);
INSERT INTO `sys_dict` VALUES (4, 'dept_status', '部门状态', '2019-10-27 20:31:36', '2021-11-13 13:25:35', 0);
INSERT INTO `sys_dict` VALUES (5, 'job_status', '岗位状态', '2019-10-27 20:31:36', NULL, 0);
INSERT INTO `sys_dict` VALUES (6, '33', '3', '2020-05-18 19:55:49', NULL, 1);
INSERT INTO `sys_dict` VALUES (16, 'force_update', '强制升级', '2020-12-09 11:13:21', NULL, 0);
INSERT INTO `sys_dict` VALUES (17, 'is_enable', '是否启用', '2020-12-10 12:02:57', NULL, 0);
INSERT INTO `sys_dict` VALUES (18, 'sex2', '性别', '2021-02-23 15:20:40', '2021-02-23 14:12:04', 0);
INSERT INTO `sys_dict` VALUES (19, 'sex4', '性别', '2021-02-23 15:20:20', '2021-02-23 14:14:29', 0);
INSERT INTO `sys_dict` VALUES (20, '4', '', '2021-07-19 17:22:47', '2021-05-25 14:48:05', 0);
INSERT INTO `sys_dict` VALUES (21, '6', '', '2021-07-19 16:25:15', '2021-07-19 16:25:15', 0);
INSERT INTO `sys_dict` VALUES (22, '7', '', '2021-07-19 16:26:43', '2021-07-19 16:26:43', 0);
INSERT INTO `sys_dict` VALUES (23, '7', '', '2021-07-19 16:44:01', '2021-11-12 13:22:00', 1);
INSERT INTO `sys_dict` VALUES (24, '7', '77', '2021-09-04 15:01:51', '2021-07-19 17:22:40', 0);
INSERT INTO `sys_dict` VALUES (25, 'ttt2', 'tttt', '2021-11-12 13:14:16', '2021-11-12 13:21:15', 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_detail
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_detail`;
CREATE TABLE `sys_dict_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典标签',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典值',
  `sort` int DEFAULT '0' COMMENT '排序',
  `dict_id` bigint DEFAULT NULL COMMENT '字典id',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '0',
  `dict_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK5tpkputc6d9nboxojdbgnpmyb` (`dict_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='数据字典详情';

-- ----------------------------
-- Records of sys_dict_detail
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_detail` VALUES (1, '激活', '1', 1, 1, '2021-03-04 13:48:42', NULL, 0, 'user_status');
INSERT INTO `sys_dict_detail` VALUES (2, '禁用', '0', 2, 1, '2021-03-04 13:48:49', '2021-11-13 13:25:40', 0, 'user_status');
INSERT INTO `sys_dict_detail` VALUES (3, '启用', '1', 1, 4, '2021-02-25 16:12:46', NULL, 0, 'dept_status');
INSERT INTO `sys_dict_detail` VALUES (4, '停用', '0', 2, 4, '2021-02-25 16:12:51', NULL, 0, 'dept_status');
INSERT INTO `sys_dict_detail` VALUES (5, '启用', '1', 1, 5, '2021-02-26 16:23:39', NULL, 0, 'job_status');
INSERT INTO `sys_dict_detail` VALUES (6, '停用', '0', 2, 5, '2021-02-26 16:23:46', NULL, 0, 'job_status');
INSERT INTO `sys_dict_detail` VALUES (20, '是', '1', 999, 16, '2020-12-09 11:41:30', NULL, 0, 'force_update');
INSERT INTO `sys_dict_detail` VALUES (21, '否', '0', 999, 16, '2020-12-09 11:41:36', NULL, 0, 'force_update');
INSERT INTO `sys_dict_detail` VALUES (22, '是', '1', 999, 17, '2021-02-25 15:32:00', NULL, 0, 'is_enable');
INSERT INTO `sys_dict_detail` VALUES (23, '否', '0', 999, 17, '2020-12-10 12:03:16', NULL, 0, 'is_enable');
INSERT INTO `sys_dict_detail` VALUES (35, '11133', '111', 999, 1, '2021-11-12 13:34:48', '2021-11-12 13:35:18', 1, 'user_status');
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `enabled` tinyint(1) NOT NULL COMMENT '岗位状态',
  `sort` bigint NOT NULL COMMENT '岗位排序',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKmvhj0rogastlctflsxf1d6k3i` (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='岗位';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` VALUES (8, '人事专员', 1, 3, 11, '2021-05-10 14:41:48', NULL, 0);
INSERT INTO `sys_job` VALUES (10, '产品经理', 1, 4, 2, '2019-03-29 14:55:51', '2021-11-13 13:25:29', 0);
INSERT INTO `sys_job` VALUES (11, '全栈开发2', 1, 2, 2, '2019-03-31 13:39:30', NULL, 0);
INSERT INTO `sys_job` VALUES (12, '软件测试', 1, 5, 2, '2019-03-31 13:39:43', '2021-11-16 14:29:40', 0);
INSERT INTO `sys_job` VALUES (13, '6665', 1, 0, 1, '2021-03-02 15:45:16', '2021-03-02 15:42:55', 1);
INSERT INTO `sys_job` VALUES (14, '99', 1, 0, 5, '2021-03-02 15:44:05', '2021-03-02 15:44:05', 1);
INSERT INTO `sys_job` VALUES (15, 'ttttt5', 1, 999, 2, '2021-11-12 12:41:05', '2021-11-12 12:41:05', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `request_ip` varchar(255) DEFAULT NULL,
  `time` bigint DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `type` int DEFAULT '0',
  `uid` bigint DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1600 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_log` VALUES (140, '2021-09-04 14:47:08', '', 'get', '127.0.0.1', 3378, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-04 14:47:08', 0);
INSERT INTO `sys_log` VALUES (141, '2021-09-04 14:47:24', '部门管理', 'get', '127.0.0.1', 892, 'admin', '/admin/dept', '', 0, 1, '2021-09-04 14:47:24', 0);
INSERT INTO `sys_log` VALUES (142, '2021-09-04 14:47:24', '字典详情列表', 'get', '127.0.0.1', 7843, 'admin', '/admin/dictDetail', '', 0, 1, '2021-09-04 14:47:24', 0);
INSERT INTO `sys_log` VALUES (143, '2021-09-04 14:47:27', '部门管理', 'get', '127.0.0.1', 727, 'admin', '/admin/dept', '', 0, 1, '2021-09-04 14:47:27', 0);
INSERT INTO `sys_log` VALUES (144, '2021-09-04 14:47:36', '字典详情列表', 'get', '127.0.0.1', 679, 'admin', '/admin/dictDetail', '', 0, 1, '2021-09-04 14:47:36', 0);
INSERT INTO `sys_log` VALUES (145, '2021-09-04 14:47:36', '岗位管理', 'get', '127.0.0.1', 10488, 'admin', '/admin/job', '', 0, 1, '2021-09-04 14:47:36', 0);
INSERT INTO `sys_log` VALUES (146, '2021-09-04 14:47:39', '部门管理', 'get', '127.0.0.1', 563, 'admin', '/admin/dept', '', 0, 1, '2021-09-04 14:47:39', 0);
INSERT INTO `sys_log` VALUES (147, '2021-09-04 14:55:29', '', 'get', '127.0.0.1', 3719, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-04 14:55:29', 0);
INSERT INTO `sys_log` VALUES (148, '2021-09-04 14:56:43', '', 'post', '127.0.0.1', 1556, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-04 14:56:43', 0);
INSERT INTO `sys_log` VALUES (149, '2021-09-04 14:56:43', '', 'get', '127.0.0.1', 647, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-04 14:56:43', 0);
INSERT INTO `sys_log` VALUES (150, '2021-09-04 14:58:36', '', 'get', '127.0.0.1', 489, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-04 14:58:36', 0);
INSERT INTO `sys_log` VALUES (151, '2021-09-04 14:59:06', '', 'post', '127.0.0.1', 5428, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-04 14:59:06', 0);
INSERT INTO `sys_log` VALUES (152, '2021-09-04 14:59:06', '', 'get', '127.0.0.1', 540, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-04 14:59:06', 0);
INSERT INTO `sys_log` VALUES (153, '2021-09-04 14:59:20', '', 'put', '127.0.0.1', 2985, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-04 14:59:20', 0);
INSERT INTO `sys_log` VALUES (154, '2021-09-04 14:59:28', '', 'post', '127.0.0.1', 918, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-04 14:59:28', 0);
INSERT INTO `sys_log` VALUES (155, '2021-09-04 14:59:28', '', 'get', '127.0.0.1', 454, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-04 14:59:28', 0);
INSERT INTO `sys_log` VALUES (156, '2021-09-04 15:00:41', '用户个人信息', 'get', '127.0.0.1', 487, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-04 15:00:41', 0);
INSERT INTO `sys_log` VALUES (157, '2021-09-04 15:00:41', '', 'get', '127.0.0.1', 1724, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-04 15:00:41', 0);
INSERT INTO `sys_log` VALUES (158, '2021-09-04 15:00:41', '字典详情列表', 'get', '127.0.0.1', 3408, 'admin', '/admin/dictDetail', '', 0, 1, '2021-09-04 15:00:41', 0);
INSERT INTO `sys_log` VALUES (159, '2021-09-04 15:00:41', '岗位管理', 'get', '127.0.0.1', 4928, 'admin', '/admin/job', '', 0, 1, '2021-09-04 15:00:41', 0);
INSERT INTO `sys_log` VALUES (160, '2021-09-04 15:00:44', '部门管理', 'get', '127.0.0.1', 612, 'admin', '/admin/dept', '', 0, 1, '2021-09-04 15:00:44', 0);
INSERT INTO `sys_log` VALUES (161, '2021-09-04 15:00:49', '菜单管理', 'get', '127.0.0.1', 1211, 'admin', '/admin/menu', '', 0, 1, '2021-09-04 15:00:49', 0);
INSERT INTO `sys_log` VALUES (162, '2021-09-04 15:00:50', '操作日志', 'get', '127.0.0.1', 935, 'admin', '/admin/logs', '', 0, 1, '2021-09-04 15:00:50', 0);
INSERT INTO `sys_log` VALUES (163, '2021-09-04 15:00:53', '字典详情列表', 'get', '127.0.0.1', 639, 'admin', '/admin/dictDetail', '', 0, 1, '2021-09-04 15:00:53', 0);
INSERT INTO `sys_log` VALUES (164, '2021-09-04 15:00:53', '岗位管理', 'get', '127.0.0.1', 3428, 'admin', '/admin/job', '', 0, 1, '2021-09-04 15:00:53', 0);
INSERT INTO `sys_log` VALUES (165, '2021-09-04 15:00:55', '字典管理', 'get', '127.0.0.1', 6018, 'admin', '/admin/dict', '', 0, 1, '2021-09-04 15:00:55', 0);
INSERT INTO `sys_log` VALUES (166, '2021-09-04 15:01:05', '字典详情列表', 'get', '127.0.0.1', 4096, 'admin', '/admin/dictDetail', '', 0, 1, '2021-09-04 15:01:05', 0);
INSERT INTO `sys_log` VALUES (167, '2021-09-04 15:01:21', '字典详情列表', 'get', '127.0.0.1', 574, 'admin', '/admin/dictDetail', '', 0, 1, '2021-09-04 15:01:21', 0);
INSERT INTO `sys_log` VALUES (168, '2021-09-04 15:01:44', '字典详情列表', 'get', '127.0.0.1', 566, 'admin', '/admin/dictDetail', '', 0, 1, '2021-09-04 15:01:44', 0);
INSERT INTO `sys_log` VALUES (169, '2021-09-04 15:01:45', '字典编辑', 'put', '127.0.0.1', 1415, 'admin', '/admin/dict', '', 0, 1, '2021-09-04 15:01:45', 0);
INSERT INTO `sys_log` VALUES (170, '2021-09-04 15:01:51', '字典编辑', 'put', '127.0.0.1', 1078, 'admin', '/admin/dict', '', 0, 1, '2021-09-04 15:01:51', 0);
INSERT INTO `sys_log` VALUES (171, '2021-09-04 15:01:51', '字典管理', 'get', '127.0.0.1', 719, 'admin', '/admin/dict', '', 0, 1, '2021-09-04 15:01:51', 0);
INSERT INTO `sys_log` VALUES (172, '2021-09-04 15:01:58', '字典详情列表', 'get', '127.0.0.1', 486, 'admin', '/admin/dictDetail', '', 0, 1, '2021-09-04 15:01:58', 0);
INSERT INTO `sys_log` VALUES (173, '2021-09-04 15:10:04', '', 'delete', '127.0.0.1', 236, 'admin', '/admin/materialgroup/*', '', 0, 1, '2021-09-04 15:10:04', 0);
INSERT INTO `sys_log` VALUES (174, '2021-09-04 15:11:37', '', 'delete', '127.0.0.1', 290, 'admin', '/admin/materialgroup/*', '', 0, 1, '2021-09-04 15:11:37', 0);
INSERT INTO `sys_log` VALUES (175, '2021-09-04 15:12:08', '', 'delete', '127.0.0.1', 902, 'admin', '/admin/materialgroup/*', '', 0, 1, '2021-09-04 15:12:08', 0);
INSERT INTO `sys_log` VALUES (176, '2021-09-04 15:22:28', '', 'get', '127.0.0.1', 635, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-04 15:22:28', 0);
INSERT INTO `sys_log` VALUES (177, '2021-09-04 15:22:28', '', 'get', '127.0.0.1', 3663, 'admin', '/admin/material', '', 0, 1, '2021-09-04 15:22:28', 0);
INSERT INTO `sys_log` VALUES (178, '2021-09-04 15:22:30', '', 'get', '127.0.0.1', 317, 'admin', '/admin/material', '', 0, 1, '2021-09-04 15:22:30', 0);
INSERT INTO `sys_log` VALUES (179, '2021-09-04 15:24:31', '', 'get', '127.0.0.1', 465, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-04 15:24:31', 0);
INSERT INTO `sys_log` VALUES (180, '2021-09-04 15:24:31', '', 'get', '127.0.0.1', 418, 'admin', '/admin/material', '', 0, 1, '2021-09-04 15:24:31', 0);
INSERT INTO `sys_log` VALUES (181, '2021-09-04 15:24:33', '', 'get', '127.0.0.1', 427, 'admin', '/admin/material', '', 0, 1, '2021-09-04 15:24:33', 0);
INSERT INTO `sys_log` VALUES (182, '2021-09-04 15:26:11', '', 'get', '127.0.0.1', 483, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-04 15:26:11', 0);
INSERT INTO `sys_log` VALUES (183, '2021-09-04 15:26:11', '', 'get', '127.0.0.1', 883, 'admin', '/admin/material', '', 0, 1, '2021-09-04 15:26:11', 0);
INSERT INTO `sys_log` VALUES (184, '2021-09-04 15:26:12', '', 'get', '127.0.0.1', 623, 'admin', '/admin/material', '', 0, 1, '2021-09-04 15:26:12', 0);
INSERT INTO `sys_log` VALUES (185, '2021-09-04 15:27:15', '用户个人信息', 'get', '127.0.0.1', 741, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-04 15:27:15', 0);
INSERT INTO `sys_log` VALUES (186, '2021-09-04 15:27:25', '用户头像', 'post', '127.0.0.1', 6894, 'admin', '/admin/user/updateAvatar', '', 0, 1, '2021-09-04 15:27:25', 0);
INSERT INTO `sys_log` VALUES (187, '2021-09-04 15:27:25', '用户个人信息', 'get', '127.0.0.1', 578, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-04 15:27:25', 0);
INSERT INTO `sys_log` VALUES (188, '2021-09-04 15:27:37', '用户个人信息', 'get', '127.0.0.1', 394, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-04 15:27:37', 0);
INSERT INTO `sys_log` VALUES (189, '2021-09-04 15:27:37', '', 'get', '127.0.0.1', 2649, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-04 15:27:37', 0);
INSERT INTO `sys_log` VALUES (190, '2021-09-04 15:27:37', '用户个人信息', 'get', '127.0.0.1', 750, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-04 15:27:37', 0);
INSERT INTO `sys_log` VALUES (191, '2021-09-04 15:28:19', '用户头像', 'post', '127.0.0.1', 5511, 'admin', '/admin/user/updateAvatar', '', 0, 1, '2021-09-04 15:28:19', 0);
INSERT INTO `sys_log` VALUES (192, '2021-09-04 15:28:19', '用户个人信息', 'get', '127.0.0.1', 377, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-04 15:28:19', 0);
INSERT INTO `sys_log` VALUES (193, '2021-09-04 15:33:07', '用户头像', 'post', '127.0.0.1', 6173, 'admin', '/admin/user/updateAvatar', '', 0, 1, '2021-09-04 15:33:07', 0);
INSERT INTO `sys_log` VALUES (194, '2021-09-04 15:33:07', '用户个人信息', 'get', '127.0.0.1', 378, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-04 15:33:07', 0);
INSERT INTO `sys_log` VALUES (195, '2021-09-04 15:33:09', '用户个人信息', 'get', '127.0.0.1', 351, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-04 15:33:09', 0);
INSERT INTO `sys_log` VALUES (196, '2021-09-04 15:33:09', '', 'get', '127.0.0.1', 2205, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-04 15:33:09', 0);
INSERT INTO `sys_log` VALUES (197, '2021-09-04 15:33:10', '用户个人信息', 'get', '127.0.0.1', 429, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-04 15:33:10', 0);
INSERT INTO `sys_log` VALUES (198, '2021-09-04 15:34:08', '用户个人信息', 'get', '127.0.0.1', 356, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-04 15:34:08', 0);
INSERT INTO `sys_log` VALUES (199, '2021-09-04 15:56:52', '用户个人信息', 'get', '127.0.0.1', 919, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-04 15:56:52', 0);
INSERT INTO `sys_log` VALUES (200, '2021-09-04 15:56:52', '用户个人信息', 'get', '127.0.0.1', 1983, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-04 15:56:52', 0);
INSERT INTO `sys_log` VALUES (201, '2021-09-04 15:56:52', '', 'get', '127.0.0.1', 2912, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-04 15:56:52', 0);
INSERT INTO `sys_log` VALUES (202, '2021-09-04 15:56:52', '', 'get', '127.0.0.1', 18248, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-04 15:56:52', 0);
INSERT INTO `sys_log` VALUES (203, '2021-09-04 15:56:52', '用户个人信息', 'get', '127.0.0.1', 1121, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-04 15:56:52', 0);
INSERT INTO `sys_log` VALUES (204, '2021-09-04 15:56:52', '字典详情列表', 'get', '127.0.0.1', 732, 'admin', '/admin/dictDetail', '', 0, 1, '2021-09-04 15:56:52', 0);
INSERT INTO `sys_log` VALUES (205, '2021-09-04 15:56:52', '岗位管理', 'get', '127.0.0.1', 2205, 'admin', '/admin/job', '', 0, 1, '2021-09-04 15:56:52', 0);
INSERT INTO `sys_log` VALUES (206, '2021-09-04 15:57:57', '部门管理', 'get', '127.0.0.1', 535, 'admin', '/admin/dept', '', 0, 1, '2021-09-04 15:57:57', 0);
INSERT INTO `sys_log` VALUES (207, '2021-09-04 15:57:59', '', 'get', '127.0.0.1', 575, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-04 15:57:59', 0);
INSERT INTO `sys_log` VALUES (208, '2021-09-04 15:57:59', '', 'get', '127.0.0.1', 1430, 'admin', '/admin/material', '', 0, 1, '2021-09-04 15:57:59', 0);
INSERT INTO `sys_log` VALUES (209, '2021-09-04 16:04:41', '用户头像', 'post', '127.0.0.1', 556, 'admin', '/admin/user/updateAvatar', '', 0, 1, '2021-09-04 16:04:41', 0);
INSERT INTO `sys_log` VALUES (210, '2021-09-04 16:06:33', '用户头像', 'post', '127.0.0.1', 7098, 'admin', '/admin/user/updateAvatar', '', 0, 1, '2021-09-04 16:06:33', 0);
INSERT INTO `sys_log` VALUES (211, '2021-09-04 16:06:33', '用户个人信息', 'get', '127.0.0.1', 700, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-04 16:06:33', 0);
INSERT INTO `sys_log` VALUES (212, '2021-09-04 16:10:07', '用户个人信息', 'get', '127.0.0.1', 626, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-04 16:10:07', 0);
INSERT INTO `sys_log` VALUES (213, '2021-09-04 16:10:07', '', 'get', '127.0.0.1', 6451, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-04 16:10:07', 0);
INSERT INTO `sys_log` VALUES (214, '2021-09-04 16:10:07', '用户个人信息', 'get', '127.0.0.1', 470, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-04 16:10:07', 0);
INSERT INTO `sys_log` VALUES (215, '2021-09-04 16:10:07', '', 'get', '127.0.0.1', 2250, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-04 16:10:07', 0);
INSERT INTO `sys_log` VALUES (216, '2021-09-04 16:10:07', '用户个人信息', 'get', '127.0.0.1', 2001, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-04 16:10:07', 0);
INSERT INTO `sys_log` VALUES (217, '2021-09-04 16:10:07', '字典详情列表', 'get', '127.0.0.1', 747, 'admin', '/admin/dictDetail', '', 0, 1, '2021-09-04 16:10:07', 0);
INSERT INTO `sys_log` VALUES (218, '2021-09-04 16:10:07', '岗位管理', 'get', '127.0.0.1', 1955, 'admin', '/admin/job', '', 0, 1, '2021-09-04 16:10:07', 0);
INSERT INTO `sys_log` VALUES (219, '2021-09-04 16:10:15', '部门管理', 'get', '127.0.0.1', 687, 'admin', '/admin/dept', '', 0, 1, '2021-09-04 16:10:15', 0);
INSERT INTO `sys_log` VALUES (220, '2021-09-04 16:10:16', '', 'get', '127.0.0.1', 491, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-04 16:10:16', 0);
INSERT INTO `sys_log` VALUES (221, '2021-09-04 16:10:16', '', 'get', '127.0.0.1', 662, 'admin', '/admin/material', '', 0, 1, '2021-09-04 16:10:16', 0);
INSERT INTO `sys_log` VALUES (222, '2021-09-04 16:16:04', '', 'get', '127.0.0.1', 655, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-04 16:16:04', 0);
INSERT INTO `sys_log` VALUES (223, '2021-09-04 16:23:30', '', 'get', '127.0.0.1', 784, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-04 16:23:30', 0);
INSERT INTO `sys_log` VALUES (224, '2021-09-04 16:25:34', '', 'delete', '127.0.0.1', 210, 'admin', '/admin/material/*', '', 0, 1, '2021-09-04 16:25:34', 0);
INSERT INTO `sys_log` VALUES (225, '2021-09-04 16:28:48', '', 'delete', '127.0.0.1', 257, 'admin', '/admin/material/*', '', 0, 1, '2021-09-04 16:28:48', 0);
INSERT INTO `sys_log` VALUES (226, '2021-09-04 16:29:39', '', 'delete', '127.0.0.1', 5397, 'admin', '/admin/material/*', '', 0, 1, '2021-09-04 16:29:39', 0);
INSERT INTO `sys_log` VALUES (227, '2021-09-04 16:40:58', '部门管理', 'get', '127.0.0.1', 441, 'admin', '/admin/dept', '', 0, 1, '2021-09-04 16:40:58', 0);
INSERT INTO `sys_log` VALUES (228, '2021-09-05 14:36:04', '', 'get', '127.0.0.1', 4520, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-05 14:36:04', 0);
INSERT INTO `sys_log` VALUES (229, '2021-09-05 14:38:03', '菜单管理', 'get', '127.0.0.1', 2061, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 14:38:03', 0);
INSERT INTO `sys_log` VALUES (230, '2021-09-05 14:48:01', '角色菜单数', 'get', '127.0.0.1', 1942, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-05 14:48:01', 0);
INSERT INTO `sys_log` VALUES (231, '2021-09-05 14:48:36', '用户个人信息', 'get', '127.0.0.1', 459, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-05 14:48:36', 0);
INSERT INTO `sys_log` VALUES (232, '2021-09-05 14:48:36', '', 'get', '127.0.0.1', 1493, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-05 14:48:36', 0);
INSERT INTO `sys_log` VALUES (233, '2021-09-05 14:48:36', '菜单管理', 'get', '127.0.0.1', 1297, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 14:48:36', 0);
INSERT INTO `sys_log` VALUES (234, '2021-09-05 14:48:40', '角色菜单数', 'get', '127.0.0.1', 1206, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-05 14:48:40', 0);
INSERT INTO `sys_log` VALUES (235, '2021-09-05 14:49:16', '角色菜单数', 'get', '127.0.0.1', 1327, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-05 14:49:16', 0);
INSERT INTO `sys_log` VALUES (236, '2021-09-05 14:49:59', '菜单新增', 'post', '127.0.0.1', 5714, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 14:49:59', 0);
INSERT INTO `sys_log` VALUES (237, '2021-09-05 14:49:59', '菜单管理', 'get', '127.0.0.1', 1255, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 14:49:59', 0);
INSERT INTO `sys_log` VALUES (238, '2021-09-05 14:50:11', '角色菜单数', 'get', '127.0.0.1', 1758, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-05 14:50:11', 0);
INSERT INTO `sys_log` VALUES (239, '2021-09-05 14:50:42', '角色菜单数', 'get', '127.0.0.1', 1064, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-05 14:50:42', 0);
INSERT INTO `sys_log` VALUES (240, '2021-09-05 14:52:26', '菜单新增', 'post', '127.0.0.1', 5562, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 14:52:26', 0);
INSERT INTO `sys_log` VALUES (241, '2021-09-05 14:52:26', '菜单管理', 'get', '127.0.0.1', 2002, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 14:52:26', 0);
INSERT INTO `sys_log` VALUES (242, '2021-09-05 14:52:29', '角色菜单数', 'get', '127.0.0.1', 1806, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-05 14:52:29', 0);
INSERT INTO `sys_log` VALUES (243, '2021-09-05 14:53:01', '角色菜单数', 'get', '127.0.0.1', 1159, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-05 14:53:01', 0);
INSERT INTO `sys_log` VALUES (244, '2021-09-05 14:55:13', '菜单新增', 'post', '127.0.0.1', 1021, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 14:55:13', 0);
INSERT INTO `sys_log` VALUES (245, '2021-09-05 14:55:13', '菜单管理', 'get', '127.0.0.1', 1344, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 14:55:13', 0);
INSERT INTO `sys_log` VALUES (246, '2021-09-05 14:55:15', '角色菜单数', 'get', '127.0.0.1', 1497, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-05 14:55:15', 0);
INSERT INTO `sys_log` VALUES (247, '2021-09-05 14:56:07', '菜单编辑', 'put', '127.0.0.1', 1790, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 14:56:07', 0);
INSERT INTO `sys_log` VALUES (248, '2021-09-05 14:56:07', '菜单管理', 'get', '127.0.0.1', 1204, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 14:56:07', 0);
INSERT INTO `sys_log` VALUES (249, '2021-09-05 14:56:28', '角色菜单数', 'get', '127.0.0.1', 1071, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-05 14:56:28', 0);
INSERT INTO `sys_log` VALUES (250, '2021-09-05 14:56:34', '角色菜单数', 'get', '127.0.0.1', 1307, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-05 14:56:34', 0);
INSERT INTO `sys_log` VALUES (251, '2021-09-05 14:56:54', '角色菜单数', 'get', '127.0.0.1', 1098, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-05 14:56:54', 0);
INSERT INTO `sys_log` VALUES (252, '2021-09-05 14:57:07', '菜单编辑', 'put', '127.0.0.1', 989, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 14:57:07', 0);
INSERT INTO `sys_log` VALUES (253, '2021-09-05 14:57:07', '菜单管理', 'get', '127.0.0.1', 1100, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 14:57:07', 0);
INSERT INTO `sys_log` VALUES (254, '2021-09-05 14:57:20', '角色菜单数', 'get', '127.0.0.1', 1081, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-05 14:57:20', 0);
INSERT INTO `sys_log` VALUES (255, '2021-09-05 14:57:31', '角色菜单数', 'get', '127.0.0.1', 1180, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-05 14:57:31', 0);
INSERT INTO `sys_log` VALUES (256, '2021-09-05 14:57:35', '角色菜单数', 'get', '127.0.0.1', 1166, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-05 14:57:35', 0);
INSERT INTO `sys_log` VALUES (257, '2021-09-05 14:57:39', '菜单编辑', 'put', '127.0.0.1', 1067, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 14:57:39', 0);
INSERT INTO `sys_log` VALUES (258, '2021-09-05 14:57:39', '菜单管理', 'get', '127.0.0.1', 1184, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 14:57:39', 0);
INSERT INTO `sys_log` VALUES (259, '2021-09-05 14:57:43', '角色菜单数', 'get', '127.0.0.1', 1115, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-05 14:57:43', 0);
INSERT INTO `sys_log` VALUES (260, '2021-09-05 14:57:50', '角色菜单数', 'get', '127.0.0.1', 1106, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-05 14:57:50', 0);
INSERT INTO `sys_log` VALUES (261, '2021-09-05 14:57:54', '菜单新增', 'post', '127.0.0.1', 1101, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 14:57:54', 0);
INSERT INTO `sys_log` VALUES (262, '2021-09-05 14:57:54', '菜单管理', 'get', '127.0.0.1', 1199, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 14:57:54', 0);
INSERT INTO `sys_log` VALUES (263, '2021-09-05 14:57:55', '角色菜单数', 'get', '127.0.0.1', 1651, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-05 14:57:55', 0);
INSERT INTO `sys_log` VALUES (264, '2021-09-05 14:58:24', '菜单新增', 'post', '127.0.0.1', 1109, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 14:58:24', 0);
INSERT INTO `sys_log` VALUES (265, '2021-09-05 14:58:24', '菜单管理', 'get', '127.0.0.1', 1525, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 14:58:24', 0);
INSERT INTO `sys_log` VALUES (266, '2021-09-05 14:59:54', '用户个人信息', 'get', '127.0.0.1', 387, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-05 14:59:54', 0);
INSERT INTO `sys_log` VALUES (267, '2021-09-05 14:59:54', '', 'get', '127.0.0.1', 3577, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-05 14:59:54', 0);
INSERT INTO `sys_log` VALUES (268, '2021-09-05 14:59:55', '菜单管理', 'get', '127.0.0.1', 2341, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 14:59:55', 0);
INSERT INTO `sys_log` VALUES (269, '2021-09-05 15:00:05', '角色菜单数', 'get', '127.0.0.1', 1824, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-05 15:00:05', 0);
INSERT INTO `sys_log` VALUES (270, '2021-09-05 15:00:05', '角色管理', 'get', '127.0.0.1', 5956, 'admin', '/admin/roles', '', 0, 1, '2021-09-05 15:00:05', 0);
INSERT INTO `sys_log` VALUES (271, '2021-09-05 15:00:05', '角色管理', 'get', '127.0.0.1', 4611, 'admin', '/admin/roles', '', 0, 1, '2021-09-05 15:00:05', 0);
INSERT INTO `sys_log` VALUES (272, '2021-09-05 15:00:13', '角色菜单保存', 'put', '127.0.0.1', 4549, 'admin', '/admin/roles/menu', '', 0, 1, '2021-09-05 15:00:13', 0);
INSERT INTO `sys_log` VALUES (273, '2021-09-05 15:00:13', '单个角色', 'get', '127.0.0.1', 6347, 'admin', '/admin/roles/*', '', 0, 1, '2021-09-05 15:00:13', 0);
INSERT INTO `sys_log` VALUES (274, '2021-09-05 15:00:16', '用户个人信息', 'get', '127.0.0.1', 449, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-05 15:00:16', 0);
INSERT INTO `sys_log` VALUES (275, '2021-09-05 15:00:16', '', 'get', '127.0.0.1', 4083, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-05 15:00:16', 0);
INSERT INTO `sys_log` VALUES (276, '2021-09-05 15:00:17', '角色菜单数', 'get', '127.0.0.1', 1558, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-05 15:00:17', 0);
INSERT INTO `sys_log` VALUES (277, '2021-09-05 15:00:17', '角色管理', 'get', '127.0.0.1', 7160, 'admin', '/admin/roles', '', 0, 1, '2021-09-05 15:00:17', 0);
INSERT INTO `sys_log` VALUES (278, '2021-09-05 15:00:17', '角色管理', 'get', '127.0.0.1', 6014, 'admin', '/admin/roles', '', 0, 1, '2021-09-05 15:00:17', 0);
INSERT INTO `sys_log` VALUES (279, '2021-09-05 15:00:25', '菜单管理', 'get', '127.0.0.1', 1223, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 15:00:25', 0);
INSERT INTO `sys_log` VALUES (280, '2021-09-05 15:00:27', '角色菜单数', 'get', '127.0.0.1', 1291, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-05 15:00:27', 0);
INSERT INTO `sys_log` VALUES (281, '2021-09-05 15:00:33', '菜单编辑', 'put', '127.0.0.1', 5506, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 15:00:33', 0);
INSERT INTO `sys_log` VALUES (282, '2021-09-05 15:00:33', '菜单管理', 'get', '127.0.0.1', 1568, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 15:00:33', 0);
INSERT INTO `sys_log` VALUES (283, '2021-09-05 15:00:35', '用户个人信息', 'get', '127.0.0.1', 325, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-05 15:00:35', 0);
INSERT INTO `sys_log` VALUES (284, '2021-09-05 15:00:35', '', 'get', '127.0.0.1', 2843, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-05 15:00:35', 0);
INSERT INTO `sys_log` VALUES (285, '2021-09-05 15:00:36', '菜单管理', 'get', '127.0.0.1', 1508, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 15:00:36', 0);
INSERT INTO `sys_log` VALUES (286, '2021-09-05 15:02:53', '用户个人信息', 'get', '127.0.0.1', 390, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-05 15:02:53', 0);
INSERT INTO `sys_log` VALUES (287, '2021-09-05 15:02:53', '', 'get', '127.0.0.1', 5331, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-05 15:02:53', 0);
INSERT INTO `sys_log` VALUES (288, '2021-09-05 15:02:53', '菜单管理', 'get', '127.0.0.1', 2734, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 15:02:53', 0);
INSERT INTO `sys_log` VALUES (289, '2021-09-05 15:03:09', '角色菜单数', 'get', '127.0.0.1', 1425, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-05 15:03:09', 0);
INSERT INTO `sys_log` VALUES (290, '2021-09-05 15:03:09', '角色管理', 'get', '127.0.0.1', 7008, 'admin', '/admin/roles', '', 0, 1, '2021-09-05 15:03:09', 0);
INSERT INTO `sys_log` VALUES (291, '2021-09-05 15:03:09', '角色管理', 'get', '127.0.0.1', 8616, 'admin', '/admin/roles', '', 0, 1, '2021-09-05 15:03:09', 0);
INSERT INTO `sys_log` VALUES (292, '2021-09-05 15:03:15', '角色菜单保存', 'put', '127.0.0.1', 6131, 'admin', '/admin/roles/menu', '', 0, 1, '2021-09-05 15:03:15', 0);
INSERT INTO `sys_log` VALUES (293, '2021-09-05 15:03:15', '单个角色', 'get', '127.0.0.1', 1725, 'admin', '/admin/roles/*', '', 0, 1, '2021-09-05 15:03:15', 0);
INSERT INTO `sys_log` VALUES (294, '2021-09-05 15:03:17', '用户个人信息', 'get', '127.0.0.1', 328, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-05 15:03:17', 0);
INSERT INTO `sys_log` VALUES (295, '2021-09-05 15:03:17', '', 'get', '127.0.0.1', 2319, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-05 15:03:17', 0);
INSERT INTO `sys_log` VALUES (296, '2021-09-05 15:03:18', '角色菜单数', 'get', '127.0.0.1', 1541, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-05 15:03:18', 0);
INSERT INTO `sys_log` VALUES (297, '2021-09-05 15:03:18', '角色管理', 'get', '127.0.0.1', 6835, 'admin', '/admin/roles', '', 0, 1, '2021-09-05 15:03:18', 0);
INSERT INTO `sys_log` VALUES (298, '2021-09-05 15:03:18', '角色管理', 'get', '127.0.0.1', 4821, 'admin', '/admin/roles', '', 0, 1, '2021-09-05 15:03:18', 0);
INSERT INTO `sys_log` VALUES (299, '2021-09-05 15:03:39', '用户管理', 'get', '127.0.0.1', 8467, 'admin', '/admin/user', '', 0, 1, '2021-09-05 15:03:39', 0);
INSERT INTO `sys_log` VALUES (300, '2021-09-05 15:03:39', '部门管理', 'get', '127.0.0.1', 1970, 'admin', '/admin/dept', '', 0, 1, '2021-09-05 15:03:39', 0);
INSERT INTO `sys_log` VALUES (301, '2021-09-05 15:03:39', '字典详情列表', 'get', '127.0.0.1', 21368, 'admin', '/admin/dictDetail', '', 0, 1, '2021-09-05 15:03:39', 0);
INSERT INTO `sys_log` VALUES (302, '2021-09-05 15:03:39', '用户管理', 'get', '127.0.0.1', 13157, 'admin', '/admin/user', '', 0, 1, '2021-09-05 15:03:39', 0);
INSERT INTO `sys_log` VALUES (303, '2021-09-05 15:06:11', '菜单管理', 'get', '127.0.0.1', 621, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 15:06:11', 0);
INSERT INTO `sys_log` VALUES (304, '2021-09-05 15:07:24', '菜单管理', 'get', '127.0.0.1', 2545, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 15:07:24', 0);
INSERT INTO `sys_log` VALUES (305, '2021-09-05 15:07:35', '角色菜单数', 'get', '127.0.0.1', 1546, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-05 15:07:35', 0);
INSERT INTO `sys_log` VALUES (306, '2021-09-05 15:07:42', '菜单编辑', 'put', '127.0.0.1', 1541, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 15:07:42', 0);
INSERT INTO `sys_log` VALUES (307, '2021-09-05 15:07:42', '菜单管理', 'get', '127.0.0.1', 1297, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 15:07:42', 0);
INSERT INTO `sys_log` VALUES (308, '2021-09-05 15:07:48', '角色菜单数', 'get', '127.0.0.1', 1470, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-05 15:07:48', 0);
INSERT INTO `sys_log` VALUES (309, '2021-09-05 15:07:54', '菜单编辑', 'put', '127.0.0.1', 1453, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 15:07:54', 0);
INSERT INTO `sys_log` VALUES (310, '2021-09-05 15:07:54', '菜单管理', 'get', '127.0.0.1', 1567, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 15:07:54', 0);
INSERT INTO `sys_log` VALUES (311, '2021-09-05 15:07:58', '用户个人信息', 'get', '127.0.0.1', 388, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-05 15:07:58', 0);
INSERT INTO `sys_log` VALUES (312, '2021-09-05 15:07:58', '', 'get', '127.0.0.1', 3662, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-05 15:07:58', 0);
INSERT INTO `sys_log` VALUES (313, '2021-09-05 15:07:58', '菜单管理', 'get', '127.0.0.1', 1400, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 15:07:58', 0);
INSERT INTO `sys_log` VALUES (314, '2021-09-05 15:10:37', '用户个人信息', 'get', '127.0.0.1', 630, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-05 15:10:37', 0);
INSERT INTO `sys_log` VALUES (315, '2021-09-05 15:10:37', '', 'get', '127.0.0.1', 3509, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-05 15:10:37', 0);
INSERT INTO `sys_log` VALUES (316, '2021-09-05 15:10:37', '菜单管理', 'get', '127.0.0.1', 4219, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 15:10:37', 0);
INSERT INTO `sys_log` VALUES (317, '2021-09-05 15:13:03', '菜单管理', 'get', '127.0.0.1', 1620, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 15:13:03', 0);
INSERT INTO `sys_log` VALUES (318, '2021-09-05 15:16:37', '用户个人信息', 'get', '127.0.0.1', 292, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-05 15:16:37', 0);
INSERT INTO `sys_log` VALUES (319, '2021-09-05 15:16:37', '', 'get', '127.0.0.1', 3107, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-05 15:16:37', 0);
INSERT INTO `sys_log` VALUES (320, '2021-09-05 15:18:20', '商品分类', 'get', '127.0.0.1', 506, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 15:18:20', 0);
INSERT INTO `sys_log` VALUES (321, '2021-09-05 15:19:55', '用户个人信息', 'get', '127.0.0.1', 1722, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-05 15:19:55', 0);
INSERT INTO `sys_log` VALUES (322, '2021-09-05 15:19:55', '', 'get', '127.0.0.1', 1951, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-05 15:19:55', 0);
INSERT INTO `sys_log` VALUES (323, '2021-09-05 15:19:55', '用户个人信息', 'get', '127.0.0.1', 397, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-05 15:19:55', 0);
INSERT INTO `sys_log` VALUES (324, '2021-09-05 15:19:55', '', 'get', '127.0.0.1', 3614, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-05 15:19:55', 0);
INSERT INTO `sys_log` VALUES (325, '2021-09-05 15:20:13', '用户个人信息', 'get', '127.0.0.1', 317, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-05 15:20:13', 0);
INSERT INTO `sys_log` VALUES (326, '2021-09-05 15:20:13', '', 'get', '127.0.0.1', 2350, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-05 15:20:13', 0);
INSERT INTO `sys_log` VALUES (327, '2021-09-05 15:20:20', '用户个人信息', 'get', '127.0.0.1', 337, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-05 15:20:20', 0);
INSERT INTO `sys_log` VALUES (328, '2021-09-05 15:20:20', '', 'get', '127.0.0.1', 2481, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-05 15:20:20', 0);
INSERT INTO `sys_log` VALUES (329, '2021-09-05 15:21:06', '字典详情列表', 'get', '127.0.0.1', 3112, 'admin', '/admin/dictDetail', '', 0, 1, '2021-09-05 15:21:06', 0);
INSERT INTO `sys_log` VALUES (330, '2021-09-05 15:21:06', '部门管理', 'get', '127.0.0.1', 774, 'admin', '/admin/dept', '', 0, 1, '2021-09-05 15:21:06', 0);
INSERT INTO `sys_log` VALUES (331, '2021-09-05 15:21:06', '用户管理', 'get', '127.0.0.1', 14552, 'admin', '/admin/user', '', 0, 1, '2021-09-05 15:21:06', 0);
INSERT INTO `sys_log` VALUES (332, '2021-09-05 15:21:06', '用户管理', 'get', '127.0.0.1', 8866, 'admin', '/admin/user', '', 0, 1, '2021-09-05 15:21:06', 0);
INSERT INTO `sys_log` VALUES (333, '2021-09-05 15:21:47', '用户个人信息', 'get', '127.0.0.1', 574, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-05 15:21:47', 0);
INSERT INTO `sys_log` VALUES (334, '2021-09-05 15:21:47', '', 'get', '127.0.0.1', 1759, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-05 15:21:47', 0);
INSERT INTO `sys_log` VALUES (335, '2021-09-05 15:49:52', '用户个人信息', 'get', '127.0.0.1', 386, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-05 15:49:52', 0);
INSERT INTO `sys_log` VALUES (336, '2021-09-05 15:49:52', '', 'get', '127.0.0.1', 3105, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-05 15:49:52', 0);
INSERT INTO `sys_log` VALUES (337, '2021-09-05 15:50:20', '用户个人信息', 'get', '127.0.0.1', 354, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-05 15:50:20', 0);
INSERT INTO `sys_log` VALUES (338, '2021-09-05 15:50:20', '', 'get', '127.0.0.1', 1548, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-05 15:50:20', 0);
INSERT INTO `sys_log` VALUES (339, '2021-09-05 15:50:32', '用户个人信息', 'get', '127.0.0.1', 309, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-05 15:50:32', 0);
INSERT INTO `sys_log` VALUES (340, '2021-09-05 15:50:32', '', 'get', '127.0.0.1', 2792, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-05 15:50:32', 0);
INSERT INTO `sys_log` VALUES (341, '2021-09-05 15:50:32', '菜单管理', 'get', '127.0.0.1', 1500, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 15:50:32', 0);
INSERT INTO `sys_log` VALUES (342, '2021-09-05 15:50:53', '用户退出', 'delete', '127.0.0.1', 242, 'admin', '/admin/auth/logout', '', 0, 1, '2021-09-05 15:50:53', 0);
INSERT INTO `sys_log` VALUES (343, '2021-09-05 15:51:20', '', 'get', '127.0.0.1', 1713, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-05 15:51:20', 0);
INSERT INTO `sys_log` VALUES (344, '2021-09-05 15:51:24', '商品分类', 'get', '127.0.0.1', 436, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 15:51:24', 0);
INSERT INTO `sys_log` VALUES (345, '2021-09-05 15:52:09', '商品分类', 'get', '127.0.0.1', 329, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 15:52:09', 0);
INSERT INTO `sys_log` VALUES (346, '2021-09-05 15:52:22', '', 'get', '127.0.0.1', 5936, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-05 15:52:22', 0);
INSERT INTO `sys_log` VALUES (347, '2021-09-05 15:52:54', '新增分类', 'post', '127.0.0.1', 2626, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 15:52:54', 0);
INSERT INTO `sys_log` VALUES (348, '2021-09-05 15:54:05', '新增分类', 'post', '127.0.0.1', 1073, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 15:54:05', 0);
INSERT INTO `sys_log` VALUES (349, '2021-09-05 15:54:05', '商品分类', 'get', '127.0.0.1', 438, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 15:54:05', 0);
INSERT INTO `sys_log` VALUES (350, '2021-09-05 15:54:27', '菜单管理', 'get', '127.0.0.1', 1145, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 15:54:27', 0);
INSERT INTO `sys_log` VALUES (351, '2021-09-05 15:54:37', '角色菜单数', 'get', '127.0.0.1', 1108, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-05 15:54:37', 0);
INSERT INTO `sys_log` VALUES (352, '2021-09-05 15:55:06', '角色菜单数', 'get', '127.0.0.1', 1190, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-05 15:55:06', 0);
INSERT INTO `sys_log` VALUES (353, '2021-09-05 15:55:33', '字典详情列表', 'get', '127.0.0.1', 1303, 'admin', '/admin/dictDetail', '', 0, 1, '2021-09-05 15:55:33', 0);
INSERT INTO `sys_log` VALUES (354, '2021-09-05 15:55:33', '部门管理', 'get', '127.0.0.1', 577, 'admin', '/admin/dept', '', 0, 1, '2021-09-05 15:55:33', 0);
INSERT INTO `sys_log` VALUES (355, '2021-09-05 15:55:37', '部门管理', 'get', '127.0.0.1', 480, 'admin', '/admin/dept', '', 0, 1, '2021-09-05 15:55:37', 0);
INSERT INTO `sys_log` VALUES (356, '2021-09-05 15:55:42', '部门新增', 'post', '127.0.0.1', 1034, 'admin', '/admin/dept', '', 0, 1, '2021-09-05 15:55:42', 0);
INSERT INTO `sys_log` VALUES (357, '2021-09-05 15:55:42', '部门管理', 'get', '127.0.0.1', 492, 'admin', '/admin/dept', '', 0, 1, '2021-09-05 15:55:42', 0);
INSERT INTO `sys_log` VALUES (358, '2021-09-05 15:55:50', '部门删除', 'delete', '127.0.0.1', 1759, 'admin', '/admin/dept', '', 0, 1, '2021-09-05 15:55:50', 0);
INSERT INTO `sys_log` VALUES (359, '2021-09-05 15:55:50', '部门管理', 'get', '127.0.0.1', 394, 'admin', '/admin/dept', '', 0, 1, '2021-09-05 15:55:50', 0);
INSERT INTO `sys_log` VALUES (360, '2021-09-05 15:57:51', '商品分类', 'get', '127.0.0.1', 462, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 15:57:51', 0);
INSERT INTO `sys_log` VALUES (361, '2021-09-05 15:58:31', '用户个人信息', 'get', '127.0.0.1', 711, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-05 15:58:31', 0);
INSERT INTO `sys_log` VALUES (362, '2021-09-05 15:58:31', '', 'get', '127.0.0.1', 2197, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-05 15:58:31', 0);
INSERT INTO `sys_log` VALUES (363, '2021-09-05 15:58:35', '商品分类', 'get', '127.0.0.1', 412, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 15:58:35', 0);
INSERT INTO `sys_log` VALUES (364, '2021-09-05 15:59:12', '商品分类', 'get', '127.0.0.1', 552, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 15:59:12', 0);
INSERT INTO `sys_log` VALUES (365, '2021-09-05 15:59:21', '分类删除', 'delete', '127.0.0.1', 1076, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 15:59:21', 0);
INSERT INTO `sys_log` VALUES (366, '2021-09-05 15:59:21', '商品分类', 'get', '127.0.0.1', 313, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 15:59:21', 0);
INSERT INTO `sys_log` VALUES (367, '2021-09-05 15:59:30', '商品分类', 'get', '127.0.0.1', 601, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 15:59:30', 0);
INSERT INTO `sys_log` VALUES (368, '2021-09-05 15:59:41', '分类修改', 'put', '127.0.0.1', 4653, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 15:59:41', 0);
INSERT INTO `sys_log` VALUES (369, '2021-09-05 15:59:41', '商品分类', 'get', '127.0.0.1', 319, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 15:59:41', 0);
INSERT INTO `sys_log` VALUES (370, '2021-09-05 15:59:44', '商品分类', 'get', '127.0.0.1', 413, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 15:59:44', 0);
INSERT INTO `sys_log` VALUES (371, '2021-09-05 15:59:49', '', 'get', '127.0.0.1', 555, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-05 15:59:49', 0);
INSERT INTO `sys_log` VALUES (372, '2021-09-05 16:02:51', '商品分类', 'get', '127.0.0.1', 604, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:02:51', 0);
INSERT INTO `sys_log` VALUES (373, '2021-09-05 16:02:55', '商品分类', 'get', '127.0.0.1', 439, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:02:55', 0);
INSERT INTO `sys_log` VALUES (374, '2021-09-05 16:05:12', '商品分类', 'get', '127.0.0.1', 523, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:05:12', 0);
INSERT INTO `sys_log` VALUES (375, '2021-09-05 16:05:15', '商品分类', 'get', '127.0.0.1', 451, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:05:15', 0);
INSERT INTO `sys_log` VALUES (376, '2021-09-05 16:06:43', '部门管理', 'get', '127.0.0.1', 533, 'admin', '/admin/dept', '', 0, 1, '2021-09-05 16:06:43', 0);
INSERT INTO `sys_log` VALUES (377, '2021-09-05 16:14:18', '菜单管理', 'get', '127.0.0.1', 1175, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 16:14:18', 0);
INSERT INTO `sys_log` VALUES (378, '2021-09-05 16:14:20', '角色菜单数', 'get', '127.0.0.1', 1522, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-05 16:14:20', 0);
INSERT INTO `sys_log` VALUES (379, '2021-09-05 16:19:32', '商品分类', 'get', '127.0.0.1', 431, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:19:32', 0);
INSERT INTO `sys_log` VALUES (380, '2021-09-05 16:19:33', '商品分类', 'get', '127.0.0.1', 558, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:19:33', 0);
INSERT INTO `sys_log` VALUES (381, '2021-09-05 16:20:30', '商品分类', 'get', '127.0.0.1', 1289, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:20:30', 0);
INSERT INTO `sys_log` VALUES (382, '2021-09-05 16:20:33', '商品分类', 'get', '127.0.0.1', 632, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:20:33', 0);
INSERT INTO `sys_log` VALUES (383, '2021-09-05 16:21:47', '商品分类', 'get', '127.0.0.1', 368, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:21:47', 0);
INSERT INTO `sys_log` VALUES (384, '2021-09-05 16:22:01', '用户个人信息', 'get', '127.0.0.1', 401, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-05 16:22:01', 0);
INSERT INTO `sys_log` VALUES (385, '2021-09-05 16:22:01', '', 'get', '127.0.0.1', 2410, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-05 16:22:01', 0);
INSERT INTO `sys_log` VALUES (386, '2021-09-05 16:22:05', '字典详情列表', 'get', '127.0.0.1', 961, 'admin', '/admin/dictDetail', '', 0, 1, '2021-09-05 16:22:05', 0);
INSERT INTO `sys_log` VALUES (387, '2021-09-05 16:22:05', '部门管理', 'get', '127.0.0.1', 2651, 'admin', '/admin/dept', '', 0, 1, '2021-09-05 16:22:05', 0);
INSERT INTO `sys_log` VALUES (388, '2021-09-05 16:22:05', '用户管理', 'get', '127.0.0.1', 17283, 'admin', '/admin/user', '', 0, 1, '2021-09-05 16:22:05', 0);
INSERT INTO `sys_log` VALUES (389, '2021-09-05 16:22:05', '用户管理', 'get', '127.0.0.1', 6657, 'admin', '/admin/user', '', 0, 1, '2021-09-05 16:22:05', 0);
INSERT INTO `sys_log` VALUES (390, '2021-09-05 16:22:06', '用户个人信息', 'get', '127.0.0.1', 476, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-05 16:22:06', 0);
INSERT INTO `sys_log` VALUES (391, '2021-09-05 16:22:07', '', 'get', '127.0.0.1', 3722, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-05 16:22:07', 0);
INSERT INTO `sys_log` VALUES (392, '2021-09-05 16:22:07', '字典详情列表', 'get', '127.0.0.1', 689, 'admin', '/admin/dictDetail', '', 0, 1, '2021-09-05 16:22:07', 0);
INSERT INTO `sys_log` VALUES (393, '2021-09-05 16:22:07', '用户管理', 'get', '127.0.0.1', 4253, 'admin', '/admin/user', '', 0, 1, '2021-09-05 16:22:07', 0);
INSERT INTO `sys_log` VALUES (394, '2021-09-05 16:22:07', '部门管理', 'get', '127.0.0.1', 1810, 'admin', '/admin/dept', '', 0, 1, '2021-09-05 16:22:07', 0);
INSERT INTO `sys_log` VALUES (395, '2021-09-05 16:22:07', '用户管理', 'get', '127.0.0.1', 7496, 'admin', '/admin/user', '', 0, 1, '2021-09-05 16:22:07', 0);
INSERT INTO `sys_log` VALUES (396, '2021-09-05 16:22:13', '角色菜单数', 'get', '127.0.0.1', 2349, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-05 16:22:13', 0);
INSERT INTO `sys_log` VALUES (397, '2021-09-05 16:22:13', '角色管理', 'get', '127.0.0.1', 10195, 'admin', '/admin/roles', '', 0, 1, '2021-09-05 16:22:13', 0);
INSERT INTO `sys_log` VALUES (398, '2021-09-05 16:22:13', '角色管理', 'get', '127.0.0.1', 3475, 'admin', '/admin/roles', '', 0, 1, '2021-09-05 16:22:13', 0);
INSERT INTO `sys_log` VALUES (399, '2021-09-05 16:22:22', '商品分类', 'get', '127.0.0.1', 464, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:22:22', 0);
INSERT INTO `sys_log` VALUES (400, '2021-09-05 16:22:25', '商品分类', 'get', '127.0.0.1', 500, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:22:25', 0);
INSERT INTO `sys_log` VALUES (401, '2021-09-05 16:23:14', '角色菜单数', 'get', '127.0.0.1', 1311, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-05 16:23:14', 0);
INSERT INTO `sys_log` VALUES (402, '2021-09-05 16:23:18', '角色菜单数', 'get', '127.0.0.1', 1304, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-05 16:23:18', 0);
INSERT INTO `sys_log` VALUES (403, '2021-09-05 16:23:44', '菜单管理', 'get', '127.0.0.1', 1332, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 16:23:44', 0);
INSERT INTO `sys_log` VALUES (404, '2021-09-05 16:24:01', '角色菜单数', 'get', '127.0.0.1', 1327, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-05 16:24:01', 0);
INSERT INTO `sys_log` VALUES (405, '2021-09-05 16:24:08', '菜单编辑', 'put', '127.0.0.1', 1406, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 16:24:08', 0);
INSERT INTO `sys_log` VALUES (406, '2021-09-05 16:24:08', '菜单管理', 'get', '127.0.0.1', 1372, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 16:24:08', 0);
INSERT INTO `sys_log` VALUES (407, '2021-09-05 16:24:11', '用户个人信息', 'get', '127.0.0.1', 366, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-05 16:24:11', 0);
INSERT INTO `sys_log` VALUES (408, '2021-09-05 16:24:11', '', 'get', '127.0.0.1', 3327, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-05 16:24:11', 0);
INSERT INTO `sys_log` VALUES (409, '2021-09-05 16:24:11', '菜单管理', 'get', '127.0.0.1', 1683, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 16:24:11', 0);
INSERT INTO `sys_log` VALUES (410, '2021-09-05 16:24:16', '用户个人信息', 'get', '127.0.0.1', 357, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-05 16:24:16', 0);
INSERT INTO `sys_log` VALUES (411, '2021-09-05 16:24:16', '', 'get', '127.0.0.1', 4116, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-05 16:24:16', 0);
INSERT INTO `sys_log` VALUES (412, '2021-09-05 16:24:16', '菜单管理', 'get', '127.0.0.1', 2275, 'admin', '/admin/menu', '', 0, 1, '2021-09-05 16:24:16', 0);
INSERT INTO `sys_log` VALUES (413, '2021-09-05 16:24:19', '商品分类', 'get', '127.0.0.1', 372, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:24:19', 0);
INSERT INTO `sys_log` VALUES (414, '2021-09-05 16:24:21', '用户个人信息', 'get', '127.0.0.1', 356, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-05 16:24:21', 0);
INSERT INTO `sys_log` VALUES (415, '2021-09-05 16:24:21', '', 'get', '127.0.0.1', 3111, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-05 16:24:21', 0);
INSERT INTO `sys_log` VALUES (416, '2021-09-05 16:24:21', '商品分类', 'get', '127.0.0.1', 13980, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:24:21', 0);
INSERT INTO `sys_log` VALUES (417, '2021-09-05 16:24:28', '商品分类', 'get', '127.0.0.1', 508, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:24:28', 0);
INSERT INTO `sys_log` VALUES (418, '2021-09-05 16:24:33', '商品分类', 'get', '127.0.0.1', 461, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:24:33', 0);
INSERT INTO `sys_log` VALUES (419, '2021-09-05 16:24:40', '', 'get', '127.0.0.1', 443, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-05 16:24:40', 0);
INSERT INTO `sys_log` VALUES (420, '2021-09-05 16:34:24', '', 'get', '127.0.0.1', 435, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-05 16:34:24', 0);
INSERT INTO `sys_log` VALUES (421, '2021-09-05 16:34:41', '用户个人信息', 'get', '127.0.0.1', 394, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-05 16:34:41', 0);
INSERT INTO `sys_log` VALUES (422, '2021-09-05 16:34:41', '', 'get', '127.0.0.1', 3112, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-05 16:34:41', 0);
INSERT INTO `sys_log` VALUES (423, '2021-09-05 16:34:41', '商品分类', 'get', '127.0.0.1', 1316, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:34:41', 0);
INSERT INTO `sys_log` VALUES (424, '2021-09-05 16:34:45', '商品分类', 'get', '127.0.0.1', 375, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:34:45', 0);
INSERT INTO `sys_log` VALUES (425, '2021-09-05 16:34:46', '', 'get', '127.0.0.1', 414, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-05 16:34:46', 0);
INSERT INTO `sys_log` VALUES (426, '2021-09-05 16:39:59', '用户个人信息', 'get', '127.0.0.1', 492, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-05 16:39:59', 0);
INSERT INTO `sys_log` VALUES (427, '2021-09-05 16:39:59', '', 'get', '127.0.0.1', 3716, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-05 16:39:59', 0);
INSERT INTO `sys_log` VALUES (428, '2021-09-05 16:40:00', '商品分类', 'get', '127.0.0.1', 630, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:40:00', 0);
INSERT INTO `sys_log` VALUES (429, '2021-09-05 16:40:01', '商品分类', 'get', '127.0.0.1', 500, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:40:01', 0);
INSERT INTO `sys_log` VALUES (430, '2021-09-05 16:40:02', '', 'get', '127.0.0.1', 438, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-05 16:40:02', 0);
INSERT INTO `sys_log` VALUES (431, '2021-09-05 16:40:29', '新增分类', 'post', '127.0.0.1', 4776, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:40:29', 0);
INSERT INTO `sys_log` VALUES (432, '2021-09-05 16:40:29', '商品分类', 'get', '127.0.0.1', 457, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:40:29', 0);
INSERT INTO `sys_log` VALUES (433, '2021-09-05 16:40:35', '商品分类', 'get', '127.0.0.1', 538, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:40:35', 0);
INSERT INTO `sys_log` VALUES (434, '2021-09-05 16:41:38', '新增分类', 'post', '127.0.0.1', 4729, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:41:38', 0);
INSERT INTO `sys_log` VALUES (435, '2021-09-05 16:41:38', '商品分类', 'get', '127.0.0.1', 372, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:41:38', 0);
INSERT INTO `sys_log` VALUES (436, '2021-09-05 16:41:41', '商品分类', 'get', '127.0.0.1', 484, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:41:41', 0);
INSERT INTO `sys_log` VALUES (437, '2021-09-05 16:41:56', '新增分类', 'post', '127.0.0.1', 1113, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:41:56', 0);
INSERT INTO `sys_log` VALUES (438, '2021-09-05 16:41:56', '商品分类', 'get', '127.0.0.1', 548, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:41:56', 0);
INSERT INTO `sys_log` VALUES (439, '2021-09-05 16:42:38', '商品分类', 'get', '127.0.0.1', 577, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:42:38', 0);
INSERT INTO `sys_log` VALUES (440, '2021-09-05 16:42:41', '分类修改', 'put', '127.0.0.1', 1472, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:42:41', 0);
INSERT INTO `sys_log` VALUES (441, '2021-09-05 16:43:02', '分类修改', 'put', '127.0.0.1', 5415, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:43:02', 0);
INSERT INTO `sys_log` VALUES (442, '2021-09-05 16:43:02', '商品分类', 'get', '127.0.0.1', 600, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:43:02', 0);
INSERT INTO `sys_log` VALUES (443, '2021-09-05 16:43:50', '商品分类', 'get', '127.0.0.1', 746, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:43:50', 0);
INSERT INTO `sys_log` VALUES (444, '2021-09-05 16:43:53', '分类修改', 'put', '127.0.0.1', 1140, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:43:53', 0);
INSERT INTO `sys_log` VALUES (445, '2021-09-05 16:43:53', '商品分类', 'get', '127.0.0.1', 379, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:43:53', 0);
INSERT INTO `sys_log` VALUES (446, '2021-09-05 16:43:59', '商品分类', 'get', '127.0.0.1', 586, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:43:59', 0);
INSERT INTO `sys_log` VALUES (447, '2021-09-05 16:44:03', '新增分类', 'post', '127.0.0.1', 1090, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:44:03', 0);
INSERT INTO `sys_log` VALUES (448, '2021-09-05 16:44:03', '商品分类', 'get', '127.0.0.1', 417, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:44:03', 0);
INSERT INTO `sys_log` VALUES (449, '2021-09-05 16:44:07', '分类删除', 'delete', '127.0.0.1', 1129, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:44:07', 0);
INSERT INTO `sys_log` VALUES (450, '2021-09-05 16:44:07', '商品分类', 'get', '127.0.0.1', 479, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:44:07', 0);
INSERT INTO `sys_log` VALUES (451, '2021-09-05 16:44:52', '商品分类', 'get', '127.0.0.1', 524, 'admin', '/shop/cate', '', 0, 1, '2021-09-05 16:44:52', 0);
INSERT INTO `sys_log` VALUES (452, '2021-09-10 10:22:34', '', 'get', '127.0.0.1', 2216, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-10 10:22:34', 0);
INSERT INTO `sys_log` VALUES (453, '2021-09-10 10:29:26', '用户个人信息', 'get', '127.0.0.1', 460, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-10 10:29:26', 0);
INSERT INTO `sys_log` VALUES (454, '2021-09-10 10:29:26', '', 'get', '127.0.0.1', 1727, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-10 10:29:26', 0);
INSERT INTO `sys_log` VALUES (455, '2021-09-10 10:30:21', '菜单管理', 'get', '127.0.0.1', 1438, 'admin', '/admin/menu', '', 0, 1, '2021-09-10 10:30:21', 0);
INSERT INTO `sys_log` VALUES (456, '2021-09-10 10:30:26', '菜单管理', 'get', '127.0.0.1', 1263, 'admin', '/admin/menu', '', 0, 1, '2021-09-10 10:30:26', 0);
INSERT INTO `sys_log` VALUES (457, '2021-09-10 10:30:45', '角色菜单数', 'get', '127.0.0.1', 1503, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-10 10:30:45', 0);
INSERT INTO `sys_log` VALUES (458, '2021-09-10 10:32:08', '角色菜单数', 'get', '127.0.0.1', 1299, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-10 10:32:08', 0);
INSERT INTO `sys_log` VALUES (459, '2021-09-10 10:36:38', '菜单新增', 'post', '127.0.0.1', 5870, 'admin', '/admin/menu', '', 0, 1, '2021-09-10 10:36:38', 0);
INSERT INTO `sys_log` VALUES (460, '2021-09-10 10:36:38', '菜单管理', 'get', '127.0.0.1', 1373, 'admin', '/admin/menu', '', 0, 1, '2021-09-10 10:36:38', 0);
INSERT INTO `sys_log` VALUES (461, '2021-09-10 10:36:44', '用户个人信息', 'get', '127.0.0.1', 493, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-10 10:36:44', 0);
INSERT INTO `sys_log` VALUES (462, '2021-09-10 10:36:44', '', 'get', '127.0.0.1', 1714, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-10 10:36:44', 0);
INSERT INTO `sys_log` VALUES (463, '2021-09-10 10:36:44', '菜单管理', 'get', '127.0.0.1', 1174, 'admin', '/admin/menu', '', 0, 1, '2021-09-10 10:36:44', 0);
INSERT INTO `sys_log` VALUES (464, '2021-09-10 10:36:58', '角色菜单数', 'get', '127.0.0.1', 1247, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-10 10:36:58', 0);
INSERT INTO `sys_log` VALUES (465, '2021-09-10 10:37:06', '角色菜单数', 'get', '127.0.0.1', 1181, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-10 10:37:06', 0);
INSERT INTO `sys_log` VALUES (466, '2021-09-10 10:38:37', '菜单新增', 'post', '127.0.0.1', 9345, 'admin', '/admin/menu', '', 0, 1, '2021-09-10 10:38:37', 0);
INSERT INTO `sys_log` VALUES (467, '2021-09-10 10:38:37', '菜单管理', 'get', '127.0.0.1', 24259, 'admin', '/admin/menu', '', 0, 1, '2021-09-10 10:38:37', 0);
INSERT INTO `sys_log` VALUES (468, '2021-09-10 10:38:39', '角色菜单数', 'get', '127.0.0.1', 1966, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-10 10:38:39', 0);
INSERT INTO `sys_log` VALUES (469, '2021-09-10 10:39:13', '菜单新增', 'post', '127.0.0.1', 30730, 'admin', '/admin/menu', '', 0, 1, '2021-09-10 10:39:13', 0);
INSERT INTO `sys_log` VALUES (470, '2021-09-10 10:39:13', '菜单管理', 'get', '127.0.0.1', 21297, 'admin', '/admin/menu', '', 0, 1, '2021-09-10 10:39:13', 0);
INSERT INTO `sys_log` VALUES (471, '2021-09-10 10:39:26', '角色菜单数', 'get', '127.0.0.1', 1557, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-10 10:39:26', 0);
INSERT INTO `sys_log` VALUES (472, '2021-09-10 10:39:57', '菜单新增', 'post', '127.0.0.1', 19528, 'admin', '/admin/menu', '', 0, 1, '2021-09-10 10:39:57', 0);
INSERT INTO `sys_log` VALUES (473, '2021-09-10 10:39:57', '菜单管理', 'get', '127.0.0.1', 25971, 'admin', '/admin/menu', '', 0, 1, '2021-09-10 10:39:57', 0);
INSERT INTO `sys_log` VALUES (474, '2021-09-10 10:40:04', '角色菜单数', 'get', '127.0.0.1', 2134, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-10 10:40:04', 0);
INSERT INTO `sys_log` VALUES (475, '2021-09-10 10:40:04', '角色管理', 'get', '127.0.0.1', 6274, 'admin', '/admin/roles', '', 0, 1, '2021-09-10 10:40:04', 0);
INSERT INTO `sys_log` VALUES (476, '2021-09-10 10:40:04', '角色管理', 'get', '127.0.0.1', 3563, 'admin', '/admin/roles', '', 0, 1, '2021-09-10 10:40:04', 0);
INSERT INTO `sys_log` VALUES (477, '2021-09-10 10:40:13', '角色菜单保存', 'put', '127.0.0.1', 42520, 'admin', '/admin/roles/menu', '', 0, 1, '2021-09-10 10:40:13', 0);
INSERT INTO `sys_log` VALUES (478, '2021-09-10 10:40:13', '单个角色', 'get', '127.0.0.1', 1744, 'admin', '/admin/roles/*', '', 0, 1, '2021-09-10 10:40:13', 0);
INSERT INTO `sys_log` VALUES (479, '2021-09-10 10:40:15', '用户个人信息', 'get', '127.0.0.1', 414, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-10 10:40:15', 0);
INSERT INTO `sys_log` VALUES (480, '2021-09-10 10:40:15', '', 'get', '127.0.0.1', 22266, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-10 10:40:15', 0);
INSERT INTO `sys_log` VALUES (481, '2021-09-10 10:40:16', '角色菜单数', 'get', '127.0.0.1', 2175, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-10 10:40:16', 0);
INSERT INTO `sys_log` VALUES (482, '2021-09-10 10:40:16', '角色管理', 'get', '127.0.0.1', 5986, 'admin', '/admin/roles', '', 0, 1, '2021-09-10 10:40:16', 0);
INSERT INTO `sys_log` VALUES (483, '2021-09-10 10:40:16', '角色管理', 'get', '127.0.0.1', 3712, 'admin', '/admin/roles', '', 0, 1, '2021-09-10 10:40:16', 0);
INSERT INTO `sys_log` VALUES (484, '2021-09-10 10:40:49', '用户退出', 'delete', '127.0.0.1', 179, 'admin', '/admin/auth/logout', '', 0, 1, '2021-09-10 10:40:49', 0);
INSERT INTO `sys_log` VALUES (485, '2021-09-10 10:40:53', '', 'get', '127.0.0.1', 1800, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-10 10:40:53', 0);
INSERT INTO `sys_log` VALUES (486, '2021-09-10 10:40:54', '商品规格', 'get', '127.0.0.1', 239, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 10:40:54', 0);
INSERT INTO `sys_log` VALUES (487, '2021-09-10 10:41:51', '商品规格', 'get', '127.0.0.1', 2469, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 10:41:51', 0);
INSERT INTO `sys_log` VALUES (488, '2021-09-10 10:43:23', '商品规格', 'get', '127.0.0.1', 783, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 10:43:23', 0);
INSERT INTO `sys_log` VALUES (489, '2021-09-10 10:44:30', '商品规格', 'get', '127.0.0.1', 460, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 10:44:30', 0);
INSERT INTO `sys_log` VALUES (490, '2021-09-10 10:48:11', '菜单管理', 'get', '127.0.0.1', 1572, 'admin', '/admin/menu', '', 0, 1, '2021-09-10 10:48:11', 0);
INSERT INTO `sys_log` VALUES (491, '2021-09-10 10:48:20', '角色菜单数', 'get', '127.0.0.1', 1416, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-10 10:48:20', 0);
INSERT INTO `sys_log` VALUES (492, '2021-09-10 10:49:48', '菜单编辑', 'put', '127.0.0.1', 2319, 'admin', '/admin/menu', '', 0, 1, '2021-09-10 10:49:48', 0);
INSERT INTO `sys_log` VALUES (493, '2021-09-10 10:49:48', '菜单管理', 'get', '127.0.0.1', 25186, 'admin', '/admin/menu', '', 0, 1, '2021-09-10 10:49:48', 0);
INSERT INTO `sys_log` VALUES (494, '2021-09-10 10:50:19', '用户退出', 'delete', '127.0.0.1', 244, 'admin', '/admin/auth/logout', '', 0, 1, '2021-09-10 10:50:19', 0);
INSERT INTO `sys_log` VALUES (495, '2021-09-10 10:50:54', '', 'get', '127.0.0.1', 1803, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-10 10:50:54', 0);
INSERT INTO `sys_log` VALUES (496, '2021-09-10 10:50:54', '商品规格', 'get', '127.0.0.1', 628, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 10:50:54', 0);
INSERT INTO `sys_log` VALUES (497, '2021-09-10 10:51:45', '角色菜单数', 'get', '127.0.0.1', 1218, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-10 10:51:45', 0);
INSERT INTO `sys_log` VALUES (498, '2021-09-10 10:52:01', '菜单编辑', 'put', '127.0.0.1', 1266, 'admin', '/admin/menu', '', 0, 1, '2021-09-10 10:52:01', 0);
INSERT INTO `sys_log` VALUES (499, '2021-09-10 10:52:01', '菜单管理', 'get', '127.0.0.1', 1416, 'admin', '/admin/menu', '', 0, 1, '2021-09-10 10:52:01', 0);
INSERT INTO `sys_log` VALUES (500, '2021-09-10 10:52:58', '用户退出', 'delete', '127.0.0.1', 212, 'admin', '/admin/auth/logout', '', 0, 1, '2021-09-10 10:52:58', 0);
INSERT INTO `sys_log` VALUES (501, '2021-09-10 10:53:04', '', 'get', '127.0.0.1', 2401, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-10 10:53:04', 0);
INSERT INTO `sys_log` VALUES (502, '2021-09-10 10:53:04', '商品规格', 'get', '127.0.0.1', 485, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 10:53:04', 0);
INSERT INTO `sys_log` VALUES (503, '2021-09-10 10:53:50', '角色菜单数', 'get', '127.0.0.1', 1624, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-10 10:53:50', 0);
INSERT INTO `sys_log` VALUES (504, '2021-09-10 10:53:50', '角色管理', 'get', '127.0.0.1', 38097, 'admin', '/admin/roles', '', 0, 1, '2021-09-10 10:53:50', 0);
INSERT INTO `sys_log` VALUES (505, '2021-09-10 10:53:50', '角色管理', 'get', '127.0.0.1', 4156, 'admin', '/admin/roles', '', 0, 1, '2021-09-10 10:53:50', 0);
INSERT INTO `sys_log` VALUES (506, '2021-09-10 10:54:00', '角色菜单保存', 'put', '127.0.0.1', 2975, 'admin', '/admin/roles/menu', '', 0, 1, '2021-09-10 10:54:00', 0);
INSERT INTO `sys_log` VALUES (507, '2021-09-10 10:54:00', '单个角色', 'get', '127.0.0.1', 1592, 'admin', '/admin/roles/*', '', 0, 1, '2021-09-10 10:54:00', 0);
INSERT INTO `sys_log` VALUES (508, '2021-09-10 10:54:07', '角色菜单数', 'get', '127.0.0.1', 1552, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-10 10:54:07', 0);
INSERT INTO `sys_log` VALUES (509, '2021-09-10 10:54:18', '菜单编辑', 'put', '127.0.0.1', 30626, 'admin', '/admin/menu', '', 0, 1, '2021-09-10 10:54:18', 0);
INSERT INTO `sys_log` VALUES (510, '2021-09-10 10:54:18', '菜单管理', 'get', '127.0.0.1', 27083, 'admin', '/admin/menu', '', 0, 1, '2021-09-10 10:54:18', 0);
INSERT INTO `sys_log` VALUES (511, '2021-09-10 10:54:24', '角色菜单保存', 'put', '127.0.0.1', 2786, 'admin', '/admin/roles/menu', '', 0, 1, '2021-09-10 10:54:24', 0);
INSERT INTO `sys_log` VALUES (512, '2021-09-10 10:54:24', '单个角色', 'get', '127.0.0.1', 1657, 'admin', '/admin/roles/*', '', 0, 1, '2021-09-10 10:54:24', 0);
INSERT INTO `sys_log` VALUES (513, '2021-09-10 10:54:34', '用户退出', 'delete', '127.0.0.1', 209, 'admin', '/admin/auth/logout', '', 0, 1, '2021-09-10 10:54:34', 0);
INSERT INTO `sys_log` VALUES (514, '2021-09-10 10:54:38', '', 'get', '127.0.0.1', 1833, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-10 10:54:38', 0);
INSERT INTO `sys_log` VALUES (515, '2021-09-10 10:54:39', '角色菜单数', 'get', '127.0.0.1', 2539, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-10 10:54:39', 0);
INSERT INTO `sys_log` VALUES (516, '2021-09-10 10:54:39', '角色管理', 'get', '127.0.0.1', 8054, 'admin', '/admin/roles', '', 0, 1, '2021-09-10 10:54:39', 0);
INSERT INTO `sys_log` VALUES (517, '2021-09-10 10:54:39', '角色管理', 'get', '127.0.0.1', 4343, 'admin', '/admin/roles', '', 0, 1, '2021-09-10 10:54:39', 0);
INSERT INTO `sys_log` VALUES (518, '2021-09-10 10:54:42', '商品规格', 'get', '127.0.0.1', 622, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 10:54:42', 0);
INSERT INTO `sys_log` VALUES (519, '2021-09-10 10:54:56', '新增/编辑规格', 'post', '127.0.0.1', 217, 'admin', '/shop/rule/save/*', '', 0, 1, '2021-09-10 10:54:56', 0);
INSERT INTO `sys_log` VALUES (520, '2021-09-10 10:55:27', '新增/编辑规格', 'post', '127.0.0.1', 1197, 'admin', '/shop/rule/save/*', '', 0, 1, '2021-09-10 10:55:27', 0);
INSERT INTO `sys_log` VALUES (521, '2021-09-10 11:22:40', '新增/编辑规格', 'post', '127.0.0.1', 79, 'admin', '/shop/rule/save/*', '', 0, 1, '2021-09-10 11:22:40', 0);
INSERT INTO `sys_log` VALUES (522, '2021-09-10 11:57:06', '新增/编辑规格', 'post', '127.0.0.1', 106, 'admin', '/shop/rule/save/*', '', 0, 1, '2021-09-10 11:57:06', 0);
INSERT INTO `sys_log` VALUES (523, '2021-09-10 11:58:38', '新增/编辑规格', 'post', '127.0.0.1', 102, 'admin', '/shop/rule/save/*', '', 0, 1, '2021-09-10 11:58:38', 0);
INSERT INTO `sys_log` VALUES (524, '2021-09-10 12:06:26', '新增/编辑规格', 'post', '127.0.0.1', 153, 'admin', '/shop/rule/save/*', '', 0, 1, '2021-09-10 12:06:26', 0);
INSERT INTO `sys_log` VALUES (525, '2021-09-10 16:20:51', '新增/编辑规格', 'post', '127.0.0.1', 2398, 'admin', '/shop/rule/save/*', '', 0, 1, '2021-09-10 16:20:51', 0);
INSERT INTO `sys_log` VALUES (526, '2021-09-10 16:20:52', '商品规格', 'get', '127.0.0.1', 713, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 16:20:52', 0);
INSERT INTO `sys_log` VALUES (527, '2021-09-10 16:34:19', '商品规格', 'get', '127.0.0.1', 1221, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 16:34:19', 0);
INSERT INTO `sys_log` VALUES (528, '2021-09-10 16:34:24', '商品分类', 'get', '127.0.0.1', 3926, 'admin', '/shop/cate', '', 0, 1, '2021-09-10 16:34:24', 0);
INSERT INTO `sys_log` VALUES (529, '2021-09-10 16:34:27', '商品规格', 'get', '127.0.0.1', 741, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 16:34:27', 0);
INSERT INTO `sys_log` VALUES (530, '2021-09-10 16:35:21', '商品规格', 'get', '127.0.0.1', 775, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 16:35:21', 0);
INSERT INTO `sys_log` VALUES (531, '2021-09-10 16:35:25', '商品分类', 'get', '127.0.0.1', 481, 'admin', '/shop/cate', '', 0, 1, '2021-09-10 16:35:25', 0);
INSERT INTO `sys_log` VALUES (532, '2021-09-10 16:35:27', '商品规格', 'get', '127.0.0.1', 672, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 16:35:27', 0);
INSERT INTO `sys_log` VALUES (533, '2021-09-10 16:41:29', '商品规格', 'get', '127.0.0.1', 490, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 16:41:29', 0);
INSERT INTO `sys_log` VALUES (534, '2021-09-10 16:41:39', '商品规格', 'get', '127.0.0.1', 429, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 16:41:39', 0);
INSERT INTO `sys_log` VALUES (535, '2021-09-10 17:02:02', '商品规格', 'get', '127.0.0.1', 523, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 17:02:02', 0);
INSERT INTO `sys_log` VALUES (536, '2021-09-10 17:02:12', '商品规格', 'get', '127.0.0.1', 384, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 17:02:12', 0);
INSERT INTO `sys_log` VALUES (537, '2021-09-10 17:07:17', '商品规格', 'get', '127.0.0.1', 1919, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 17:07:17', 0);
INSERT INTO `sys_log` VALUES (538, '2021-09-10 17:08:08', '商品规格', 'get', '127.0.0.1', 814, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 17:08:08', 0);
INSERT INTO `sys_log` VALUES (539, '2021-09-10 17:08:37', '商品规格', 'get', '127.0.0.1', 1368, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 17:08:37', 0);
INSERT INTO `sys_log` VALUES (540, '2021-09-10 17:09:33', '商品规格', 'get', '127.0.0.1', 613, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 17:09:33', 0);
INSERT INTO `sys_log` VALUES (541, '2021-09-10 17:14:17', '商品规格', 'get', '127.0.0.1', 668, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 17:14:17', 0);
INSERT INTO `sys_log` VALUES (542, '2021-09-10 17:15:13', '商品规格', 'get', '127.0.0.1', 448, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 17:15:13', 0);
INSERT INTO `sys_log` VALUES (543, '2021-09-10 17:15:22', '用户个人信息', 'get', '127.0.0.1', 596, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-10 17:15:22', 0);
INSERT INTO `sys_log` VALUES (544, '2021-09-10 17:15:22', '', 'get', '127.0.0.1', 5183, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-10 17:15:22', 0);
INSERT INTO `sys_log` VALUES (545, '2021-09-10 17:15:23', '商品规格', 'get', '127.0.0.1', 429, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 17:15:23', 0);
INSERT INTO `sys_log` VALUES (546, '2021-09-10 17:15:55', '商品规格', 'get', '127.0.0.1', 531, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 17:15:55', 0);
INSERT INTO `sys_log` VALUES (547, '2021-09-10 17:16:51', '商品规格', 'get', '127.0.0.1', 4631, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 17:16:51', 0);
INSERT INTO `sys_log` VALUES (548, '2021-09-10 17:21:40', '商品规格', 'get', '127.0.0.1', 886, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 17:21:40', 0);
INSERT INTO `sys_log` VALUES (549, '2021-09-10 17:22:03', '商品规格', 'get', '127.0.0.1', 918, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 17:22:03', 0);
INSERT INTO `sys_log` VALUES (550, '2021-09-10 17:23:42', '商品规格', 'get', '127.0.0.1', 1884, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 17:23:42', 0);
INSERT INTO `sys_log` VALUES (551, '2021-09-10 17:25:29', '商品规格', 'get', '127.0.0.1', 7131, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 17:25:29', 0);
INSERT INTO `sys_log` VALUES (552, '2021-09-10 17:28:32', '商品规格', 'get', '127.0.0.1', 550, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 17:28:32', 0);
INSERT INTO `sys_log` VALUES (553, '2021-09-10 17:29:08', '商品规格', 'get', '127.0.0.1', 2115, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 17:29:08', 0);
INSERT INTO `sys_log` VALUES (554, '2021-09-10 17:30:03', '商品规格', 'get', '127.0.0.1', 1030, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 17:30:03', 0);
INSERT INTO `sys_log` VALUES (555, '2021-09-10 17:30:55', '商品规格', 'get', '127.0.0.1', 658, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 17:30:55', 0);
INSERT INTO `sys_log` VALUES (556, '2021-09-10 17:34:28', '用户个人信息', 'get', '127.0.0.1', 312, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-10 17:34:28', 0);
INSERT INTO `sys_log` VALUES (557, '2021-09-10 17:34:28', '', 'get', '127.0.0.1', 2617, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-10 17:34:28', 0);
INSERT INTO `sys_log` VALUES (558, '2021-09-10 17:34:28', '商品规格', 'get', '127.0.0.1', 414, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 17:34:28', 0);
INSERT INTO `sys_log` VALUES (559, '2021-09-10 17:36:53', '用户个人信息', 'get', '127.0.0.1', 269, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-10 17:36:53', 0);
INSERT INTO `sys_log` VALUES (560, '2021-09-10 17:36:53', '', 'get', '127.0.0.1', 2585, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-10 17:36:53', 0);
INSERT INTO `sys_log` VALUES (561, '2021-09-10 17:36:53', '商品规格', 'get', '127.0.0.1', 515, 'admin', '/shop/rule', '', 0, 1, '2021-09-10 17:36:53', 0);
INSERT INTO `sys_log` VALUES (562, '2021-09-11 11:28:55', '', 'get', '127.0.0.1', 2039, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-11 11:28:55', 0);
INSERT INTO `sys_log` VALUES (563, '2021-09-11 11:29:04', '商品规格', 'get', '127.0.0.1', 3122, 'admin', '/shop/rule', '', 0, 1, '2021-09-11 11:29:04', 0);
INSERT INTO `sys_log` VALUES (564, '2021-09-11 11:30:21', '商品规格', 'get', '127.0.0.1', 839, 'admin', '/shop/rule', '', 0, 1, '2021-09-11 11:30:21', 0);
INSERT INTO `sys_log` VALUES (565, '2021-09-11 11:31:15', '商品规格', 'get', '127.0.0.1', 986, 'admin', '/shop/rule', '', 0, 1, '2021-09-11 11:31:15', 0);
INSERT INTO `sys_log` VALUES (566, '2021-09-11 11:38:51', '商品规格', 'get', '127.0.0.1', 714, 'admin', '/shop/rule', '', 0, 1, '2021-09-11 11:38:51', 0);
INSERT INTO `sys_log` VALUES (567, '2021-09-11 11:42:30', '商品规格', 'get', '127.0.0.1', 1051, 'admin', '/shop/rule', '', 0, 1, '2021-09-11 11:42:30', 0);
INSERT INTO `sys_log` VALUES (568, '2021-09-11 11:43:02', '商品规格', 'get', '127.0.0.1', 1018, 'admin', '/shop/rule', '', 0, 1, '2021-09-11 11:43:02', 0);
INSERT INTO `sys_log` VALUES (569, '2021-09-11 11:43:32', '商品规格', 'get', '127.0.0.1', 738, 'admin', '/shop/rule', '', 0, 1, '2021-09-11 11:43:32', 0);
INSERT INTO `sys_log` VALUES (570, '2021-09-11 11:44:13', '新增/编辑规格', 'post', '127.0.0.1', 13427, 'admin', '/shop/rule/save/*', '', 0, 1, '2021-09-11 11:44:13', 0);
INSERT INTO `sys_log` VALUES (571, '2021-09-11 11:44:13', '商品规格', 'get', '127.0.0.1', 731, 'admin', '/shop/rule', '', 0, 1, '2021-09-11 11:44:13', 0);
INSERT INTO `sys_log` VALUES (572, '2021-09-11 11:45:24', '新增/编辑规格', 'post', '127.0.0.1', 1348, 'admin', '/shop/rule/save/*', '', 0, 1, '2021-09-11 11:45:24', 0);
INSERT INTO `sys_log` VALUES (573, '2021-09-11 11:45:25', '商品规格', 'get', '127.0.0.1', 604, 'admin', '/shop/rule', '', 0, 1, '2021-09-11 11:45:25', 0);
INSERT INTO `sys_log` VALUES (574, '2021-09-11 11:46:27', '新增/编辑规格', 'post', '127.0.0.1', 1331, 'admin', '/shop/rule/save/*', '', 0, 1, '2021-09-11 11:46:27', 0);
INSERT INTO `sys_log` VALUES (575, '2021-09-11 11:46:27', '商品规格', 'get', '127.0.0.1', 614, 'admin', '/shop/rule', '', 0, 1, '2021-09-11 11:46:27', 0);
INSERT INTO `sys_log` VALUES (576, '2021-09-11 11:46:43', '新增/编辑规格', 'post', '127.0.0.1', 1019, 'admin', '/shop/rule/save/*', '', 0, 1, '2021-09-11 11:46:43', 0);
INSERT INTO `sys_log` VALUES (577, '2021-09-11 11:46:44', '商品规格', 'get', '127.0.0.1', 666, 'admin', '/shop/rule', '', 0, 1, '2021-09-11 11:46:44', 0);
INSERT INTO `sys_log` VALUES (578, '2021-09-11 11:47:06', '新增/编辑规格', 'post', '127.0.0.1', 976, 'admin', '/shop/rule/save/*', '', 0, 1, '2021-09-11 11:47:06', 0);
INSERT INTO `sys_log` VALUES (579, '2021-09-11 11:47:06', '商品规格', 'get', '127.0.0.1', 665, 'admin', '/shop/rule', '', 0, 1, '2021-09-11 11:47:06', 0);
INSERT INTO `sys_log` VALUES (580, '2021-09-11 11:52:40', '新增/编辑规格', 'post', '127.0.0.1', 1265, 'admin', '/shop/rule/save/*', '', 0, 1, '2021-09-11 11:52:40', 0);
INSERT INTO `sys_log` VALUES (581, '2021-09-11 11:52:41', '商品规格', 'get', '127.0.0.1', 659, 'admin', '/shop/rule', '', 0, 1, '2021-09-11 11:52:41', 0);
INSERT INTO `sys_log` VALUES (582, '2021-09-11 11:53:18', '新增/编辑规格', 'post', '127.0.0.1', 1014, 'admin', '/shop/rule/save/*', '', 0, 1, '2021-09-11 11:53:18', 0);
INSERT INTO `sys_log` VALUES (583, '2021-09-11 11:53:19', '商品规格', 'get', '127.0.0.1', 807, 'admin', '/shop/rule', '', 0, 1, '2021-09-11 11:53:19', 0);
INSERT INTO `sys_log` VALUES (584, '2021-09-11 12:05:41', '新增/编辑规格', 'post', '127.0.0.1', 658, 'admin', '/shop/rule/save/*', '', 0, 1, '2021-09-11 12:05:41', 0);
INSERT INTO `sys_log` VALUES (585, '2021-09-11 12:05:41', '商品规格', 'get', '127.0.0.1', 762, 'admin', '/shop/rule', '', 0, 1, '2021-09-11 12:05:41', 0);
INSERT INTO `sys_log` VALUES (586, '2021-09-11 12:05:59', '新增/编辑规格', 'post', '127.0.0.1', 392, 'admin', '/shop/rule/save/*', '', 0, 1, '2021-09-11 12:05:59', 0);
INSERT INTO `sys_log` VALUES (587, '2021-09-11 12:06:00', '商品规格', 'get', '127.0.0.1', 666, 'admin', '/shop/rule', '', 0, 1, '2021-09-11 12:06:00', 0);
INSERT INTO `sys_log` VALUES (588, '2021-09-11 12:07:59', '新增/编辑规格', 'post', '127.0.0.1', 717, 'admin', '/shop/rule/save/*', '', 0, 1, '2021-09-11 12:07:59', 0);
INSERT INTO `sys_log` VALUES (589, '2021-09-11 12:07:59', '商品规格', 'get', '127.0.0.1', 761, 'admin', '/shop/rule', '', 0, 1, '2021-09-11 12:07:59', 0);
INSERT INTO `sys_log` VALUES (590, '2021-09-11 13:31:31', '新增/编辑规格', 'post', '127.0.0.1', 1232, 'admin', '/shop/rule/save/*', '', 0, 1, '2021-09-11 13:31:31', 0);
INSERT INTO `sys_log` VALUES (591, '2021-09-11 13:31:31', '商品规格', 'get', '127.0.0.1', 1033, 'admin', '/shop/rule', '', 0, 1, '2021-09-11 13:31:31', 0);
INSERT INTO `sys_log` VALUES (592, '2021-09-11 13:32:14', '新增/编辑规格', 'post', '127.0.0.1', 1215, 'admin', '/shop/rule/save/*', '', 0, 1, '2021-09-11 13:32:14', 0);
INSERT INTO `sys_log` VALUES (593, '2021-09-11 13:32:14', '商品规格', 'get', '127.0.0.1', 698, 'admin', '/shop/rule', '', 0, 1, '2021-09-11 13:32:14', 0);
INSERT INTO `sys_log` VALUES (594, '2021-09-11 13:33:33', '规格删除', 'delete', '127.0.0.1', 1627, 'admin', '/shop/rule', '', 0, 1, '2021-09-11 13:33:33', 0);
INSERT INTO `sys_log` VALUES (595, '2021-09-11 13:33:33', '商品规格', 'get', '127.0.0.1', 1395, 'admin', '/shop/rule', '', 0, 1, '2021-09-11 13:33:33', 0);
INSERT INTO `sys_log` VALUES (596, '2021-09-11 13:33:43', '规格删除', 'delete', '127.0.0.1', 1133, 'admin', '/shop/rule', '', 0, 1, '2021-09-11 13:33:43', 0);
INSERT INTO `sys_log` VALUES (597, '2021-09-11 13:33:44', '商品规格', 'get', '127.0.0.1', 621, 'admin', '/shop/rule', '', 0, 1, '2021-09-11 13:33:44', 0);
INSERT INTO `sys_log` VALUES (598, '2021-09-11 13:33:48', '规格删除', 'delete', '127.0.0.1', 914, 'admin', '/shop/rule', '', 0, 1, '2021-09-11 13:33:48', 0);
INSERT INTO `sys_log` VALUES (599, '2021-09-11 13:33:48', '商品规格', 'get', '127.0.0.1', 693, 'admin', '/shop/rule', '', 0, 1, '2021-09-11 13:33:48', 0);
INSERT INTO `sys_log` VALUES (600, '2021-09-11 13:35:29', '商品规格', 'get', '127.0.0.1', 723, 'admin', '/shop/rule', '', 0, 1, '2021-09-11 13:35:29', 0);
INSERT INTO `sys_log` VALUES (601, '2021-09-11 14:22:01', '用户个人信息', 'get', '127.0.0.1', 704, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-11 14:22:01', 0);
INSERT INTO `sys_log` VALUES (602, '2021-09-11 14:22:01', '', 'get', '127.0.0.1', 2611, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-11 14:22:01', 0);
INSERT INTO `sys_log` VALUES (603, '2021-09-11 14:22:01', '用户个人信息', 'get', '127.0.0.1', 445, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-11 14:22:01', 0);
INSERT INTO `sys_log` VALUES (604, '2021-09-11 14:22:01', '', 'get', '127.0.0.1', 3471, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-11 14:22:01', 0);
INSERT INTO `sys_log` VALUES (605, '2021-09-11 14:22:01', '商品规格', 'get', '127.0.0.1', 804, 'admin', '/shop/rule', '', 0, 1, '2021-09-11 14:22:01', 0);
INSERT INTO `sys_log` VALUES (606, '2021-09-11 14:24:17', '用户个人信息', 'get', '127.0.0.1', 357, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-11 14:24:17', 0);
INSERT INTO `sys_log` VALUES (607, '2021-09-11 14:24:17', '用户个人信息', 'get', '127.0.0.1', 361, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-11 14:24:17', 0);
INSERT INTO `sys_log` VALUES (608, '2021-09-11 14:24:17', '', 'get', '127.0.0.1', 2702, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-11 14:24:17', 0);
INSERT INTO `sys_log` VALUES (609, '2021-09-11 14:24:18', '', 'get', '127.0.0.1', 19493, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-11 14:24:18', 0);
INSERT INTO `sys_log` VALUES (610, '2021-09-11 14:24:18', '商品规格', 'get', '127.0.0.1', 913, 'admin', '/shop/rule', '', 0, 1, '2021-09-11 14:24:18', 0);
INSERT INTO `sys_log` VALUES (611, '2021-09-11 14:24:23', '商品分类', 'get', '127.0.0.1', 5936, 'admin', '/shop/cate', '', 0, 1, '2021-09-11 14:24:23', 0);
INSERT INTO `sys_log` VALUES (612, '2021-09-11 14:24:49', '商品规格', 'get', '127.0.0.1', 1053, 'admin', '/shop/rule', '', 0, 1, '2021-09-11 14:24:49', 0);
INSERT INTO `sys_log` VALUES (613, '2021-09-16 09:43:48', '', 'get', '127.0.0.1', 4993, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-16 09:43:48', 0);
INSERT INTO `sys_log` VALUES (614, '2021-09-16 09:49:43', '用户个人信息', 'get', '127.0.0.1', 482, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-16 09:49:43', 0);
INSERT INTO `sys_log` VALUES (615, '2021-09-16 09:49:43', '', 'get', '127.0.0.1', 1339, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-16 09:49:43', 0);
INSERT INTO `sys_log` VALUES (616, '2021-09-16 09:51:56', '菜单管理', 'get', '127.0.0.1', 1302, 'admin', '/admin/menu', '', 0, 1, '2021-09-16 09:51:56', 0);
INSERT INTO `sys_log` VALUES (617, '2021-09-16 09:52:36', '菜单管理', 'get', '127.0.0.1', 1373, 'admin', '/admin/menu', '', 0, 1, '2021-09-16 09:52:36', 0);
INSERT INTO `sys_log` VALUES (618, '2021-09-16 09:52:37', '角色菜单数', 'get', '127.0.0.1', 1398, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-16 09:52:37', 0);
INSERT INTO `sys_log` VALUES (619, '2021-09-16 09:52:58', '角色菜单数', 'get', '127.0.0.1', 1175, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-16 09:52:58', 0);
INSERT INTO `sys_log` VALUES (620, '2021-09-16 09:55:06', '菜单新增', 'post', '127.0.0.1', 6305, 'admin', '/admin/menu', '', 0, 1, '2021-09-16 09:55:06', 0);
INSERT INTO `sys_log` VALUES (621, '2021-09-16 09:55:06', '菜单管理', 'get', '127.0.0.1', 1370, 'admin', '/admin/menu', '', 0, 1, '2021-09-16 09:55:06', 0);
INSERT INTO `sys_log` VALUES (622, '2021-09-16 09:55:26', '角色菜单数', 'get', '127.0.0.1', 1471, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-16 09:55:26', 0);
INSERT INTO `sys_log` VALUES (623, '2021-09-16 09:56:28', '菜单新增', 'post', '127.0.0.1', 969, 'admin', '/admin/menu', '', 0, 1, '2021-09-16 09:56:28', 0);
INSERT INTO `sys_log` VALUES (624, '2021-09-16 09:56:28', '菜单管理', 'get', '127.0.0.1', 1596, 'admin', '/admin/menu', '', 0, 1, '2021-09-16 09:56:28', 0);
INSERT INTO `sys_log` VALUES (625, '2021-09-16 09:56:30', '角色菜单数', 'get', '127.0.0.1', 1708, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-16 09:56:30', 0);
INSERT INTO `sys_log` VALUES (626, '2021-09-16 09:58:00', '菜单新增', 'post', '127.0.0.1', 5347, 'admin', '/admin/menu', '', 0, 1, '2021-09-16 09:58:00', 0);
INSERT INTO `sys_log` VALUES (627, '2021-09-16 09:58:01', '菜单管理', 'get', '127.0.0.1', 1466, 'admin', '/admin/menu', '', 0, 1, '2021-09-16 09:58:01', 0);
INSERT INTO `sys_log` VALUES (628, '2021-09-16 09:58:02', '角色菜单数', 'get', '127.0.0.1', 1525, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-16 09:58:02', 0);
INSERT INTO `sys_log` VALUES (629, '2021-09-16 09:59:38', '菜单新增', 'post', '127.0.0.1', 1200, 'admin', '/admin/menu', '', 0, 1, '2021-09-16 09:59:38', 0);
INSERT INTO `sys_log` VALUES (630, '2021-09-16 09:59:38', '菜单管理', 'get', '127.0.0.1', 1502, 'admin', '/admin/menu', '', 0, 1, '2021-09-16 09:59:38', 0);
INSERT INTO `sys_log` VALUES (631, '2021-09-16 15:03:40', '角色菜单数', 'get', '127.0.0.1', 1397, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-16 15:03:40', 0);
INSERT INTO `sys_log` VALUES (632, '2021-09-16 15:03:40', '角色管理', 'get', '127.0.0.1', 15008, 'admin', '/admin/roles', '', 0, 1, '2021-09-16 15:03:40', 0);
INSERT INTO `sys_log` VALUES (633, '2021-09-16 15:03:40', '角色管理', 'get', '127.0.0.1', 4844, 'admin', '/admin/roles', '', 0, 1, '2021-09-16 15:03:40', 0);
INSERT INTO `sys_log` VALUES (634, '2021-09-16 15:03:49', '角色菜单保存', 'put', '127.0.0.1', 4522, 'admin', '/admin/roles/menu', '', 0, 1, '2021-09-16 15:03:49', 0);
INSERT INTO `sys_log` VALUES (635, '2021-09-16 15:03:49', '单个角色', 'get', '127.0.0.1', 1781, 'admin', '/admin/roles/*', '', 0, 1, '2021-09-16 15:03:49', 0);
INSERT INTO `sys_log` VALUES (636, '2021-09-16 15:03:51', '用户个人信息', 'get', '127.0.0.1', 404, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-16 15:03:51', 0);
INSERT INTO `sys_log` VALUES (637, '2021-09-16 15:03:51', '', 'get', '127.0.0.1', 1734, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-16 15:03:51', 0);
INSERT INTO `sys_log` VALUES (638, '2021-09-16 15:03:51', '角色菜单数', 'get', '127.0.0.1', 1096, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-16 15:03:51', 0);
INSERT INTO `sys_log` VALUES (639, '2021-09-16 15:03:51', '角色管理', 'get', '127.0.0.1', 4171, 'admin', '/admin/roles', '', 0, 1, '2021-09-16 15:03:51', 0);
INSERT INTO `sys_log` VALUES (640, '2021-09-16 15:03:51', '角色管理', 'get', '127.0.0.1', 3447, 'admin', '/admin/roles', '', 0, 1, '2021-09-16 15:03:51', 0);
INSERT INTO `sys_log` VALUES (641, '2021-09-17 10:20:49', '', 'get', '127.0.0.1', 2355, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-17 10:20:49', 0);
INSERT INTO `sys_log` VALUES (642, '2021-09-17 10:25:30', '管理商品', 'get', '127.0.0.1', 184, 'admin', '/shop/product', '', 0, 1, '2021-09-17 10:25:30', 0);
INSERT INTO `sys_log` VALUES (643, '2021-09-17 10:25:31', '管理商品', 'get', '127.0.0.1', 160, 'admin', '/shop/product', '', 0, 1, '2021-09-17 10:25:31', 0);
INSERT INTO `sys_log` VALUES (644, '2021-09-17 10:25:39', '管理商品', 'get', '127.0.0.1', 126, 'admin', '/shop/product', '', 0, 1, '2021-09-17 10:25:39', 0);
INSERT INTO `sys_log` VALUES (645, '2021-09-17 10:26:24', '用户个人信息', 'get', '127.0.0.1', 1065, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-17 10:26:24', 0);
INSERT INTO `sys_log` VALUES (646, '2021-09-17 10:26:24', '', 'get', '127.0.0.1', 7530, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-17 10:26:24', 0);
INSERT INTO `sys_log` VALUES (647, '2021-09-17 10:26:25', '管理商品', 'get', '127.0.0.1', 873, 'admin', '/shop/product', '', 0, 1, '2021-09-17 10:26:25', 0);
INSERT INTO `sys_log` VALUES (648, '2021-09-17 10:27:24', '管理商品', 'get', '127.0.0.1', 650, 'admin', '/shop/product', '', 0, 1, '2021-09-17 10:27:24', 0);
INSERT INTO `sys_log` VALUES (649, '2021-09-17 10:27:26', '管理商品', 'get', '127.0.0.1', 2125, 'admin', '/shop/product', '', 0, 1, '2021-09-17 10:27:26', 0);
INSERT INTO `sys_log` VALUES (650, '2021-09-17 10:27:26', '管理商品', 'get', '127.0.0.1', 832, 'admin', '/shop/product', '', 0, 1, '2021-09-17 10:27:26', 0);
INSERT INTO `sys_log` VALUES (651, '2021-09-17 10:29:10', '管理商品', 'get', '127.0.0.1', 519, 'admin', '/shop/product', '', 0, 1, '2021-09-17 10:29:10', 0);
INSERT INTO `sys_log` VALUES (652, '2021-09-17 10:30:29', '管理商品', 'get', '127.0.0.1', 594, 'admin', '/shop/product', '', 0, 1, '2021-09-17 10:30:29', 0);
INSERT INTO `sys_log` VALUES (653, '2021-09-17 10:30:37', '管理商品', 'get', '127.0.0.1', 786, 'admin', '/shop/product', '', 0, 1, '2021-09-17 10:30:37', 0);
INSERT INTO `sys_log` VALUES (654, '2021-09-17 10:34:34', '商品规格', 'get', '127.0.0.1', 5655, 'admin', '/shop/rule', '', 0, 1, '2021-09-17 10:34:34', 0);
INSERT INTO `sys_log` VALUES (655, '2021-09-17 10:34:36', '商品分类', 'get', '127.0.0.1', 4778, 'admin', '/shop/cate', '', 0, 1, '2021-09-17 10:34:36', 0);
INSERT INTO `sys_log` VALUES (656, '2021-09-17 10:34:43', '商品分类', 'get', '127.0.0.1', 439, 'admin', '/shop/cate', '', 0, 1, '2021-09-17 10:34:43', 0);
INSERT INTO `sys_log` VALUES (657, '2021-09-17 10:34:51', '部门管理', 'get', '127.0.0.1', 1134, 'admin', '/admin/dept', '', 0, 1, '2021-09-17 10:34:51', 0);
INSERT INTO `sys_log` VALUES (658, '2021-09-17 10:34:51', '用户管理', 'get', '127.0.0.1', 9515, 'admin', '/admin/user', '', 0, 1, '2021-09-17 10:34:51', 0);
INSERT INTO `sys_log` VALUES (659, '2021-09-17 10:34:51', '字典详情列表', 'get', '127.0.0.1', 17985, 'admin', '/admin/dictDetail', '', 0, 1, '2021-09-17 10:34:51', 0);
INSERT INTO `sys_log` VALUES (660, '2021-09-17 10:34:51', '用户管理', 'get', '127.0.0.1', 12343, 'admin', '/admin/user', '', 0, 1, '2021-09-17 10:34:51', 0);
INSERT INTO `sys_log` VALUES (661, '2021-09-17 10:34:56', '部门管理', 'get', '127.0.0.1', 506, 'admin', '/admin/dept', '', 0, 1, '2021-09-17 10:34:56', 0);
INSERT INTO `sys_log` VALUES (662, '2021-09-17 10:34:58', '用户管理', 'get', '127.0.0.1', 4748, 'admin', '/admin/user', '', 0, 1, '2021-09-17 10:34:58', 0);
INSERT INTO `sys_log` VALUES (663, '2021-09-17 10:35:12', '用户管理', 'get', '127.0.0.1', 434, 'admin', '/admin/user', '', 0, 1, '2021-09-17 10:35:12', 0);
INSERT INTO `sys_log` VALUES (664, '2021-09-17 10:35:33', '管理商品', 'get', '127.0.0.1', 1318, 'admin', '/shop/product', '', 0, 1, '2021-09-17 10:35:33', 0);
INSERT INTO `sys_log` VALUES (665, '2021-09-17 10:35:33', '管理商品', 'get', '127.0.0.1', 1600, 'admin', '/shop/product', '', 0, 1, '2021-09-17 10:35:33', 0);
INSERT INTO `sys_log` VALUES (666, '2021-09-17 10:35:40', '管理商品', 'get', '127.0.0.1', 584, 'admin', '/shop/product', '', 0, 1, '2021-09-17 10:35:40', 0);
INSERT INTO `sys_log` VALUES (667, '2021-09-17 10:36:40', '管理商品', 'get', '127.0.0.1', 499, 'admin', '/shop/product', '', 0, 1, '2021-09-17 10:36:40', 0);
INSERT INTO `sys_log` VALUES (668, '2021-09-17 10:36:46', '管理商品', 'get', '127.0.0.1', 693, 'admin', '/shop/product', '', 0, 1, '2021-09-17 10:36:46', 0);
INSERT INTO `sys_log` VALUES (669, '2021-09-17 10:41:25', '管理商品', 'get', '127.0.0.1', 584, 'admin', '/shop/product', '', 0, 1, '2021-09-17 10:41:25', 0);
INSERT INTO `sys_log` VALUES (670, '2021-09-17 10:42:43', '管理商品', 'get', '127.0.0.1', 529, 'admin', '/shop/product', '', 0, 1, '2021-09-17 10:42:43', 0);
INSERT INTO `sys_log` VALUES (671, '2021-09-17 10:42:52', '管理商品', 'get', '127.0.0.1', 529, 'admin', '/shop/product', '', 0, 1, '2021-09-17 10:42:52', 0);
INSERT INTO `sys_log` VALUES (672, '2021-09-17 10:43:01', '管理商品', 'get', '127.0.0.1', 506, 'admin', '/shop/product', '', 0, 1, '2021-09-17 10:43:01', 0);
INSERT INTO `sys_log` VALUES (673, '2021-09-17 14:22:58', '管理商品', 'get', '127.0.0.1', 1147, 'admin', '/shop/product', '', 0, 1, '2021-09-17 14:22:58', 0);
INSERT INTO `sys_log` VALUES (674, '2021-09-17 14:23:45', '管理商品', 'get', '127.0.0.1', 983, 'admin', '/shop/product', '', 0, 1, '2021-09-17 14:23:45', 0);
INSERT INTO `sys_log` VALUES (675, '2021-09-17 14:24:55', '管理商品', 'get', '127.0.0.1', 721, 'admin', '/shop/product', '', 0, 1, '2021-09-17 14:24:55', 0);
INSERT INTO `sys_log` VALUES (676, '2021-09-17 15:19:41', '管理商品', 'get', '127.0.0.1', 1619, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:19:41', 0);
INSERT INTO `sys_log` VALUES (677, '2021-09-17 15:21:10', '管理商品', 'get', '127.0.0.1', 2394, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:21:10', 0);
INSERT INTO `sys_log` VALUES (678, '2021-09-17 15:23:22', '管理商品', 'get', '127.0.0.1', 1671, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:23:22', 0);
INSERT INTO `sys_log` VALUES (679, '2021-09-17 15:24:16', '管理商品', 'get', '127.0.0.1', 1661, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:24:16', 0);
INSERT INTO `sys_log` VALUES (680, '2021-09-17 15:24:39', '商品分类', 'get', '127.0.0.1', 412, 'admin', '/shop/cate', '', 0, 1, '2021-09-17 15:24:39', 0);
INSERT INTO `sys_log` VALUES (681, '2021-09-17 15:28:38', '管理商品', 'get', '127.0.0.1', 3000, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:28:38', 0);
INSERT INTO `sys_log` VALUES (682, '2021-09-17 15:28:38', '管理商品', 'get', '127.0.0.1', 2413, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:28:38', 0);
INSERT INTO `sys_log` VALUES (683, '2021-09-17 15:28:43', '管理商品', 'get', '127.0.0.1', 1264, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:28:43', 0);
INSERT INTO `sys_log` VALUES (684, '2021-09-17 15:29:02', '用户个人信息', 'get', '127.0.0.1', 463, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-17 15:29:02', 0);
INSERT INTO `sys_log` VALUES (685, '2021-09-17 15:29:02', '', 'get', '127.0.0.1', 2316, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-17 15:29:02', 0);
INSERT INTO `sys_log` VALUES (686, '2021-09-17 15:29:02', '管理商品', 'get', '127.0.0.1', 1486, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:29:02', 0);
INSERT INTO `sys_log` VALUES (687, '2021-09-17 15:29:02', '管理商品', 'get', '127.0.0.1', 1538, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:29:02', 0);
INSERT INTO `sys_log` VALUES (688, '2021-09-17 15:29:05', '商品分类', 'get', '127.0.0.1', 359, 'admin', '/shop/cate', '', 0, 1, '2021-09-17 15:29:05', 0);
INSERT INTO `sys_log` VALUES (689, '2021-09-17 15:29:38', '管理商品', 'get', '127.0.0.1', 1508, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:29:38', 0);
INSERT INTO `sys_log` VALUES (690, '2021-09-17 15:30:57', '管理商品', 'get', '127.0.0.1', 1525, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:30:57', 0);
INSERT INTO `sys_log` VALUES (691, '2021-09-17 15:32:55', '管理商品', 'get', '127.0.0.1', 1906, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:32:55', 0);
INSERT INTO `sys_log` VALUES (692, '2021-09-17 15:33:09', '商品分类', 'get', '127.0.0.1', 426, 'admin', '/shop/cate', '', 0, 1, '2021-09-17 15:33:09', 0);
INSERT INTO `sys_log` VALUES (693, '2021-09-17 15:33:12', '分类修改', 'put', '127.0.0.1', 1879, 'admin', '/shop/cate', '', 0, 1, '2021-09-17 15:33:12', 0);
INSERT INTO `sys_log` VALUES (694, '2021-09-17 15:33:12', '商品分类', 'get', '127.0.0.1', 392, 'admin', '/shop/cate', '', 0, 1, '2021-09-17 15:33:12', 0);
INSERT INTO `sys_log` VALUES (695, '2021-09-17 15:33:14', '管理商品', 'get', '127.0.0.1', 1267, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:33:14', 0);
INSERT INTO `sys_log` VALUES (696, '2021-09-17 15:34:34', '管理商品', 'get', '127.0.0.1', 1806, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:34:34', 0);
INSERT INTO `sys_log` VALUES (697, '2021-09-17 15:34:44', '商品分类', 'get', '127.0.0.1', 598, 'admin', '/shop/cate', '', 0, 1, '2021-09-17 15:34:44', 0);
INSERT INTO `sys_log` VALUES (698, '2021-09-17 15:51:41', '管理商品', 'get', '127.0.0.1', 2080, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:51:41', 0);
INSERT INTO `sys_log` VALUES (699, '2021-09-17 15:51:41', '管理商品', 'get', '127.0.0.1', 1758, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:51:41', 0);
INSERT INTO `sys_log` VALUES (700, '2021-09-17 15:51:54', '用户个人信息', 'get', '127.0.0.1', 459, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-17 15:51:54', 0);
INSERT INTO `sys_log` VALUES (701, '2021-09-17 15:51:54', '', 'get', '127.0.0.1', 3249, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-17 15:51:54', 0);
INSERT INTO `sys_log` VALUES (702, '2021-09-17 15:51:55', '管理商品', 'get', '127.0.0.1', 2455, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:51:55', 0);
INSERT INTO `sys_log` VALUES (703, '2021-09-17 15:51:55', '管理商品', 'get', '127.0.0.1', 2744, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:51:55', 0);
INSERT INTO `sys_log` VALUES (704, '2021-09-17 15:52:40', '管理商品', 'get', '127.0.0.1', 1324, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:52:40', 0);
INSERT INTO `sys_log` VALUES (705, '2021-09-17 15:52:48', '用户个人信息', 'get', '127.0.0.1', 324, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-17 15:52:48', 0);
INSERT INTO `sys_log` VALUES (706, '2021-09-17 15:52:48', '', 'get', '127.0.0.1', 3919, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-17 15:52:48', 0);
INSERT INTO `sys_log` VALUES (707, '2021-09-17 15:52:48', '管理商品', 'get', '127.0.0.1', 1709, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:52:48', 0);
INSERT INTO `sys_log` VALUES (708, '2021-09-17 15:52:48', '管理商品', 'get', '127.0.0.1', 1761, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:52:48', 0);
INSERT INTO `sys_log` VALUES (709, '2021-09-17 15:53:52', '用户个人信息', 'get', '127.0.0.1', 382, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-17 15:53:52', 0);
INSERT INTO `sys_log` VALUES (710, '2021-09-17 15:53:52', '', 'get', '127.0.0.1', 3929, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-17 15:53:52', 0);
INSERT INTO `sys_log` VALUES (711, '2021-09-17 15:53:53', '管理商品', 'get', '127.0.0.1', 1911, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:53:53', 0);
INSERT INTO `sys_log` VALUES (712, '2021-09-17 15:53:53', '管理商品', 'get', '127.0.0.1', 2085, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:53:53', 0);
INSERT INTO `sys_log` VALUES (713, '2021-09-17 15:54:39', '管理商品', 'get', '127.0.0.1', 1480, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:54:39', 0);
INSERT INTO `sys_log` VALUES (714, '2021-09-17 15:54:45', '用户个人信息', 'get', '127.0.0.1', 322, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-17 15:54:45', 0);
INSERT INTO `sys_log` VALUES (715, '2021-09-17 15:54:45', '', 'get', '127.0.0.1', 8615, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-17 15:54:45', 0);
INSERT INTO `sys_log` VALUES (716, '2021-09-17 15:54:46', '管理商品', 'get', '127.0.0.1', 3161, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:54:46', 0);
INSERT INTO `sys_log` VALUES (717, '2021-09-17 15:54:46', '管理商品', 'get', '127.0.0.1', 3412, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:54:46', 0);
INSERT INTO `sys_log` VALUES (718, '2021-09-17 15:55:40', '管理商品', 'get', '127.0.0.1', 1147, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:55:40', 0);
INSERT INTO `sys_log` VALUES (719, '2021-09-17 15:55:49', '用户个人信息', 'get', '127.0.0.1', 291, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-17 15:55:49', 0);
INSERT INTO `sys_log` VALUES (720, '2021-09-17 15:55:49', '', 'get', '127.0.0.1', 3733, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-17 15:55:49', 0);
INSERT INTO `sys_log` VALUES (721, '2021-09-17 15:55:50', '管理商品', 'get', '127.0.0.1', 2286, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:55:50', 0);
INSERT INTO `sys_log` VALUES (722, '2021-09-17 15:55:50', '管理商品', 'get', '127.0.0.1', 2415, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:55:50', 0);
INSERT INTO `sys_log` VALUES (723, '2021-09-17 15:57:03', '管理商品', 'get', '127.0.0.1', 1295, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:57:03', 0);
INSERT INTO `sys_log` VALUES (724, '2021-09-17 15:57:11', '用户个人信息', 'get', '127.0.0.1', 323, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-17 15:57:11', 0);
INSERT INTO `sys_log` VALUES (725, '2021-09-17 15:57:11', '', 'get', '127.0.0.1', 4259, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-17 15:57:11', 0);
INSERT INTO `sys_log` VALUES (726, '2021-09-17 15:57:11', '管理商品', 'get', '127.0.0.1', 1985, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:57:11', 0);
INSERT INTO `sys_log` VALUES (727, '2021-09-17 15:57:11', '管理商品', 'get', '127.0.0.1', 2703, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:57:11', 0);
INSERT INTO `sys_log` VALUES (728, '2021-09-17 15:57:38', '管理商品', 'get', '127.0.0.1', 1184, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:57:38', 0);
INSERT INTO `sys_log` VALUES (729, '2021-09-17 15:57:58', '管理商品', 'get', '127.0.0.1', 1190, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:57:58', 0);
INSERT INTO `sys_log` VALUES (730, '2021-09-17 15:58:03', '用户个人信息', 'get', '127.0.0.1', 282, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-17 15:58:03', 0);
INSERT INTO `sys_log` VALUES (731, '2021-09-17 15:58:03', '', 'get', '127.0.0.1', 3257, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-17 15:58:03', 0);
INSERT INTO `sys_log` VALUES (732, '2021-09-17 15:58:04', '管理商品', 'get', '127.0.0.1', 1859, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:58:04', 0);
INSERT INTO `sys_log` VALUES (733, '2021-09-17 15:58:04', '管理商品', 'get', '127.0.0.1', 1961, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:58:04', 0);
INSERT INTO `sys_log` VALUES (734, '2021-09-17 15:58:14', '管理商品', 'get', '127.0.0.1', 1147, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:58:14', 0);
INSERT INTO `sys_log` VALUES (735, '2021-09-17 15:58:20', '用户个人信息', 'get', '127.0.0.1', 337, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-17 15:58:20', 0);
INSERT INTO `sys_log` VALUES (736, '2021-09-17 15:58:20', '', 'get', '127.0.0.1', 2415, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-17 15:58:20', 0);
INSERT INTO `sys_log` VALUES (737, '2021-09-17 15:58:21', '管理商品', 'get', '127.0.0.1', 3480, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:58:21', 0);
INSERT INTO `sys_log` VALUES (738, '2021-09-17 15:58:21', '管理商品', 'get', '127.0.0.1', 3694, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:58:21', 0);
INSERT INTO `sys_log` VALUES (739, '2021-09-17 15:59:19', '管理商品', 'get', '127.0.0.1', 1043, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:59:19', 0);
INSERT INTO `sys_log` VALUES (740, '2021-09-17 15:59:30', '用户个人信息', 'get', '127.0.0.1', 368, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-17 15:59:30', 0);
INSERT INTO `sys_log` VALUES (741, '2021-09-17 15:59:30', '', 'get', '127.0.0.1', 3301, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-17 15:59:30', 0);
INSERT INTO `sys_log` VALUES (742, '2021-09-17 15:59:31', '管理商品', 'get', '127.0.0.1', 2554, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:59:31', 0);
INSERT INTO `sys_log` VALUES (743, '2021-09-17 15:59:31', '管理商品', 'get', '127.0.0.1', 2876, 'admin', '/shop/product', '', 0, 1, '2021-09-17 15:59:31', 0);
INSERT INTO `sys_log` VALUES (744, '2021-09-17 16:01:19', '用户个人信息', 'get', '127.0.0.1', 366, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-17 16:01:19', 0);
INSERT INTO `sys_log` VALUES (745, '2021-09-17 16:01:19', '', 'get', '127.0.0.1', 3902, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-17 16:01:19', 0);
INSERT INTO `sys_log` VALUES (746, '2021-09-17 16:01:20', '用户个人信息', 'get', '127.0.0.1', 512, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-17 16:01:20', 0);
INSERT INTO `sys_log` VALUES (747, '2021-09-17 16:01:20', '', 'get', '127.0.0.1', 6301, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-17 16:01:20', 0);
INSERT INTO `sys_log` VALUES (748, '2021-09-17 16:01:20', '商品分类', 'get', '127.0.0.1', 475, 'admin', '/shop/cate', '', 0, 1, '2021-09-17 16:01:20', 0);
INSERT INTO `sys_log` VALUES (749, '2021-09-17 16:01:20', '管理商品', 'get', '127.0.0.1', 1878, 'admin', '/shop/product', '', 0, 1, '2021-09-17 16:01:20', 0);
INSERT INTO `sys_log` VALUES (750, '2021-09-17 16:01:20', '管理商品', 'get', '127.0.0.1', 2024, 'admin', '/shop/product', '', 0, 1, '2021-09-17 16:01:20', 0);
INSERT INTO `sys_log` VALUES (751, '2021-09-17 16:02:19', '管理商品', 'get', '127.0.0.1', 1030, 'admin', '/shop/product', '', 0, 1, '2021-09-17 16:02:19', 0);
INSERT INTO `sys_log` VALUES (752, '2021-09-17 16:02:25', '用户个人信息', 'get', '127.0.0.1', 305, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-17 16:02:25', 0);
INSERT INTO `sys_log` VALUES (753, '2021-09-17 16:02:25', '', 'get', '127.0.0.1', 5788, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-17 16:02:25', 0);
INSERT INTO `sys_log` VALUES (754, '2021-09-17 16:02:26', '管理商品', 'get', '127.0.0.1', 2012, 'admin', '/shop/product', '', 0, 1, '2021-09-17 16:02:26', 0);
INSERT INTO `sys_log` VALUES (755, '2021-09-17 16:02:26', '管理商品', 'get', '127.0.0.1', 2181, 'admin', '/shop/product', '', 0, 1, '2021-09-17 16:02:26', 0);
INSERT INTO `sys_log` VALUES (756, '2021-09-17 16:02:43', '管理商品', 'get', '127.0.0.1', 1250, 'admin', '/shop/product', '', 0, 1, '2021-09-17 16:02:43', 0);
INSERT INTO `sys_log` VALUES (757, '2021-09-17 16:02:53', '管理商品', 'get', '127.0.0.1', 1554, 'admin', '/shop/product', '', 0, 1, '2021-09-17 16:02:53', 0);
INSERT INTO `sys_log` VALUES (758, '2021-09-17 16:05:09', '管理商品', 'get', '127.0.0.1', 2643, 'admin', '/shop/product', '', 0, 1, '2021-09-17 16:05:09', 0);
INSERT INTO `sys_log` VALUES (759, '2021-09-17 16:05:09', '管理商品', 'get', '127.0.0.1', 3016, 'admin', '/shop/product', '', 0, 1, '2021-09-17 16:05:09', 0);
INSERT INTO `sys_log` VALUES (760, '2021-09-17 16:05:12', '管理商品', 'get', '127.0.0.1', 2052, 'admin', '/shop/product', '', 0, 1, '2021-09-17 16:05:12', 0);
INSERT INTO `sys_log` VALUES (761, '2021-09-17 16:05:20', '用户个人信息', 'get', '127.0.0.1', 449, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-17 16:05:20', 0);
INSERT INTO `sys_log` VALUES (762, '2021-09-17 16:05:20', '', 'get', '127.0.0.1', 3920, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-17 16:05:20', 0);
INSERT INTO `sys_log` VALUES (763, '2021-09-17 16:05:21', '管理商品', 'get', '127.0.0.1', 5337, 'admin', '/shop/product', '', 0, 1, '2021-09-17 16:05:21', 0);
INSERT INTO `sys_log` VALUES (764, '2021-09-17 16:05:21', '管理商品', 'get', '127.0.0.1', 5656, 'admin', '/shop/product', '', 0, 1, '2021-09-17 16:05:21', 0);
INSERT INTO `sys_log` VALUES (765, '2021-09-17 16:05:52', '管理商品', 'get', '127.0.0.1', 1558, 'admin', '/shop/product', '', 0, 1, '2021-09-17 16:05:52', 0);
INSERT INTO `sys_log` VALUES (766, '2021-09-17 16:05:52', '管理商品', 'get', '127.0.0.1', 1638, 'admin', '/shop/product', '', 0, 1, '2021-09-17 16:05:52', 0);
INSERT INTO `sys_log` VALUES (767, '2021-09-22 13:42:05', '', 'get', '127.0.0.1', 4057, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 13:42:05', 0);
INSERT INTO `sys_log` VALUES (768, '2021-09-22 13:42:15', '管理商品', 'get', '127.0.0.1', 16010, 'admin', '/shop/product', '', 0, 1, '2021-09-22 13:42:15', 0);
INSERT INTO `sys_log` VALUES (769, '2021-09-22 13:42:15', '管理商品', 'get', '127.0.0.1', 14910, 'admin', '/shop/product', '', 0, 1, '2021-09-22 13:42:15', 0);
INSERT INTO `sys_log` VALUES (770, '2021-09-22 13:42:27', '管理商品', 'get', '127.0.0.1', 2631, 'admin', '/shop/product', '', 0, 1, '2021-09-22 13:42:27', 0);
INSERT INTO `sys_log` VALUES (771, '2021-09-22 13:42:27', '管理商品', 'get', '127.0.0.1', 5977, 'admin', '/shop/product', '', 0, 1, '2021-09-22 13:42:27', 0);
INSERT INTO `sys_log` VALUES (772, '2021-09-22 13:43:17', '用户个人信息', 'get', '127.0.0.1', 373, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 13:43:17', 0);
INSERT INTO `sys_log` VALUES (773, '2021-09-22 13:43:17', '', 'get', '127.0.0.1', 2091, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 13:43:17', 0);
INSERT INTO `sys_log` VALUES (774, '2021-09-22 13:43:18', '管理商品', 'get', '127.0.0.1', 3937, 'admin', '/shop/product', '', 0, 1, '2021-09-22 13:43:18', 0);
INSERT INTO `sys_log` VALUES (775, '2021-09-22 13:43:18', '管理商品', 'get', '127.0.0.1', 4419, 'admin', '/shop/product', '', 0, 1, '2021-09-22 13:43:18', 0);
INSERT INTO `sys_log` VALUES (776, '2021-09-22 13:43:23', '菜单管理', 'get', '127.0.0.1', 1460, 'admin', '/admin/menu', '', 0, 1, '2021-09-22 13:43:23', 0);
INSERT INTO `sys_log` VALUES (777, '2021-09-22 13:43:29', '角色菜单数', 'get', '127.0.0.1', 1124, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-22 13:43:29', 0);
INSERT INTO `sys_log` VALUES (778, '2021-09-22 13:46:09', '管理商品', 'get', '127.0.0.1', 1267, 'admin', '/shop/product', '', 0, 1, '2021-09-22 13:46:09', 0);
INSERT INTO `sys_log` VALUES (779, '2021-09-22 14:00:17', '管理商品', 'get', '127.0.0.1', 1956, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:00:17', 0);
INSERT INTO `sys_log` VALUES (780, '2021-09-22 14:00:17', '管理商品', 'get', '127.0.0.1', 4819, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:00:17', 0);
INSERT INTO `sys_log` VALUES (781, '2021-09-22 14:00:19', '用户个人信息', 'get', '127.0.0.1', 557, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 14:00:19', 0);
INSERT INTO `sys_log` VALUES (782, '2021-09-22 14:00:19', '', 'get', '127.0.0.1', 2712, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 14:00:19', 0);
INSERT INTO `sys_log` VALUES (783, '2021-09-22 14:00:19', '管理商品', 'get', '127.0.0.1', 3657, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:00:19', 0);
INSERT INTO `sys_log` VALUES (784, '2021-09-22 14:00:19', '管理商品', 'get', '127.0.0.1', 4122, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:00:19', 0);
INSERT INTO `sys_log` VALUES (785, '2021-09-22 14:00:22', '管理商品', 'get', '127.0.0.1', 1804, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:00:22', 0);
INSERT INTO `sys_log` VALUES (786, '2021-09-22 14:00:22', '管理商品', 'get', '127.0.0.1', 2143, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:00:22', 0);
INSERT INTO `sys_log` VALUES (787, '2021-09-22 14:00:28', '用户退出', 'delete', '127.0.0.1', 202, 'admin', '/admin/auth/logout', '', 0, 1, '2021-09-22 14:00:28', 0);
INSERT INTO `sys_log` VALUES (788, '2021-09-22 14:00:34', '', 'get', '127.0.0.1', 1993, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 14:00:34', 0);
INSERT INTO `sys_log` VALUES (789, '2021-09-22 14:00:35', '管理商品', 'get', '127.0.0.1', 6437, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:00:35', 0);
INSERT INTO `sys_log` VALUES (790, '2021-09-22 14:00:35', '管理商品', 'get', '127.0.0.1', 8594, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:00:35', 0);
INSERT INTO `sys_log` VALUES (791, '2021-09-22 14:00:38', '管理商品', 'get', '127.0.0.1', 2693, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:00:38', 0);
INSERT INTO `sys_log` VALUES (792, '2021-09-22 14:00:38', '管理商品', 'get', '127.0.0.1', 2831, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:00:38', 0);
INSERT INTO `sys_log` VALUES (793, '2021-09-22 14:00:46', '管理商品', 'get', '127.0.0.1', 5020, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:00:46', 0);
INSERT INTO `sys_log` VALUES (794, '2021-09-22 14:00:46', '管理商品', 'get', '127.0.0.1', 5333, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:00:46', 0);
INSERT INTO `sys_log` VALUES (795, '2021-09-22 14:01:16', '用户个人信息', 'get', '127.0.0.1', 450, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 14:01:16', 0);
INSERT INTO `sys_log` VALUES (796, '2021-09-22 14:01:16', '', 'get', '127.0.0.1', 1891, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 14:01:16', 0);
INSERT INTO `sys_log` VALUES (797, '2021-09-22 14:02:57', '管理商品', 'get', '127.0.0.1', 1173, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:02:57', 0);
INSERT INTO `sys_log` VALUES (798, '2021-09-22 14:03:03', '用户个人信息', 'get', '127.0.0.1', 333, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 14:03:03', 0);
INSERT INTO `sys_log` VALUES (799, '2021-09-22 14:03:03', '', 'get', '127.0.0.1', 9712, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 14:03:03', 0);
INSERT INTO `sys_log` VALUES (800, '2021-09-22 14:03:04', '管理商品', 'get', '127.0.0.1', 2235, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:03:04', 0);
INSERT INTO `sys_log` VALUES (801, '2021-09-22 14:03:04', '管理商品', 'get', '127.0.0.1', 2662, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:03:04', 0);
INSERT INTO `sys_log` VALUES (802, '2021-09-22 14:03:20', '管理商品', 'get', '127.0.0.1', 3200, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:03:20', 0);
INSERT INTO `sys_log` VALUES (803, '2021-09-22 14:03:20', '管理商品', 'get', '127.0.0.1', 3212, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:03:20', 0);
INSERT INTO `sys_log` VALUES (804, '2021-09-22 14:03:41', '商品规格', 'get', '127.0.0.1', 4549, 'admin', '/shop/rule', '', 0, 1, '2021-09-22 14:03:41', 0);
INSERT INTO `sys_log` VALUES (805, '2021-09-22 14:03:55', '管理商品', 'get', '127.0.0.1', 2399, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:03:55', 0);
INSERT INTO `sys_log` VALUES (806, '2021-09-22 14:03:55', '管理商品', 'get', '127.0.0.1', 2221, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:03:55', 0);
INSERT INTO `sys_log` VALUES (807, '2021-09-22 14:03:57', '商品规格', 'get', '127.0.0.1', 608, 'admin', '/shop/rule', '', 0, 1, '2021-09-22 14:03:57', 0);
INSERT INTO `sys_log` VALUES (808, '2021-09-22 14:04:17', '管理商品', 'get', '127.0.0.1', 1973, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:04:17', 0);
INSERT INTO `sys_log` VALUES (809, '2021-09-22 14:04:17', '管理商品', 'get', '127.0.0.1', 1988, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:04:17', 0);
INSERT INTO `sys_log` VALUES (810, '2021-09-22 14:04:40', '角色菜单数', 'get', '127.0.0.1', 1372, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-22 14:04:40', 0);
INSERT INTO `sys_log` VALUES (811, '2021-09-22 14:09:08', '管理商品', 'get', '127.0.0.1', 2232, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:09:08', 0);
INSERT INTO `sys_log` VALUES (812, '2021-09-22 14:09:08', '管理商品', 'get', '127.0.0.1', 2730, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:09:08', 0);
INSERT INTO `sys_log` VALUES (813, '2021-09-22 14:09:11', '用户个人信息', 'get', '127.0.0.1', 278, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 14:09:11', 0);
INSERT INTO `sys_log` VALUES (814, '2021-09-22 14:09:11', '', 'get', '127.0.0.1', 3484, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 14:09:11', 0);
INSERT INTO `sys_log` VALUES (815, '2021-09-22 14:09:11', '管理商品', 'get', '127.0.0.1', 2127, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:09:11', 0);
INSERT INTO `sys_log` VALUES (816, '2021-09-22 14:09:11', '管理商品', 'get', '127.0.0.1', 3163, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:09:11', 0);
INSERT INTO `sys_log` VALUES (817, '2021-09-22 14:11:10', '管理商品', 'get', '127.0.0.1', 1752, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:11:10', 0);
INSERT INTO `sys_log` VALUES (818, '2021-09-22 14:11:10', '管理商品', 'get', '127.0.0.1', 1767, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:11:10', 0);
INSERT INTO `sys_log` VALUES (819, '2021-09-22 14:11:46', '管理商品', 'get', '127.0.0.1', 3073, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:11:46', 0);
INSERT INTO `sys_log` VALUES (820, '2021-09-22 14:11:46', '管理商品', 'get', '127.0.0.1', 3279, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:11:46', 0);
INSERT INTO `sys_log` VALUES (821, '2021-09-22 14:11:58', '用户个人信息', 'get', '127.0.0.1', 295, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 14:11:58', 0);
INSERT INTO `sys_log` VALUES (822, '2021-09-22 14:11:58', '', 'get', '127.0.0.1', 1796, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 14:11:58', 0);
INSERT INTO `sys_log` VALUES (823, '2021-09-22 14:13:16', '管理商品', 'get', '127.0.0.1', 1493, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:13:16', 0);
INSERT INTO `sys_log` VALUES (824, '2021-09-22 14:13:21', '用户个人信息', 'get', '127.0.0.1', 262, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 14:13:21', 0);
INSERT INTO `sys_log` VALUES (825, '2021-09-22 14:13:21', '', 'get', '127.0.0.1', 2317, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 14:13:21', 0);
INSERT INTO `sys_log` VALUES (826, '2021-09-22 14:13:22', '管理商品', 'get', '127.0.0.1', 4214, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:13:22', 0);
INSERT INTO `sys_log` VALUES (827, '2021-09-22 14:13:22', '管理商品', 'get', '127.0.0.1', 4718, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:13:22', 0);
INSERT INTO `sys_log` VALUES (828, '2021-09-22 14:14:01', '管理商品', 'get', '127.0.0.1', 2478, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:14:01', 0);
INSERT INTO `sys_log` VALUES (829, '2021-09-22 14:14:01', '管理商品', 'get', '127.0.0.1', 4116, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:14:01', 0);
INSERT INTO `sys_log` VALUES (830, '2021-09-22 14:14:03', '用户个人信息', 'get', '127.0.0.1', 347, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 14:14:03', 0);
INSERT INTO `sys_log` VALUES (831, '2021-09-22 14:14:03', '', 'get', '127.0.0.1', 3047, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 14:14:03', 0);
INSERT INTO `sys_log` VALUES (832, '2021-09-22 14:14:04', '管理商品', 'get', '127.0.0.1', 4493, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:14:04', 0);
INSERT INTO `sys_log` VALUES (833, '2021-09-22 14:14:04', '管理商品', 'get', '127.0.0.1', 5259, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:14:04', 0);
INSERT INTO `sys_log` VALUES (834, '2021-09-22 14:15:22', '商品分类', 'get', '127.0.0.1', 759, 'admin', '/shop/cate', '', 0, 1, '2021-09-22 14:15:22', 0);
INSERT INTO `sys_log` VALUES (835, '2021-09-22 14:15:25', '商品规格', 'get', '127.0.0.1', 598, 'admin', '/shop/rule', '', 0, 1, '2021-09-22 14:15:25', 0);
INSERT INTO `sys_log` VALUES (836, '2021-09-22 14:15:26', '管理商品', 'get', '127.0.0.1', 8815, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:15:26', 0);
INSERT INTO `sys_log` VALUES (837, '2021-09-22 14:15:26', '管理商品', 'get', '127.0.0.1', 5208, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:15:26', 0);
INSERT INTO `sys_log` VALUES (838, '2021-09-22 14:15:41', '菜单管理', 'get', '127.0.0.1', 1438, 'admin', '/admin/menu', '', 0, 1, '2021-09-22 14:15:41', 0);
INSERT INTO `sys_log` VALUES (839, '2021-09-22 14:16:14', '角色菜单数', 'get', '127.0.0.1', 1262, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-22 14:16:14', 0);
INSERT INTO `sys_log` VALUES (840, '2021-09-22 14:17:01', '管理商品', 'get', '127.0.0.1', 1060, 'admin', '/shop/product', '', 0, 1, '2021-09-22 14:17:01', 0);
INSERT INTO `sys_log` VALUES (841, '2021-09-22 14:23:10', '用户个人信息', 'get', '127.0.0.1', 894, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 14:23:10', 0);
INSERT INTO `sys_log` VALUES (842, '2021-09-22 14:23:10', '', 'get', '127.0.0.1', 3821, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 14:23:10', 0);
INSERT INTO `sys_log` VALUES (843, '2021-09-22 14:23:38', '用户个人信息', 'get', '127.0.0.1', 1630, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 14:23:38', 0);
INSERT INTO `sys_log` VALUES (844, '2021-09-22 14:23:38', '', 'get', '127.0.0.1', 2372, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 14:23:38', 0);
INSERT INTO `sys_log` VALUES (845, '2021-09-22 14:24:09', '用户个人信息', 'get', '127.0.0.1', 438, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 14:24:09', 0);
INSERT INTO `sys_log` VALUES (846, '2021-09-22 14:24:09', '', 'get', '127.0.0.1', 2825, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 14:24:09', 0);
INSERT INTO `sys_log` VALUES (847, '2021-09-22 14:25:05', '用户个人信息', 'get', '127.0.0.1', 1118, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 14:25:05', 0);
INSERT INTO `sys_log` VALUES (848, '2021-09-22 14:25:05', '', 'get', '127.0.0.1', 5101, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 14:25:05', 0);
INSERT INTO `sys_log` VALUES (849, '2021-09-22 14:30:18', '用户个人信息', 'get', '127.0.0.1', 882, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 14:30:18', 0);
INSERT INTO `sys_log` VALUES (850, '2021-09-22 14:30:18', '', 'get', '127.0.0.1', 2795, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 14:30:18', 0);
INSERT INTO `sys_log` VALUES (851, '2021-09-22 14:58:22', '用户个人信息', 'get', '127.0.0.1', 796, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 14:58:22', 0);
INSERT INTO `sys_log` VALUES (852, '2021-09-22 14:58:22', '', 'get', '127.0.0.1', 5596, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 14:58:22', 0);
INSERT INTO `sys_log` VALUES (853, '2021-09-22 14:58:46', '用户个人信息', 'get', '127.0.0.1', 329, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 14:58:46', 0);
INSERT INTO `sys_log` VALUES (854, '2021-09-22 14:58:46', '', 'get', '127.0.0.1', 5227, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 14:58:46', 0);
INSERT INTO `sys_log` VALUES (855, '2021-09-22 15:03:22', '用户个人信息', 'get', '127.0.0.1', 371, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:03:22', 0);
INSERT INTO `sys_log` VALUES (856, '2021-09-22 15:03:22', '', 'get', '127.0.0.1', 2041, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:03:22', 0);
INSERT INTO `sys_log` VALUES (857, '2021-09-22 15:05:47', '用户个人信息', 'get', '127.0.0.1', 660, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:05:47', 0);
INSERT INTO `sys_log` VALUES (858, '2021-09-22 15:05:48', '', 'get', '127.0.0.1', 3644, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:05:48', 0);
INSERT INTO `sys_log` VALUES (859, '2021-09-22 15:05:55', '角色菜单数', 'get', '127.0.0.1', 1346, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-22 15:05:55', 0);
INSERT INTO `sys_log` VALUES (860, '2021-09-22 15:05:58', '菜单编辑', 'put', '127.0.0.1', 5529, 'admin', '/admin/menu', '', 0, 1, '2021-09-22 15:05:58', 0);
INSERT INTO `sys_log` VALUES (861, '2021-09-22 15:05:58', '菜单管理', 'get', '127.0.0.1', 1502, 'admin', '/admin/menu', '', 0, 1, '2021-09-22 15:05:58', 0);
INSERT INTO `sys_log` VALUES (862, '2021-09-22 15:06:00', '用户个人信息', 'get', '127.0.0.1', 339, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:06:00', 0);
INSERT INTO `sys_log` VALUES (863, '2021-09-22 15:06:00', '', 'get', '127.0.0.1', 2048, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:06:00', 0);
INSERT INTO `sys_log` VALUES (864, '2021-09-22 15:06:00', '菜单管理', 'get', '127.0.0.1', 1143, 'admin', '/admin/menu', '', 0, 1, '2021-09-22 15:06:00', 0);
INSERT INTO `sys_log` VALUES (865, '2021-09-22 15:06:31', '用户个人信息', 'get', '127.0.0.1', 362, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:06:31', 0);
INSERT INTO `sys_log` VALUES (866, '2021-09-22 15:06:31', '', 'get', '127.0.0.1', 1858, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:06:31', 0);
INSERT INTO `sys_log` VALUES (867, '2021-09-22 15:06:38', '管理商品', 'get', '127.0.0.1', 1967, 'admin', '/shop/product', '', 0, 1, '2021-09-22 15:06:38', 0);
INSERT INTO `sys_log` VALUES (868, '2021-09-22 15:06:38', '管理商品', 'get', '127.0.0.1', 1944, 'admin', '/shop/product', '', 0, 1, '2021-09-22 15:06:38', 0);
INSERT INTO `sys_log` VALUES (869, '2021-09-22 15:06:45', '管理商品', 'get', '127.0.0.1', 9721, 'admin', '/shop/product', '', 0, 1, '2021-09-22 15:06:45', 0);
INSERT INTO `sys_log` VALUES (870, '2021-09-22 15:06:45', '管理商品', 'get', '127.0.0.1', 10237, 'admin', '/shop/product', '', 0, 1, '2021-09-22 15:06:45', 0);
INSERT INTO `sys_log` VALUES (871, '2021-09-22 15:07:04', '菜单管理', 'get', '127.0.0.1', 1457, 'admin', '/admin/menu', '', 0, 1, '2021-09-22 15:07:04', 0);
INSERT INTO `sys_log` VALUES (872, '2021-09-22 15:07:09', '角色菜单数', 'get', '127.0.0.1', 1442, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-22 15:07:09', 0);
INSERT INTO `sys_log` VALUES (873, '2021-09-22 15:07:11', '菜单编辑', 'put', '127.0.0.1', 1258, 'admin', '/admin/menu', '', 0, 1, '2021-09-22 15:07:11', 0);
INSERT INTO `sys_log` VALUES (874, '2021-09-22 15:07:11', '菜单管理', 'get', '127.0.0.1', 1579, 'admin', '/admin/menu', '', 0, 1, '2021-09-22 15:07:11', 0);
INSERT INTO `sys_log` VALUES (875, '2021-09-22 15:07:13', '用户个人信息', 'get', '127.0.0.1', 452, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:07:13', 0);
INSERT INTO `sys_log` VALUES (876, '2021-09-22 15:07:13', '', 'get', '127.0.0.1', 1697, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:07:13', 0);
INSERT INTO `sys_log` VALUES (877, '2021-09-22 15:07:13', '菜单管理', 'get', '127.0.0.1', 1537, 'admin', '/admin/menu', '', 0, 1, '2021-09-22 15:07:13', 0);
INSERT INTO `sys_log` VALUES (878, '2021-09-22 15:07:18', '管理商品', 'get', '127.0.0.1', 3126, 'admin', '/shop/product', '', 0, 1, '2021-09-22 15:07:18', 0);
INSERT INTO `sys_log` VALUES (879, '2021-09-22 15:07:18', '管理商品', 'get', '127.0.0.1', 2446, 'admin', '/shop/product', '', 0, 1, '2021-09-22 15:07:18', 0);
INSERT INTO `sys_log` VALUES (880, '2021-09-22 15:07:30', '用户个人信息', 'get', '127.0.0.1', 341, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:07:30', 0);
INSERT INTO `sys_log` VALUES (881, '2021-09-22 15:07:31', '', 'get', '127.0.0.1', 3453, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:07:31', 0);
INSERT INTO `sys_log` VALUES (882, '2021-09-22 15:08:45', '用户个人信息', 'get', '127.0.0.1', 728, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:08:45', 0);
INSERT INTO `sys_log` VALUES (883, '2021-09-22 15:08:45', '', 'get', '127.0.0.1', 8662, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:08:45', 0);
INSERT INTO `sys_log` VALUES (884, '2021-09-22 15:11:46', '用户个人信息', 'get', '127.0.0.1', 647, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:11:46', 0);
INSERT INTO `sys_log` VALUES (885, '2021-09-22 15:11:46', '', 'get', '127.0.0.1', 4667, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:11:46', 0);
INSERT INTO `sys_log` VALUES (886, '2021-09-22 15:11:46', '用户个人信息', 'get', '127.0.0.1', 367, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:11:46', 0);
INSERT INTO `sys_log` VALUES (887, '2021-09-22 15:11:46', '', 'get', '127.0.0.1', 4181, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:11:46', 0);
INSERT INTO `sys_log` VALUES (888, '2021-09-22 15:12:53', '用户个人信息', 'get', '127.0.0.1', 478, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:12:53', 0);
INSERT INTO `sys_log` VALUES (889, '2021-09-22 15:12:53', '用户个人信息', 'get', '127.0.0.1', 400, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:12:53', 0);
INSERT INTO `sys_log` VALUES (890, '2021-09-22 15:12:53', '', 'get', '127.0.0.1', 2916, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:12:53', 0);
INSERT INTO `sys_log` VALUES (891, '2021-09-22 15:12:54', '', 'get', '127.0.0.1', 6809, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:12:54', 0);
INSERT INTO `sys_log` VALUES (892, '2021-09-22 15:14:04', '用户个人信息', 'get', '127.0.0.1', 794, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:14:04', 0);
INSERT INTO `sys_log` VALUES (893, '2021-09-22 15:14:04', '用户个人信息', 'get', '127.0.0.1', 997, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:14:04', 0);
INSERT INTO `sys_log` VALUES (894, '2021-09-22 15:14:04', '', 'get', '127.0.0.1', 2259, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:14:04', 0);
INSERT INTO `sys_log` VALUES (895, '2021-09-22 15:14:04', '', 'get', '127.0.0.1', 3975, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:14:04', 0);
INSERT INTO `sys_log` VALUES (896, '2021-09-22 15:15:35', '用户个人信息', 'get', '127.0.0.1', 313, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:15:35', 0);
INSERT INTO `sys_log` VALUES (897, '2021-09-22 15:15:35', '', 'get', '127.0.0.1', 2788, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:15:35', 0);
INSERT INTO `sys_log` VALUES (898, '2021-09-22 15:19:14', '用户个人信息', 'get', '127.0.0.1', 807, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:19:14', 0);
INSERT INTO `sys_log` VALUES (899, '2021-09-22 15:19:14', '', 'get', '127.0.0.1', 7845, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:19:14', 0);
INSERT INTO `sys_log` VALUES (900, '2021-09-22 15:20:51', '用户个人信息', 'get', '127.0.0.1', 405, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:20:51', 0);
INSERT INTO `sys_log` VALUES (901, '2021-09-22 15:20:51', '', 'get', '127.0.0.1', 4311, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:20:51', 0);
INSERT INTO `sys_log` VALUES (902, '2021-09-22 15:21:16', '用户个人信息', 'get', '127.0.0.1', 700, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:21:16', 0);
INSERT INTO `sys_log` VALUES (903, '2021-09-22 15:21:16', '', 'get', '127.0.0.1', 3727, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:21:16', 0);
INSERT INTO `sys_log` VALUES (904, '2021-09-22 15:21:54', '用户个人信息', 'get', '127.0.0.1', 736, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:21:54', 0);
INSERT INTO `sys_log` VALUES (905, '2021-09-22 15:21:54', '', 'get', '127.0.0.1', 3961, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:21:54', 0);
INSERT INTO `sys_log` VALUES (906, '2021-09-22 15:22:04', '用户个人信息', 'get', '127.0.0.1', 540, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:22:04', 0);
INSERT INTO `sys_log` VALUES (907, '2021-09-22 15:22:04', '', 'get', '127.0.0.1', 2602, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:22:04', 0);
INSERT INTO `sys_log` VALUES (908, '2021-09-22 15:34:58', '用户个人信息', 'get', '127.0.0.1', 746, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:34:58', 0);
INSERT INTO `sys_log` VALUES (909, '2021-09-22 15:34:58', '', 'get', '127.0.0.1', 3157, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:34:58', 0);
INSERT INTO `sys_log` VALUES (910, '2021-09-22 15:35:05', '用户个人信息', 'get', '127.0.0.1', 455, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:35:05', 0);
INSERT INTO `sys_log` VALUES (911, '2021-09-22 15:35:05', '', 'get', '127.0.0.1', 3986, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:35:05', 0);
INSERT INTO `sys_log` VALUES (912, '2021-09-22 15:35:20', '用户个人信息', 'get', '127.0.0.1', 450, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:35:20', 0);
INSERT INTO `sys_log` VALUES (913, '2021-09-22 15:35:20', '', 'get', '127.0.0.1', 4325, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:35:20', 0);
INSERT INTO `sys_log` VALUES (914, '2021-09-22 15:35:23', '用户个人信息', 'get', '127.0.0.1', 707, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:35:23', 0);
INSERT INTO `sys_log` VALUES (915, '2021-09-22 15:35:23', '', 'get', '127.0.0.1', 4450, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:35:23', 0);
INSERT INTO `sys_log` VALUES (916, '2021-09-22 15:35:35', '用户个人信息', 'get', '127.0.0.1', 532, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:35:35', 0);
INSERT INTO `sys_log` VALUES (917, '2021-09-22 15:35:35', '', 'get', '127.0.0.1', 3244, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:35:35', 0);
INSERT INTO `sys_log` VALUES (918, '2021-09-22 15:36:06', '用户个人信息', 'get', '127.0.0.1', 857, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:36:06', 0);
INSERT INTO `sys_log` VALUES (919, '2021-09-22 15:36:06', '', 'get', '127.0.0.1', 4094, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:36:06', 0);
INSERT INTO `sys_log` VALUES (920, '2021-09-22 15:36:34', '用户个人信息', 'get', '127.0.0.1', 776, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:36:34', 0);
INSERT INTO `sys_log` VALUES (921, '2021-09-22 15:36:34', '', 'get', '127.0.0.1', 3141, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:36:34', 0);
INSERT INTO `sys_log` VALUES (922, '2021-09-22 15:41:05', '用户个人信息', 'get', '127.0.0.1', 420, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:41:05', 0);
INSERT INTO `sys_log` VALUES (923, '2021-09-22 15:41:05', '', 'get', '127.0.0.1', 2876, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:41:05', 0);
INSERT INTO `sys_log` VALUES (924, '2021-09-22 15:41:37', '用户个人信息', 'get', '127.0.0.1', 444, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:41:37', 0);
INSERT INTO `sys_log` VALUES (925, '2021-09-22 15:41:38', '', 'get', '127.0.0.1', 2342, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:41:38', 0);
INSERT INTO `sys_log` VALUES (926, '2021-09-22 15:43:34', '用户个人信息', 'get', '127.0.0.1', 937, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:43:34', 0);
INSERT INTO `sys_log` VALUES (927, '2021-09-22 15:43:34', '', 'get', '127.0.0.1', 4012, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:43:34', 0);
INSERT INTO `sys_log` VALUES (928, '2021-09-22 15:43:37', '用户个人信息', 'get', '127.0.0.1', 304, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:43:37', 0);
INSERT INTO `sys_log` VALUES (929, '2021-09-22 15:43:37', '', 'get', '127.0.0.1', 1536, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:43:37', 0);
INSERT INTO `sys_log` VALUES (930, '2021-09-22 15:43:37', '管理商品', 'get', '127.0.0.1', 1972, 'admin', '/shop/product', '', 0, 1, '2021-09-22 15:43:37', 0);
INSERT INTO `sys_log` VALUES (931, '2021-09-22 15:43:37', '管理商品', 'get', '127.0.0.1', 1853, 'admin', '/shop/product', '', 0, 1, '2021-09-22 15:43:37', 0);
INSERT INTO `sys_log` VALUES (932, '2021-09-22 15:43:39', '用户个人信息', 'get', '127.0.0.1', 535, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:43:39', 0);
INSERT INTO `sys_log` VALUES (933, '2021-09-22 15:43:39', '', 'get', '127.0.0.1', 2765, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:43:39', 0);
INSERT INTO `sys_log` VALUES (934, '2021-09-22 15:43:40', '管理商品', 'get', '127.0.0.1', 2115, 'admin', '/shop/product', '', 0, 1, '2021-09-22 15:43:40', 0);
INSERT INTO `sys_log` VALUES (935, '2021-09-22 15:43:40', '管理商品', 'get', '127.0.0.1', 2396, 'admin', '/shop/product', '', 0, 1, '2021-09-22 15:43:40', 0);
INSERT INTO `sys_log` VALUES (936, '2021-09-22 15:44:44', '用户个人信息', 'get', '127.0.0.1', 1002, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:44:44', 0);
INSERT INTO `sys_log` VALUES (937, '2021-09-22 15:44:44', '', 'get', '127.0.0.1', 4507, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:44:44', 0);
INSERT INTO `sys_log` VALUES (938, '2021-09-22 15:44:47', '用户个人信息', 'get', '127.0.0.1', 399, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:44:47', 0);
INSERT INTO `sys_log` VALUES (939, '2021-09-22 15:44:47', '', 'get', '127.0.0.1', 2102, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:44:47', 0);
INSERT INTO `sys_log` VALUES (940, '2021-09-22 15:44:47', '管理商品', 'get', '127.0.0.1', 2331, 'admin', '/shop/product', '', 0, 1, '2021-09-22 15:44:47', 0);
INSERT INTO `sys_log` VALUES (941, '2021-09-22 15:44:47', '管理商品', 'get', '127.0.0.1', 2412, 'admin', '/shop/product', '', 0, 1, '2021-09-22 15:44:47', 0);
INSERT INTO `sys_log` VALUES (942, '2021-09-22 15:44:50', '菜单管理', 'get', '127.0.0.1', 1467, 'admin', '/admin/menu', '', 0, 1, '2021-09-22 15:44:50', 0);
INSERT INTO `sys_log` VALUES (943, '2021-09-22 15:45:06', '角色菜单数', 'get', '127.0.0.1', 1202, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-22 15:45:06', 0);
INSERT INTO `sys_log` VALUES (944, '2021-09-22 15:45:21', '字典管理', 'get', '127.0.0.1', 12406, 'admin', '/admin/dict', '', 0, 1, '2021-09-22 15:45:21', 0);
INSERT INTO `sys_log` VALUES (945, '2021-09-22 15:45:24', '字典详情列表', 'get', '127.0.0.1', 3080, 'admin', '/admin/dictDetail', '', 0, 1, '2021-09-22 15:45:24', 0);
INSERT INTO `sys_log` VALUES (946, '2021-09-22 15:45:28', '角色菜单数', 'get', '127.0.0.1', 1324, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-22 15:45:28', 0);
INSERT INTO `sys_log` VALUES (947, '2021-09-22 15:46:18', '角色菜单数', 'get', '127.0.0.1', 1042, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-22 15:46:18', 0);
INSERT INTO `sys_log` VALUES (948, '2021-09-22 15:46:27', '角色菜单数', 'get', '127.0.0.1', 1121, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-22 15:46:27', 0);
INSERT INTO `sys_log` VALUES (949, '2021-09-22 15:46:47', '菜单编辑', 'put', '127.0.0.1', 1654, 'admin', '/admin/menu', '', 0, 1, '2021-09-22 15:46:47', 0);
INSERT INTO `sys_log` VALUES (950, '2021-09-22 15:46:47', '菜单管理', 'get', '127.0.0.1', 1523, 'admin', '/admin/menu', '', 0, 1, '2021-09-22 15:46:47', 0);
INSERT INTO `sys_log` VALUES (951, '2021-09-22 15:47:11', '用户个人信息', 'get', '127.0.0.1', 1914, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:47:11', 0);
INSERT INTO `sys_log` VALUES (952, '2021-09-22 15:47:11', '', 'get', '127.0.0.1', 2613, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:47:11', 0);
INSERT INTO `sys_log` VALUES (953, '2021-09-22 15:47:30', '角色菜单数', 'get', '127.0.0.1', 1433, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-22 15:47:30', 0);
INSERT INTO `sys_log` VALUES (954, '2021-09-22 15:47:47', '菜单编辑', 'put', '127.0.0.1', 1145, 'admin', '/admin/menu', '', 0, 1, '2021-09-22 15:47:47', 0);
INSERT INTO `sys_log` VALUES (955, '2021-09-22 15:47:47', '菜单管理', 'get', '127.0.0.1', 1482, 'admin', '/admin/menu', '', 0, 1, '2021-09-22 15:47:47', 0);
INSERT INTO `sys_log` VALUES (956, '2021-09-22 15:47:50', '用户个人信息', 'get', '127.0.0.1', 460, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:47:50', 0);
INSERT INTO `sys_log` VALUES (957, '2021-09-22 15:47:50', '', 'get', '127.0.0.1', 2269, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:47:50', 0);
INSERT INTO `sys_log` VALUES (958, '2021-09-22 15:48:05', '角色菜单数', 'get', '127.0.0.1', 1252, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-22 15:48:05', 0);
INSERT INTO `sys_log` VALUES (959, '2021-09-22 15:49:18', '菜单编辑', 'put', '127.0.0.1', 1123, 'admin', '/admin/menu', '', 0, 1, '2021-09-22 15:49:18', 0);
INSERT INTO `sys_log` VALUES (960, '2021-09-22 15:49:18', '菜单管理', 'get', '127.0.0.1', 1341, 'admin', '/admin/menu', '', 0, 1, '2021-09-22 15:49:18', 0);
INSERT INTO `sys_log` VALUES (961, '2021-09-22 15:49:21', '用户个人信息', 'get', '127.0.0.1', 337, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:49:21', 0);
INSERT INTO `sys_log` VALUES (962, '2021-09-22 15:49:21', '', 'get', '127.0.0.1', 2322, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:49:21', 0);
INSERT INTO `sys_log` VALUES (963, '2021-09-22 15:49:22', '字典管理', 'get', '127.0.0.1', 876, 'admin', '/admin/dict', '', 0, 1, '2021-09-22 15:49:22', 0);
INSERT INTO `sys_log` VALUES (964, '2021-09-22 15:49:28', '字典详情列表', 'get', '127.0.0.1', 676, 'admin', '/admin/dictDetail', '', 0, 1, '2021-09-22 15:49:28', 0);
INSERT INTO `sys_log` VALUES (965, '2021-09-22 15:49:33', '管理商品', 'get', '127.0.0.1', 2663, 'admin', '/shop/product', '', 0, 1, '2021-09-22 15:49:33', 0);
INSERT INTO `sys_log` VALUES (966, '2021-09-22 15:49:33', '管理商品', 'get', '127.0.0.1', 3917, 'admin', '/shop/product', '', 0, 1, '2021-09-22 15:49:33', 0);
INSERT INTO `sys_log` VALUES (967, '2021-09-22 15:52:47', '用户个人信息', 'get', '127.0.0.1', 939, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:52:47', 0);
INSERT INTO `sys_log` VALUES (968, '2021-09-22 15:52:47', '', 'get', '127.0.0.1', 3422, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:52:47', 0);
INSERT INTO `sys_log` VALUES (969, '2021-09-22 15:52:47', '用户个人信息', 'get', '127.0.0.1', 646, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 15:52:47', 0);
INSERT INTO `sys_log` VALUES (970, '2021-09-22 15:52:47', '', 'get', '127.0.0.1', 1502, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 15:52:47', 0);
INSERT INTO `sys_log` VALUES (971, '2021-09-22 15:52:47', '菜单管理', 'get', '127.0.0.1', 1577, 'admin', '/admin/menu', '', 0, 1, '2021-09-22 15:52:47', 0);
INSERT INTO `sys_log` VALUES (972, '2021-09-22 16:00:07', '用户个人信息', 'get', '127.0.0.1', 581, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 16:00:07', 0);
INSERT INTO `sys_log` VALUES (973, '2021-09-22 16:00:07', '用户个人信息', 'get', '127.0.0.1', 498, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-22 16:00:07', 0);
INSERT INTO `sys_log` VALUES (974, '2021-09-22 16:00:07', '', 'get', '127.0.0.1', 1604, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 16:00:07', 0);
INSERT INTO `sys_log` VALUES (975, '2021-09-22 16:00:07', '', 'get', '127.0.0.1', 1714, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-22 16:00:07', 0);
INSERT INTO `sys_log` VALUES (976, '2021-09-22 16:00:07', '菜单管理', 'get', '127.0.0.1', 1877, 'admin', '/admin/menu', '', 0, 1, '2021-09-22 16:00:07', 0);
INSERT INTO `sys_log` VALUES (977, '2021-09-26 15:59:26', '', 'get', '127.0.0.1', 1609, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-26 15:59:26', 0);
INSERT INTO `sys_log` VALUES (978, '2021-09-26 16:03:44', '管理商品', 'get', '127.0.0.1', 15038, 'admin', '/shop/product', '', 0, 1, '2021-09-26 16:03:44', 0);
INSERT INTO `sys_log` VALUES (979, '2021-09-26 16:03:44', '管理商品', 'get', '127.0.0.1', 12757, 'admin', '/shop/product', '', 0, 1, '2021-09-26 16:03:44', 0);
INSERT INTO `sys_log` VALUES (980, '2021-09-26 16:27:29', '管理商品', 'get', '127.0.0.1', 3460, 'admin', '/shop/product', '', 0, 1, '2021-09-26 16:27:29', 0);
INSERT INTO `sys_log` VALUES (981, '2021-09-26 16:27:29', '管理商品', 'get', '127.0.0.1', 4395, 'admin', '/shop/product', '', 0, 1, '2021-09-26 16:27:29', 0);
INSERT INTO `sys_log` VALUES (982, '2021-09-26 16:27:52', '用户个人信息', 'get', '127.0.0.1', 349, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-26 16:27:52', 0);
INSERT INTO `sys_log` VALUES (983, '2021-09-26 16:27:52', '', 'get', '127.0.0.1', 2056, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-26 16:27:52', 0);
INSERT INTO `sys_log` VALUES (984, '2021-09-26 16:28:18', '菜单管理', 'get', '127.0.0.1', 1594, 'admin', '/admin/menu', '', 0, 1, '2021-09-26 16:28:18', 0);
INSERT INTO `sys_log` VALUES (985, '2021-09-26 16:28:32', '角色菜单数', 'get', '127.0.0.1', 1275, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-26 16:28:32', 0);
INSERT INTO `sys_log` VALUES (986, '2021-09-26 16:28:51', '菜单管理', 'get', '127.0.0.1', 1814, 'admin', '/admin/menu', '', 0, 1, '2021-09-26 16:28:51', 0);
INSERT INTO `sys_log` VALUES (987, '2021-09-26 16:28:53', '角色菜单数', 'get', '127.0.0.1', 1503, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-26 16:28:53', 0);
INSERT INTO `sys_log` VALUES (988, '2021-09-26 16:29:24', '角色菜单数', 'get', '127.0.0.1', 1443, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-26 16:29:24', 0);
INSERT INTO `sys_log` VALUES (989, '2021-09-26 16:30:19', '角色菜单数', 'get', '127.0.0.1', 1321, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-26 16:30:19', 0);
INSERT INTO `sys_log` VALUES (990, '2021-09-26 16:31:23', '菜单新增', 'post', '127.0.0.1', 2207, 'admin', '/admin/menu', '', 0, 1, '2021-09-26 16:31:23', 0);
INSERT INTO `sys_log` VALUES (991, '2021-09-26 16:31:23', '菜单管理', 'get', '127.0.0.1', 2207, 'admin', '/admin/menu', '', 0, 1, '2021-09-26 16:31:23', 0);
INSERT INTO `sys_log` VALUES (992, '2021-09-26 16:31:32', '角色菜单数', 'get', '127.0.0.1', 2388, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-26 16:31:32', 0);
INSERT INTO `sys_log` VALUES (993, '2021-09-26 16:31:32', '角色管理', 'get', '127.0.0.1', 12160, 'admin', '/admin/roles', '', 0, 1, '2021-09-26 16:31:32', 0);
INSERT INTO `sys_log` VALUES (994, '2021-09-26 16:31:32', '角色管理', 'get', '127.0.0.1', 4465, 'admin', '/admin/roles', '', 0, 1, '2021-09-26 16:31:32', 0);
INSERT INTO `sys_log` VALUES (995, '2021-09-26 16:31:45', '角色菜单保存', 'put', '127.0.0.1', 7837, 'admin', '/admin/roles/menu', '', 0, 1, '2021-09-26 16:31:45', 0);
INSERT INTO `sys_log` VALUES (996, '2021-09-26 16:31:45', '单个角色', 'get', '127.0.0.1', 2092, 'admin', '/admin/roles/*', '', 0, 1, '2021-09-26 16:31:45', 0);
INSERT INTO `sys_log` VALUES (997, '2021-09-26 16:31:53', '用户退出', 'delete', '127.0.0.1', 206, 'admin', '/admin/auth/logout', '', 0, 1, '2021-09-26 16:31:53', 0);
INSERT INTO `sys_log` VALUES (998, '2021-09-26 16:31:58', '', 'get', '127.0.0.1', 1076, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-26 16:31:58', 0);
INSERT INTO `sys_log` VALUES (999, '2021-09-26 16:31:59', '角色菜单数', 'get', '127.0.0.1', 1528, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-26 16:31:59', 0);
INSERT INTO `sys_log` VALUES (1000, '2021-09-26 16:31:59', '角色管理', 'get', '127.0.0.1', 16071, 'admin', '/admin/roles', '', 0, 1, '2021-09-26 16:31:59', 0);
INSERT INTO `sys_log` VALUES (1001, '2021-09-26 16:31:59', '角色管理', 'get', '127.0.0.1', 6858, 'admin', '/admin/roles', '', 0, 1, '2021-09-26 16:31:59', 0);
INSERT INTO `sys_log` VALUES (1002, '2021-09-26 16:32:04', '管理商品', 'get', '127.0.0.1', 4432, 'admin', '/shop/product', '', 0, 1, '2021-09-26 16:32:04', 0);
INSERT INTO `sys_log` VALUES (1003, '2021-09-26 16:32:04', '管理商品', 'get', '127.0.0.1', 5392, 'admin', '/shop/product', '', 0, 1, '2021-09-26 16:32:04', 0);
INSERT INTO `sys_log` VALUES (1004, '2021-09-26 16:32:10', '商品信息', 'get', '127.0.0.1', 195, 'admin', '/shop/product/info/*', '', 0, 1, '2021-09-26 16:32:10', 0);
INSERT INTO `sys_log` VALUES (1005, '2021-09-26 16:32:53', '管理商品', 'get', '127.0.0.1', 2448, 'admin', '/shop/product', '', 0, 1, '2021-09-26 16:32:53', 0);
INSERT INTO `sys_log` VALUES (1006, '2021-09-26 16:32:53', '管理商品', 'get', '127.0.0.1', 2094, 'admin', '/shop/product', '', 0, 1, '2021-09-26 16:32:53', 0);
INSERT INTO `sys_log` VALUES (1007, '2021-09-26 16:32:56', '商品信息', 'get', '127.0.0.1', 5019, 'admin', '/shop/product/info/*', '', 0, 1, '2021-09-26 16:32:56', 0);
INSERT INTO `sys_log` VALUES (1008, '2021-09-26 16:40:32', '商品信息', 'get', '127.0.0.1', 2800, 'admin', '/shop/product/info/*', '', 0, 1, '2021-09-26 16:40:32', 0);
INSERT INTO `sys_log` VALUES (1009, '2021-09-26 16:40:47', '商品规格', 'get', '127.0.0.1', 699, 'admin', '/shop/rule', '', 0, 1, '2021-09-26 16:40:47', 0);
INSERT INTO `sys_log` VALUES (1010, '2021-09-26 16:40:58', '规格删除', 'delete', '127.0.0.1', 4761, 'admin', '/shop/rule', '', 0, 1, '2021-09-26 16:40:58', 0);
INSERT INTO `sys_log` VALUES (1011, '2021-09-26 16:40:58', '商品规格', 'get', '127.0.0.1', 701, 'admin', '/shop/rule', '', 0, 1, '2021-09-26 16:40:58', 0);
INSERT INTO `sys_log` VALUES (1012, '2021-09-26 16:41:08', '规格删除', 'delete', '127.0.0.1', 1086, 'admin', '/shop/rule', '', 0, 1, '2021-09-26 16:41:08', 0);
INSERT INTO `sys_log` VALUES (1013, '2021-09-26 16:41:08', '商品规格', 'get', '127.0.0.1', 605, 'admin', '/shop/rule', '', 0, 1, '2021-09-26 16:41:08', 0);
INSERT INTO `sys_log` VALUES (1014, '2021-09-26 16:41:10', '商品分类', 'get', '127.0.0.1', 519, 'admin', '/shop/cate', '', 0, 1, '2021-09-26 16:41:10', 0);
INSERT INTO `sys_log` VALUES (1015, '2021-09-26 16:41:11', '管理商品', 'get', '127.0.0.1', 2551, 'admin', '/shop/product', '', 0, 1, '2021-09-26 16:41:11', 0);
INSERT INTO `sys_log` VALUES (1016, '2021-09-26 16:41:11', '管理商品', 'get', '127.0.0.1', 2815, 'admin', '/shop/product', '', 0, 1, '2021-09-26 16:41:11', 0);
INSERT INTO `sys_log` VALUES (1017, '2021-09-26 16:41:13', '商品信息', 'get', '127.0.0.1', 924, 'admin', '/shop/product/info/*', '', 0, 1, '2021-09-26 16:41:13', 0);
INSERT INTO `sys_log` VALUES (1018, '2021-09-26 16:41:26', '用户个人信息', 'get', '127.0.0.1', 381, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-26 16:41:26', 0);
INSERT INTO `sys_log` VALUES (1019, '2021-09-26 16:41:26', '', 'get', '127.0.0.1', 1721, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-26 16:41:26', 0);
INSERT INTO `sys_log` VALUES (1020, '2021-09-26 16:41:26', '', 'get', '127.0.0.1', 6996, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-26 16:41:26', 0);
INSERT INTO `sys_log` VALUES (1021, '2021-09-26 16:42:06', '', 'get', '127.0.0.1', 679, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-26 16:42:06', 0);
INSERT INTO `sys_log` VALUES (1022, '2021-09-26 16:42:12', '商品分类', 'get', '127.0.0.1', 402, 'admin', '/shop/cate', '', 0, 1, '2021-09-26 16:42:12', 0);
INSERT INTO `sys_log` VALUES (1023, '2021-09-26 16:42:17', '商品分类', 'get', '127.0.0.1', 547, 'admin', '/shop/cate', '', 0, 1, '2021-09-26 16:42:17', 0);
INSERT INTO `sys_log` VALUES (1024, '2021-09-26 16:42:18', '', 'get', '127.0.0.1', 365, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-26 16:42:18', 0);
INSERT INTO `sys_log` VALUES (1025, '2021-09-26 16:45:00', '管理商品', 'get', '127.0.0.1', 2584, 'admin', '/shop/product', '', 0, 1, '2021-09-26 16:45:00', 0);
INSERT INTO `sys_log` VALUES (1026, '2021-09-26 16:45:00', '管理商品', 'get', '127.0.0.1', 3053, 'admin', '/shop/product', '', 0, 1, '2021-09-26 16:45:00', 0);
INSERT INTO `sys_log` VALUES (1027, '2021-09-26 16:45:02', '商品信息', 'get', '127.0.0.1', 835, 'admin', '/shop/product/info/*', '', 0, 1, '2021-09-26 16:45:02', 0);
INSERT INTO `sys_log` VALUES (1028, '2021-09-26 16:45:03', '', 'get', '127.0.0.1', 587, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-26 16:45:03', 0);
INSERT INTO `sys_log` VALUES (1029, '2021-09-26 16:45:38', '', 'get', '127.0.0.1', 388, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-26 16:45:38', 0);
INSERT INTO `sys_log` VALUES (1030, '2021-09-26 16:48:36', '', 'get', '127.0.0.1', 559, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-26 16:48:36', 0);
INSERT INTO `sys_log` VALUES (1031, '2021-09-26 16:51:54', '', 'get', '127.0.0.1', 361, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-26 16:51:54', 0);
INSERT INTO `sys_log` VALUES (1032, '2021-09-26 16:52:17', '用户个人信息', 'get', '127.0.0.1', 404, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-26 16:52:17', 0);
INSERT INTO `sys_log` VALUES (1033, '2021-09-26 16:52:17', '', 'get', '127.0.0.1', 1703, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-26 16:52:17', 0);
INSERT INTO `sys_log` VALUES (1034, '2021-09-26 16:52:18', '', 'get', '127.0.0.1', 567, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-26 16:52:18', 0);
INSERT INTO `sys_log` VALUES (1035, '2021-09-26 16:54:32', '用户个人信息', 'get', '127.0.0.1', 269, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-26 16:54:32', 0);
INSERT INTO `sys_log` VALUES (1036, '2021-09-26 16:54:32', '', 'get', '127.0.0.1', 3534, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-26 16:54:32', 0);
INSERT INTO `sys_log` VALUES (1037, '2021-09-26 16:54:32', '', 'get', '127.0.0.1', 457, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-26 16:54:32', 0);
INSERT INTO `sys_log` VALUES (1038, '2021-09-26 16:55:07', '', 'get', '127.0.0.1', 436, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-26 16:55:07', 0);
INSERT INTO `sys_log` VALUES (1039, '2021-09-26 16:55:15', '用户个人信息', 'get', '127.0.0.1', 261, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-26 16:55:15', 0);
INSERT INTO `sys_log` VALUES (1040, '2021-09-26 16:55:15', '', 'get', '127.0.0.1', 13146, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-26 16:55:15', 0);
INSERT INTO `sys_log` VALUES (1041, '2021-09-26 16:55:16', '', 'get', '127.0.0.1', 557, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-26 16:55:16', 0);
INSERT INTO `sys_log` VALUES (1042, '2021-09-28 14:41:32', '', 'get', '127.0.0.1', 2072, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-28 14:41:32', 0);
INSERT INTO `sys_log` VALUES (1043, '2021-09-28 14:41:47', '管理商品', 'get', '127.0.0.1', 15260, 'admin', '/shop/product', '', 0, 1, '2021-09-28 14:41:47', 0);
INSERT INTO `sys_log` VALUES (1044, '2021-09-28 14:41:47', '管理商品', 'get', '127.0.0.1', 17387, 'admin', '/shop/product', '', 0, 1, '2021-09-28 14:41:47', 0);
INSERT INTO `sys_log` VALUES (1045, '2021-09-28 14:42:04', '商品信息', 'get', '127.0.0.1', 10614, 'admin', '/shop/product/info/*', '', 0, 1, '2021-09-28 14:42:04', 0);
INSERT INTO `sys_log` VALUES (1046, '2021-09-28 14:42:31', '', 'get', '127.0.0.1', 5035, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-28 14:42:31', 0);
INSERT INTO `sys_log` VALUES (1047, '2021-09-28 14:42:41', '', 'get', '127.0.0.1', 524, 'admin', '/admin/materialgroup', '', 0, 1, '2021-09-28 14:42:41', 0);
INSERT INTO `sys_log` VALUES (1048, '2021-09-28 14:44:07', '用户个人信息', 'get', '127.0.0.1', 500, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-28 14:44:07', 0);
INSERT INTO `sys_log` VALUES (1049, '2021-09-28 14:44:07', '', 'get', '127.0.0.1', 1429, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-28 14:44:07', 0);
INSERT INTO `sys_log` VALUES (1050, '2021-09-28 14:44:07', '商品信息', 'get', '127.0.0.1', 660, 'admin', '/shop/product/info/*', '', 0, 1, '2021-09-28 14:44:07', 0);
INSERT INTO `sys_log` VALUES (1051, '2021-09-28 14:46:02', '字典管理', 'get', '127.0.0.1', 10838, 'admin', '/admin/dict', '', 0, 1, '2021-09-28 14:46:02', 0);
INSERT INTO `sys_log` VALUES (1052, '2021-09-28 14:46:05', '菜单管理', 'get', '127.0.0.1', 1682, 'admin', '/admin/menu', '', 0, 1, '2021-09-28 14:46:05', 0);
INSERT INTO `sys_log` VALUES (1053, '2021-09-28 14:46:29', '角色菜单数', 'get', '127.0.0.1', 1359, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-28 14:46:29', 0);
INSERT INTO `sys_log` VALUES (1054, '2021-09-28 14:48:29', '菜单编辑', 'put', '127.0.0.1', 1305, 'admin', '/admin/menu', '', 0, 1, '2021-09-28 14:48:29', 0);
INSERT INTO `sys_log` VALUES (1055, '2021-09-28 14:48:29', '菜单管理', 'get', '127.0.0.1', 1380, 'admin', '/admin/menu', '', 0, 1, '2021-09-28 14:48:29', 0);
INSERT INTO `sys_log` VALUES (1056, '2021-09-28 14:49:26', '用户个人信息', 'get', '127.0.0.1', 473, 'admin', '/admin/auth/info', '', 0, 1, '2021-09-28 14:49:26', 0);
INSERT INTO `sys_log` VALUES (1057, '2021-09-28 14:49:26', '', 'get', '127.0.0.1', 1109, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-28 14:49:26', 0);
INSERT INTO `sys_log` VALUES (1058, '2021-09-28 14:49:27', '菜单管理', 'get', '127.0.0.1', 1305, 'admin', '/admin/menu', '', 0, 1, '2021-09-28 14:49:27', 0);
INSERT INTO `sys_log` VALUES (1059, '2021-09-28 14:49:29', '角色菜单数', 'get', '127.0.0.1', 1290, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-28 14:49:29', 0);
INSERT INTO `sys_log` VALUES (1060, '2021-09-28 14:49:36', '角色菜单数', 'get', '127.0.0.1', 1250, 'admin', '/admin/menu/tree', '', 0, 1, '2021-09-28 14:49:36', 0);
INSERT INTO `sys_log` VALUES (1061, '2021-09-28 14:52:32', '', 'post', '127.0.0.1', 263, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-09-28 14:52:32', 0);
INSERT INTO `sys_log` VALUES (1062, '2021-09-28 15:13:22', '', 'post', '127.0.0.1', 267, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-09-28 15:13:22', 0);
INSERT INTO `sys_log` VALUES (1063, '2021-09-28 15:16:30', '', 'post', '127.0.0.1', 91, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-09-28 15:16:30', 0);
INSERT INTO `sys_log` VALUES (1064, '2021-09-28 15:17:48', '', 'post', '127.0.0.1', 133, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-09-28 15:17:48', 0);
INSERT INTO `sys_log` VALUES (1065, '2021-09-28 15:22:56', '', 'post', '127.0.0.1', 146, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-09-28 15:22:56', 0);
INSERT INTO `sys_log` VALUES (1066, '2021-09-28 15:29:14', '', 'post', '127.0.0.1', 131, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-09-28 15:29:14', 0);
INSERT INTO `sys_log` VALUES (1067, '2021-09-28 15:51:07', '', 'post', '127.0.0.1', 79, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-09-28 15:51:07', 0);
INSERT INTO `sys_log` VALUES (1068, '2021-09-28 15:51:44', '', 'post', '127.0.0.1', 101, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-09-28 15:51:44', 0);
INSERT INTO `sys_log` VALUES (1069, '2021-09-28 15:51:54', '', 'post', '127.0.0.1', 61, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-09-28 15:51:54', 0);
INSERT INTO `sys_log` VALUES (1070, '2021-09-28 15:58:55', '', 'post', '127.0.0.1', 89, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-09-28 15:58:55', 0);
INSERT INTO `sys_log` VALUES (1071, '2021-09-28 16:12:55', '', 'post', '127.0.0.1', 129, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-09-28 16:12:55', 0);
INSERT INTO `sys_log` VALUES (1072, '2021-09-28 16:20:25', '', 'post', '127.0.0.1', 125, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-09-28 16:20:25', 0);
INSERT INTO `sys_log` VALUES (1073, '2021-09-28 16:22:00', '', 'post', '127.0.0.1', 107, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-09-28 16:22:00', 0);
INSERT INTO `sys_log` VALUES (1074, '2021-09-28 16:22:20', '', 'post', '127.0.0.1', 161, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-09-28 16:22:20', 0);
INSERT INTO `sys_log` VALUES (1075, '2021-09-28 16:27:48', '', 'post', '127.0.0.1', 149, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-09-28 16:27:48', 0);
INSERT INTO `sys_log` VALUES (1076, '2021-09-28 16:28:17', '', 'post', '127.0.0.1', 171, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-09-28 16:28:17', 0);
INSERT INTO `sys_log` VALUES (1077, '2021-09-29 13:55:42', '', 'get', '127.0.0.1', 2910, 'admin', '/admin/menu/build', '', 0, 1, '2021-09-29 13:55:42', 0);
INSERT INTO `sys_log` VALUES (1078, '2021-09-29 14:11:33', '管理商品', 'get', '127.0.0.1', 23428, 'admin', '/shop/product', '', 0, 1, '2021-09-29 14:11:33', 0);
INSERT INTO `sys_log` VALUES (1079, '2021-09-29 14:11:33', '管理商品', 'get', '127.0.0.1', 22792, 'admin', '/shop/product', '', 0, 1, '2021-09-29 14:11:33', 0);
INSERT INTO `sys_log` VALUES (1080, '2021-09-29 14:16:01', '商品信息', 'get', '127.0.0.1', 10158, 'admin', '/shop/product/info/*', '', 0, 1, '2021-09-29 14:16:01', 0);
INSERT INTO `sys_log` VALUES (1081, '2021-09-29 14:18:18', '', 'post', '127.0.0.1', 152, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-09-29 14:18:18', 0);
INSERT INTO `sys_log` VALUES (1082, '2021-10-05 10:02:12', '', 'get', '127.0.0.1', 3957, 'admin', '/admin/menu/build', '', 0, 1, '2021-10-05 10:02:12', 0);
INSERT INTO `sys_log` VALUES (1083, '2021-10-05 10:02:23', '管理商品', 'get', '127.0.0.1', 13769, 'admin', '/shop/product', '', 0, 1, '2021-10-05 10:02:23', 0);
INSERT INTO `sys_log` VALUES (1084, '2021-10-05 10:02:23', '管理商品', 'get', '127.0.0.1', 13147, 'admin', '/shop/product', '', 0, 1, '2021-10-05 10:02:23', 0);
INSERT INTO `sys_log` VALUES (1085, '2021-10-05 10:02:48', '商品信息', 'get', '127.0.0.1', 15461, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-05 10:02:48', 0);
INSERT INTO `sys_log` VALUES (1086, '2021-10-05 10:03:12', '', 'post', '127.0.0.1', 333, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 10:03:12', 0);
INSERT INTO `sys_log` VALUES (1087, '2021-10-05 10:10:10', '', 'post', '127.0.0.1', 382, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 10:10:10', 0);
INSERT INTO `sys_log` VALUES (1088, '2021-10-05 10:11:30', '', 'post', '127.0.0.1', 381, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 10:11:30', 0);
INSERT INTO `sys_log` VALUES (1089, '2021-10-05 12:47:04', '', 'post', '127.0.0.1', 401, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 12:47:04', 0);
INSERT INTO `sys_log` VALUES (1090, '2021-10-05 12:50:39', '', 'post', '127.0.0.1', 428, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 12:50:39', 0);
INSERT INTO `sys_log` VALUES (1091, '2021-10-05 12:56:27', '', 'post', '127.0.0.1', 370, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 12:56:27', 0);
INSERT INTO `sys_log` VALUES (1092, '2021-10-05 12:59:23', '', 'post', '127.0.0.1', 445, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 12:59:23', 0);
INSERT INTO `sys_log` VALUES (1093, '2021-10-05 13:02:30', '', 'post', '127.0.0.1', 418, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 13:02:30', 0);
INSERT INTO `sys_log` VALUES (1094, '2021-10-05 13:05:42', '', 'post', '127.0.0.1', 449, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 13:05:42', 0);
INSERT INTO `sys_log` VALUES (1095, '2021-10-05 13:08:15', '', 'post', '127.0.0.1', 488, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 13:08:15', 0);
INSERT INTO `sys_log` VALUES (1096, '2021-10-05 13:09:30', '', 'post', '127.0.0.1', 488, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 13:09:30', 0);
INSERT INTO `sys_log` VALUES (1097, '2021-10-05 13:10:50', '', 'post', '127.0.0.1', 421, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 13:10:50', 0);
INSERT INTO `sys_log` VALUES (1098, '2021-10-05 13:13:33', '', 'post', '127.0.0.1', 409, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 13:13:33', 0);
INSERT INTO `sys_log` VALUES (1099, '2021-10-05 13:18:54', '', 'post', '127.0.0.1', 342, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 13:18:54', 0);
INSERT INTO `sys_log` VALUES (1100, '2021-10-05 13:20:24', '', 'post', '127.0.0.1', 422, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 13:20:24', 0);
INSERT INTO `sys_log` VALUES (1101, '2021-10-05 13:21:12', '', 'post', '127.0.0.1', 414, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 13:21:12', 0);
INSERT INTO `sys_log` VALUES (1102, '2021-10-05 13:22:59', '', 'post', '127.0.0.1', 470, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 13:22:59', 0);
INSERT INTO `sys_log` VALUES (1103, '2021-10-05 13:26:02', '', 'post', '127.0.0.1', 458, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 13:26:02', 0);
INSERT INTO `sys_log` VALUES (1104, '2021-10-05 13:26:58', '', 'post', '127.0.0.1', 592, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 13:26:58', 0);
INSERT INTO `sys_log` VALUES (1105, '2021-10-05 13:28:18', '', 'post', '127.0.0.1', 391, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 13:28:18', 0);
INSERT INTO `sys_log` VALUES (1106, '2021-10-05 13:30:14', '', 'post', '127.0.0.1', 402, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 13:30:14', 0);
INSERT INTO `sys_log` VALUES (1107, '2021-10-05 13:32:54', '', 'post', '127.0.0.1', 461, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 13:32:54', 0);
INSERT INTO `sys_log` VALUES (1108, '2021-10-05 13:38:03', '', 'post', '127.0.0.1', 429, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 13:38:03', 0);
INSERT INTO `sys_log` VALUES (1109, '2021-10-05 13:40:17', '商品信息', 'get', '127.0.0.1', 1183, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-05 13:40:17', 0);
INSERT INTO `sys_log` VALUES (1110, '2021-10-05 13:40:31', '', 'post', '127.0.0.1', 278, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 13:40:31', 0);
INSERT INTO `sys_log` VALUES (1111, '2021-10-05 13:40:41', '商品规格', 'get', '127.0.0.1', 477, 'admin', '/shop/rule', '', 0, 1, '2021-10-05 13:40:41', 0);
INSERT INTO `sys_log` VALUES (1112, '2021-10-05 13:41:11', '新增/编辑规格', 'post', '127.0.0.1', 1053, 'admin', '/shop/rule/save/*', '', 0, 1, '2021-10-05 13:41:11', 0);
INSERT INTO `sys_log` VALUES (1113, '2021-10-05 13:41:12', '商品规格', 'get', '127.0.0.1', 460, 'admin', '/shop/rule', '', 0, 1, '2021-10-05 13:41:12', 0);
INSERT INTO `sys_log` VALUES (1114, '2021-10-05 13:42:09', '新增/编辑规格', 'post', '127.0.0.1', 1500, 'admin', '/shop/rule/save/*', '', 0, 1, '2021-10-05 13:42:09', 0);
INSERT INTO `sys_log` VALUES (1115, '2021-10-05 13:42:10', '商品规格', 'get', '127.0.0.1', 549, 'admin', '/shop/rule', '', 0, 1, '2021-10-05 13:42:10', 0);
INSERT INTO `sys_log` VALUES (1116, '2021-10-05 13:42:13', '管理商品', 'get', '127.0.0.1', 2873, 'admin', '/shop/product', '', 0, 1, '2021-10-05 13:42:13', 0);
INSERT INTO `sys_log` VALUES (1117, '2021-10-05 13:42:13', '管理商品', 'get', '127.0.0.1', 2351, 'admin', '/shop/product', '', 0, 1, '2021-10-05 13:42:13', 0);
INSERT INTO `sys_log` VALUES (1118, '2021-10-05 13:42:15', '商品信息', 'get', '127.0.0.1', 1097, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-05 13:42:15', 0);
INSERT INTO `sys_log` VALUES (1119, '2021-10-05 13:42:21', '', 'post', '127.0.0.1', 235, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 13:42:21', 0);
INSERT INTO `sys_log` VALUES (1120, '2021-10-05 13:42:30', '', 'post', '127.0.0.1', 533, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 13:42:30', 0);
INSERT INTO `sys_log` VALUES (1121, '2021-10-05 13:47:16', '', 'post', '127.0.0.1', 799, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 13:47:16', 0);
INSERT INTO `sys_log` VALUES (1122, '2021-10-05 13:48:59', '', 'post', '127.0.0.1', 880, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 13:48:59', 0);
INSERT INTO `sys_log` VALUES (1123, '2021-10-05 13:52:50', '', 'post', '127.0.0.1', 814, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 13:52:50', 0);
INSERT INTO `sys_log` VALUES (1124, '2021-10-05 13:57:16', '', 'post', '127.0.0.1', 733, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 13:57:16', 0);
INSERT INTO `sys_log` VALUES (1125, '2021-10-05 13:59:45', '', 'post', '127.0.0.1', 847, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 13:59:45', 0);
INSERT INTO `sys_log` VALUES (1126, '2021-10-05 14:02:15', '', 'post', '127.0.0.1', 668, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 14:02:15', 0);
INSERT INTO `sys_log` VALUES (1127, '2021-10-05 14:05:44', '', 'post', '127.0.0.1', 874, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 14:05:44', 0);
INSERT INTO `sys_log` VALUES (1128, '2021-10-05 14:11:35', '', 'post', '127.0.0.1', 802, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 14:11:35', 0);
INSERT INTO `sys_log` VALUES (1129, '2021-10-05 14:11:49', '', 'post', '127.0.0.1', 649, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 14:11:49', 0);
INSERT INTO `sys_log` VALUES (1130, '2021-10-05 14:11:50', '', 'post', '127.0.0.1', 642, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 14:11:50', 0);
INSERT INTO `sys_log` VALUES (1131, '2021-10-05 14:11:54', '', 'post', '127.0.0.1', 640, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 14:11:54', 0);
INSERT INTO `sys_log` VALUES (1132, '2021-10-05 14:12:42', '用户个人信息', 'get', '127.0.0.1', 674, 'admin', '/admin/auth/info', '', 0, 1, '2021-10-05 14:12:42', 0);
INSERT INTO `sys_log` VALUES (1133, '2021-10-05 14:12:42', '', 'get', '127.0.0.1', 3963, 'admin', '/admin/menu/build', '', 0, 1, '2021-10-05 14:12:42', 0);
INSERT INTO `sys_log` VALUES (1134, '2021-10-05 14:12:43', '商品信息', 'get', '127.0.0.1', 1267, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-05 14:12:43', 0);
INSERT INTO `sys_log` VALUES (1135, '2021-10-05 14:12:51', '', 'post', '127.0.0.1', 758, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 14:12:51', 0);
INSERT INTO `sys_log` VALUES (1136, '2021-10-05 14:14:18', '', 'post', '127.0.0.1', 640, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 14:14:18', 0);
INSERT INTO `sys_log` VALUES (1137, '2021-10-05 14:14:28', '', 'post', '127.0.0.1', 878, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 14:14:28', 0);
INSERT INTO `sys_log` VALUES (1138, '2021-10-05 14:14:32', '', 'post', '127.0.0.1', 879, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 14:14:32', 0);
INSERT INTO `sys_log` VALUES (1139, '2021-10-05 14:22:07', '', 'post', '127.0.0.1', 785, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 14:22:07', 0);
INSERT INTO `sys_log` VALUES (1140, '2021-10-05 14:26:42', '', 'post', '127.0.0.1', 629, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 14:26:42', 0);
INSERT INTO `sys_log` VALUES (1141, '2021-10-05 14:28:39', '', 'post', '127.0.0.1', 792, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 14:28:39', 0);
INSERT INTO `sys_log` VALUES (1142, '2021-10-05 14:36:25', '', 'post', '127.0.0.1', 770, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 14:36:25', 0);
INSERT INTO `sys_log` VALUES (1143, '2021-10-05 14:39:11', '', 'post', '127.0.0.1', 698, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 14:39:11', 0);
INSERT INTO `sys_log` VALUES (1144, '2021-10-05 14:41:15', '', 'post', '127.0.0.1', 959, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 14:41:15', 0);
INSERT INTO `sys_log` VALUES (1145, '2021-10-05 14:43:01', '', 'post', '127.0.0.1', 836, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 14:43:01', 0);
INSERT INTO `sys_log` VALUES (1146, '2021-10-05 14:43:55', '', 'post', '127.0.0.1', 780, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 14:43:55', 0);
INSERT INTO `sys_log` VALUES (1147, '2021-10-05 14:47:15', '', 'post', '127.0.0.1', 712, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 14:47:15', 0);
INSERT INTO `sys_log` VALUES (1148, '2021-10-05 14:48:09', '', 'post', '127.0.0.1', 750, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 14:48:09', 0);
INSERT INTO `sys_log` VALUES (1149, '2021-10-05 14:49:00', '', 'post', '127.0.0.1', 763, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 14:49:00', 0);
INSERT INTO `sys_log` VALUES (1150, '2021-10-05 14:52:12', '', 'get', '127.0.0.1', 5796, 'admin', '/admin/materialgroup', '', 0, 1, '2021-10-05 14:52:12', 0);
INSERT INTO `sys_log` VALUES (1151, '2021-10-05 14:52:23', '', 'get', '127.0.0.1', 307, 'admin', '/admin/materialgroup', '', 0, 1, '2021-10-05 14:52:23', 0);
INSERT INTO `sys_log` VALUES (1152, '2021-10-05 14:55:12', '', 'post', '127.0.0.1', 880, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 14:55:12', 0);
INSERT INTO `sys_log` VALUES (1153, '2021-10-05 15:01:47', '', 'post', '127.0.0.1', 719, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 15:01:47', 0);
INSERT INTO `sys_log` VALUES (1154, '2021-10-05 15:02:26', '', 'post', '127.0.0.1', 790, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 15:02:26', 0);
INSERT INTO `sys_log` VALUES (1155, '2021-10-05 15:05:07', '商品规格', 'get', '127.0.0.1', 818, 'admin', '/shop/rule', '', 0, 1, '2021-10-05 15:05:07', 0);
INSERT INTO `sys_log` VALUES (1156, '2021-10-05 15:06:53', '新增/编辑规格', 'post', '127.0.0.1', 973, 'admin', '/shop/rule/save/*', '', 0, 1, '2021-10-05 15:06:53', 0);
INSERT INTO `sys_log` VALUES (1157, '2021-10-05 15:06:53', '商品规格', 'get', '127.0.0.1', 550, 'admin', '/shop/rule', '', 0, 1, '2021-10-05 15:06:53', 0);
INSERT INTO `sys_log` VALUES (1158, '2021-10-05 15:06:55', '管理商品', 'get', '127.0.0.1', 2919, 'admin', '/shop/product', '', 0, 1, '2021-10-05 15:06:55', 0);
INSERT INTO `sys_log` VALUES (1159, '2021-10-05 15:06:55', '管理商品', 'get', '127.0.0.1', 2710, 'admin', '/shop/product', '', 0, 1, '2021-10-05 15:06:55', 0);
INSERT INTO `sys_log` VALUES (1160, '2021-10-05 15:06:57', '商品信息', 'get', '127.0.0.1', 1053, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-05 15:06:57', 0);
INSERT INTO `sys_log` VALUES (1161, '2021-10-05 15:07:04', '', 'post', '127.0.0.1', 299, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-05 15:07:04', 0);
INSERT INTO `sys_log` VALUES (1162, '2021-10-06 11:21:37', '', 'get', '127.0.0.1', 2105, 'admin', '/admin/menu/build', '', 0, 1, '2021-10-06 11:21:37', 0);
INSERT INTO `sys_log` VALUES (1163, '2021-10-06 11:22:06', '管理商品', 'get', '127.0.0.1', 10719, 'admin', '/shop/product', '', 0, 1, '2021-10-06 11:22:06', 0);
INSERT INTO `sys_log` VALUES (1164, '2021-10-06 11:22:06', '管理商品', 'get', '127.0.0.1', 12466, 'admin', '/shop/product', '', 0, 1, '2021-10-06 11:22:06', 0);
INSERT INTO `sys_log` VALUES (1165, '2021-10-06 11:22:09', '商品信息', 'get', '127.0.0.1', 10028, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-06 11:22:09', 0);
INSERT INTO `sys_log` VALUES (1166, '2021-10-06 11:23:19', '用户个人信息', 'get', '127.0.0.1', 510, 'admin', '/admin/auth/info', '', 0, 1, '2021-10-06 11:23:19', 0);
INSERT INTO `sys_log` VALUES (1167, '2021-10-06 11:23:19', '', 'get', '127.0.0.1', 1811, 'admin', '/admin/menu/build', '', 0, 1, '2021-10-06 11:23:19', 0);
INSERT INTO `sys_log` VALUES (1168, '2021-10-06 11:23:19', '商品信息', 'get', '127.0.0.1', 682, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-06 11:23:19', 0);
INSERT INTO `sys_log` VALUES (1169, '2021-10-06 11:23:23', '管理商品', 'get', '127.0.0.1', 3102, 'admin', '/shop/product', '', 0, 1, '2021-10-06 11:23:23', 0);
INSERT INTO `sys_log` VALUES (1170, '2021-10-06 11:23:23', '管理商品', 'get', '127.0.0.1', 4674, 'admin', '/shop/product', '', 0, 1, '2021-10-06 11:23:23', 0);
INSERT INTO `sys_log` VALUES (1171, '2021-10-06 11:23:27', '菜单管理', 'get', '127.0.0.1', 1570, 'admin', '/admin/menu', '', 0, 1, '2021-10-06 11:23:27', 0);
INSERT INTO `sys_log` VALUES (1172, '2021-10-06 11:24:12', '角色菜单数', 'get', '127.0.0.1', 1698, 'admin', '/admin/menu/tree', '', 0, 1, '2021-10-06 11:24:12', 0);
INSERT INTO `sys_log` VALUES (1173, '2021-10-06 11:25:16', '角色菜单数', 'get', '127.0.0.1', 2712, 'admin', '/admin/menu/tree', '', 0, 1, '2021-10-06 11:25:16', 0);
INSERT INTO `sys_log` VALUES (1174, '2021-10-06 11:25:16', '角色管理', 'get', '127.0.0.1', 6680, 'admin', '/admin/roles', '', 0, 1, '2021-10-06 11:25:16', 0);
INSERT INTO `sys_log` VALUES (1175, '2021-10-06 11:25:16', '角色管理', 'get', '127.0.0.1', 5094, 'admin', '/admin/roles', '', 0, 1, '2021-10-06 11:25:16', 0);
INSERT INTO `sys_log` VALUES (1176, '2021-10-06 11:25:33', '角色菜单保存', 'put', '127.0.0.1', 4981, 'admin', '/admin/roles/menu', '', 0, 1, '2021-10-06 11:25:33', 0);
INSERT INTO `sys_log` VALUES (1177, '2021-10-06 11:25:33', '单个角色', 'get', '127.0.0.1', 1800, 'admin', '/admin/roles/*', '', 0, 1, '2021-10-06 11:25:33', 0);
INSERT INTO `sys_log` VALUES (1178, '2021-10-06 11:25:55', '菜单管理', 'get', '127.0.0.1', 1170, 'admin', '/admin/menu', '', 0, 1, '2021-10-06 11:25:55', 0);
INSERT INTO `sys_log` VALUES (1179, '2021-10-06 11:26:01', '角色菜单数', 'get', '127.0.0.1', 1295, 'admin', '/admin/menu/tree', '', 0, 1, '2021-10-06 11:26:01', 0);
INSERT INTO `sys_log` VALUES (1180, '2021-10-06 11:26:18', '角色菜单数', 'get', '127.0.0.1', 1324, 'admin', '/admin/menu/tree', '', 0, 1, '2021-10-06 11:26:18', 0);
INSERT INTO `sys_log` VALUES (1181, '2021-10-06 11:26:37', '角色菜单数', 'get', '127.0.0.1', 1232, 'admin', '/admin/menu/tree', '', 0, 1, '2021-10-06 11:26:37', 0);
INSERT INTO `sys_log` VALUES (1182, '2021-10-06 11:26:47', '角色菜单数', 'get', '127.0.0.1', 1500, 'admin', '/admin/menu/tree', '', 0, 1, '2021-10-06 11:26:47', 0);
INSERT INTO `sys_log` VALUES (1183, '2021-10-06 11:26:54', '菜单编辑', 'put', '127.0.0.1', 2229, 'admin', '/admin/menu', '', 0, 1, '2021-10-06 11:26:54', 0);
INSERT INTO `sys_log` VALUES (1184, '2021-10-06 11:26:54', '菜单管理', 'get', '127.0.0.1', 1565, 'admin', '/admin/menu', '', 0, 1, '2021-10-06 11:26:54', 0);
INSERT INTO `sys_log` VALUES (1185, '2021-10-06 11:26:57', '商品新增', 'post', '127.0.0.1', 305, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-06 11:26:57', 0);
INSERT INTO `sys_log` VALUES (1186, '2021-10-06 11:27:31', '商品新增', 'post', '127.0.0.1', 241, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-06 11:27:31', 0);
INSERT INTO `sys_log` VALUES (1187, '2021-10-06 11:28:24', '商品新增', 'post', '127.0.0.1', 245, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-06 11:28:24', 0);
INSERT INTO `sys_log` VALUES (1188, '2021-10-06 11:28:55', '商品新增', 'post', '127.0.0.1', 315, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-06 11:28:55', 0);
INSERT INTO `sys_log` VALUES (1189, '2021-10-06 11:29:09', '', 'get', '127.0.0.1', 3305, 'admin', '/admin/materialgroup', '', 0, 1, '2021-10-06 11:29:09', 0);
INSERT INTO `sys_log` VALUES (1190, '2021-10-06 11:29:15', '商品新增', 'post', '127.0.0.1', 175, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-06 11:29:15', 0);
INSERT INTO `sys_log` VALUES (1191, '2021-10-06 11:29:21', '', 'get', '127.0.0.1', 439, 'admin', '/admin/materialgroup', '', 0, 1, '2021-10-06 11:29:21', 0);
INSERT INTO `sys_log` VALUES (1192, '2021-10-06 11:34:25', '', 'post', '127.0.0.1', 352, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-06 11:34:25', 0);
INSERT INTO `sys_log` VALUES (1193, '2021-10-06 11:35:05', '商品新增', 'post', '127.0.0.1', 242, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-06 11:35:05', 0);
INSERT INTO `sys_log` VALUES (1194, '2021-10-06 11:37:51', '商品新增', 'post', '127.0.0.1', 374, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-06 11:37:51', 0);
INSERT INTO `sys_log` VALUES (1195, '2021-10-06 11:38:50', '商品新增', 'post', '127.0.0.1', 429, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-06 11:38:50', 0);
INSERT INTO `sys_log` VALUES (1196, '2021-10-06 11:39:00', '商品信息', 'get', '127.0.0.1', 1051, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-06 11:39:00', 0);
INSERT INTO `sys_log` VALUES (1197, '2021-10-06 11:49:37', '', 'get', '127.0.0.1', 735, 'admin', '/admin/materialgroup', '', 0, 1, '2021-10-06 11:49:37', 0);
INSERT INTO `sys_log` VALUES (1198, '2021-10-06 11:49:57', '', 'get', '127.0.0.1', 546, 'admin', '/admin/materialgroup', '', 0, 1, '2021-10-06 11:49:57', 0);
INSERT INTO `sys_log` VALUES (1199, '2021-10-06 11:50:08', '', 'post', '127.0.0.1', 497, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-06 11:50:08', 0);
INSERT INTO `sys_log` VALUES (1200, '2021-10-06 11:50:41', '商品新增', 'post', '127.0.0.1', 258, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-06 11:50:41', 0);
INSERT INTO `sys_log` VALUES (1201, '2021-10-06 12:07:08', '商品新增', 'post', '127.0.0.1', 361, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-06 12:07:08', 0);
INSERT INTO `sys_log` VALUES (1202, '2021-10-06 12:11:13', '商品新增', 'post', '127.0.0.1', 427, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-06 12:11:13', 0);
INSERT INTO `sys_log` VALUES (1203, '2021-10-06 14:03:58', '商品新增', 'post', '127.0.0.1', 327, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-06 14:03:58', 0);
INSERT INTO `sys_log` VALUES (1204, '2021-10-06 14:04:50', '商品新增', 'post', '127.0.0.1', 386, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-06 14:04:50', 0);
INSERT INTO `sys_log` VALUES (1205, '2021-10-06 14:29:40', '商品新增', 'post', '127.0.0.1', 348, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-06 14:29:40', 0);
INSERT INTO `sys_log` VALUES (1206, '2021-10-06 14:45:49', '商品新增', 'post', '127.0.0.1', 434, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-06 14:45:49', 0);
INSERT INTO `sys_log` VALUES (1207, '2021-10-07 14:47:31', '', 'get', '127.0.0.1', 1751, 'admin', '/admin/menu/build', '', 0, 1, '2021-10-07 14:47:31', 0);
INSERT INTO `sys_log` VALUES (1208, '2021-10-07 14:47:40', '管理商品', 'get', '127.0.0.1', 17313, 'admin', '/shop/product', '', 0, 1, '2021-10-07 14:47:40', 0);
INSERT INTO `sys_log` VALUES (1209, '2021-10-07 14:47:40', '管理商品', 'get', '127.0.0.1', 18585, 'admin', '/shop/product', '', 0, 1, '2021-10-07 14:47:40', 0);
INSERT INTO `sys_log` VALUES (1210, '2021-10-07 14:47:43', '商品信息', 'get', '127.0.0.1', 11001, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-07 14:47:43', 0);
INSERT INTO `sys_log` VALUES (1211, '2021-10-07 14:47:54', '', 'get', '127.0.0.1', 2915, 'admin', '/admin/materialgroup', '', 0, 1, '2021-10-07 14:47:54', 0);
INSERT INTO `sys_log` VALUES (1212, '2021-10-07 14:48:00', '', 'get', '127.0.0.1', 636, 'admin', '/admin/materialgroup', '', 0, 1, '2021-10-07 14:48:00', 0);
INSERT INTO `sys_log` VALUES (1213, '2021-10-07 14:48:35', '商品新增', 'post', '127.0.0.1', 721, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-07 14:48:35', 0);
INSERT INTO `sys_log` VALUES (1214, '2021-10-07 15:03:06', '商品新增', 'post', '127.0.0.1', 891, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-07 15:03:06', 0);
INSERT INTO `sys_log` VALUES (1215, '2021-10-07 15:07:35', '商品新增', 'post', '127.0.0.1', 397, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-07 15:07:35', 0);
INSERT INTO `sys_log` VALUES (1216, '2021-10-07 15:08:42', '商品新增', 'post', '127.0.0.1', 742, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-07 15:08:42', 0);
INSERT INTO `sys_log` VALUES (1217, '2021-10-07 15:10:03', '商品新增', 'post', '127.0.0.1', 883, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-07 15:10:03', 0);
INSERT INTO `sys_log` VALUES (1218, '2021-10-07 15:12:59', '商品新增', 'post', '127.0.0.1', 774, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-07 15:12:59', 0);
INSERT INTO `sys_log` VALUES (1219, '2021-10-07 15:14:16', '商品新增', 'post', '127.0.0.1', 5886, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-07 15:14:16', 0);
INSERT INTO `sys_log` VALUES (1220, '2021-10-07 15:14:46', '商品新增', 'post', '127.0.0.1', 2610, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-07 15:14:46', 0);
INSERT INTO `sys_log` VALUES (1221, '2021-10-07 15:19:35', '商品新增', 'post', '127.0.0.1', 6845, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-07 15:19:35', 0);
INSERT INTO `sys_log` VALUES (1222, '2021-10-07 15:22:32', '商品新增', 'post', '127.0.0.1', 2749, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-07 15:22:32', 0);
INSERT INTO `sys_log` VALUES (1223, '2021-10-07 15:23:38', '商品新增', 'post', '127.0.0.1', 3328, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-07 15:23:38', 0);
INSERT INTO `sys_log` VALUES (1224, '2021-10-07 15:24:37', '商品新增', 'post', '127.0.0.1', 6690, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-07 15:24:37', 0);
INSERT INTO `sys_log` VALUES (1225, '2021-10-07 15:26:35', '商品新增', 'post', '127.0.0.1', 3641, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-07 15:26:35', 0);
INSERT INTO `sys_log` VALUES (1226, '2021-10-07 15:27:13', '商品新增', 'post', '127.0.0.1', 3846, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-07 15:27:13', 0);
INSERT INTO `sys_log` VALUES (1227, '2021-10-07 15:28:18', '商品新增', 'post', '127.0.0.1', 3323, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-07 15:28:18', 0);
INSERT INTO `sys_log` VALUES (1228, '2021-10-07 15:42:45', '商品新增', 'post', '127.0.0.1', 11753, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-07 15:42:45', 0);
INSERT INTO `sys_log` VALUES (1229, '2021-10-07 15:43:15', '商品新增', 'post', '127.0.0.1', 4385, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-07 15:43:15', 0);
INSERT INTO `sys_log` VALUES (1230, '2021-10-07 15:45:16', '商品新增', 'post', '127.0.0.1', 5504, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-07 15:45:16', 0);
INSERT INTO `sys_log` VALUES (1231, '2021-10-07 15:45:34', '商品信息', 'get', '127.0.0.1', 1449, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-07 15:45:34', 0);
INSERT INTO `sys_log` VALUES (1232, '2021-10-07 15:45:38', '管理商品', 'get', '127.0.0.1', 8130, 'admin', '/shop/product', '', 0, 1, '2021-10-07 15:45:38', 0);
INSERT INTO `sys_log` VALUES (1233, '2021-10-07 15:45:38', '管理商品', 'get', '127.0.0.1', 13060, 'admin', '/shop/product', '', 0, 1, '2021-10-07 15:45:38', 0);
INSERT INTO `sys_log` VALUES (1234, '2021-10-07 15:47:03', '商品信息', 'get', '127.0.0.1', 1147, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-07 15:47:03', 0);
INSERT INTO `sys_log` VALUES (1235, '2021-10-07 15:47:31', '', 'get', '127.0.0.1', 739, 'admin', '/admin/materialgroup', '', 0, 1, '2021-10-07 15:47:31', 0);
INSERT INTO `sys_log` VALUES (1236, '2021-10-07 15:54:26', '', 'get', '127.0.0.1', 422, 'admin', '/admin/materialgroup', '', 0, 1, '2021-10-07 15:54:26', 0);
INSERT INTO `sys_log` VALUES (1237, '2021-10-07 15:54:45', '', 'get', '127.0.0.1', 409, 'admin', '/admin/materialgroup', '', 0, 1, '2021-10-07 15:54:45', 0);
INSERT INTO `sys_log` VALUES (1238, '2021-10-07 15:55:19', '', 'post', '127.0.0.1', 392, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-07 15:55:19', 0);
INSERT INTO `sys_log` VALUES (1239, '2021-10-07 15:55:49', '商品新增', 'post', '127.0.0.1', 9558, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-07 15:55:49', 0);
INSERT INTO `sys_log` VALUES (1240, '2021-10-07 15:55:50', '管理商品', 'get', '127.0.0.1', 12458, 'admin', '/shop/product', '', 0, 1, '2021-10-07 15:55:50', 0);
INSERT INTO `sys_log` VALUES (1241, '2021-10-07 15:55:50', '管理商品', 'get', '127.0.0.1', 12462, 'admin', '/shop/product', '', 0, 1, '2021-10-07 15:55:50', 0);
INSERT INTO `sys_log` VALUES (1242, '2021-10-08 10:21:41', '', 'get', '127.0.0.1', 5281, 'admin', '/admin/menu/build', '', 0, 1, '2021-10-08 10:21:41', 0);
INSERT INTO `sys_log` VALUES (1243, '2021-10-08 10:21:52', '管理商品', 'get', '127.0.0.1', 31586, 'admin', '/shop/product', '', 0, 1, '2021-10-08 10:21:52', 0);
INSERT INTO `sys_log` VALUES (1244, '2021-10-08 10:21:52', '管理商品', 'get', '127.0.0.1', 30988, 'admin', '/shop/product', '', 0, 1, '2021-10-08 10:21:52', 0);
INSERT INTO `sys_log` VALUES (1245, '2021-10-08 10:22:12', '商品信息', 'get', '127.0.0.1', 64, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 10:22:12', 0);
INSERT INTO `sys_log` VALUES (1246, '2021-10-08 11:30:54', '管理商品', 'get', '127.0.0.1', 11093, 'admin', '/shop/product', '', 0, 1, '2021-10-08 11:30:54', 0);
INSERT INTO `sys_log` VALUES (1247, '2021-10-08 11:30:54', '管理商品', 'get', '127.0.0.1', 13241, 'admin', '/shop/product', '', 0, 1, '2021-10-08 11:30:54', 0);
INSERT INTO `sys_log` VALUES (1248, '2021-10-08 11:30:58', '商品信息', 'get', '127.0.0.1', 4809, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 11:30:58', 0);
INSERT INTO `sys_log` VALUES (1249, '2021-10-08 11:38:22', '管理商品', 'get', '127.0.0.1', 19160, 'admin', '/shop/product', '', 0, 1, '2021-10-08 11:38:22', 0);
INSERT INTO `sys_log` VALUES (1250, '2021-10-08 11:38:22', '管理商品', 'get', '127.0.0.1', 21938, 'admin', '/shop/product', '', 0, 1, '2021-10-08 11:38:22', 0);
INSERT INTO `sys_log` VALUES (1251, '2021-10-08 11:38:24', '商品信息', 'get', '127.0.0.1', 1603, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 11:38:24', 0);
INSERT INTO `sys_log` VALUES (1252, '2021-10-08 11:39:00', '管理商品', 'get', '127.0.0.1', 11531, 'admin', '/shop/product', '', 0, 1, '2021-10-08 11:39:00', 0);
INSERT INTO `sys_log` VALUES (1253, '2021-10-08 11:39:00', '管理商品', 'get', '127.0.0.1', 16690, 'admin', '/shop/product', '', 0, 1, '2021-10-08 11:39:00', 0);
INSERT INTO `sys_log` VALUES (1254, '2021-10-08 11:39:02', '商品信息', 'get', '127.0.0.1', 2077, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 11:39:02', 0);
INSERT INTO `sys_log` VALUES (1255, '2021-10-08 11:40:33', '管理商品', 'get', '127.0.0.1', 1738, 'admin', '/shop/product', '', 0, 1, '2021-10-08 11:40:33', 0);
INSERT INTO `sys_log` VALUES (1256, '2021-10-08 11:40:33', '管理商品', 'get', '127.0.0.1', 2022, 'admin', '/shop/product', '', 0, 1, '2021-10-08 11:40:33', 0);
INSERT INTO `sys_log` VALUES (1257, '2021-10-08 11:41:02', '管理商品', 'get', '127.0.0.1', 5108, 'admin', '/shop/product', '', 0, 1, '2021-10-08 11:41:02', 0);
INSERT INTO `sys_log` VALUES (1258, '2021-10-08 11:41:21', '商品信息', 'get', '127.0.0.1', 2303, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 11:41:21', 0);
INSERT INTO `sys_log` VALUES (1259, '2021-10-08 11:42:24', '管理商品', 'get', '127.0.0.1', 7197, 'admin', '/shop/product', '', 0, 1, '2021-10-08 11:42:24', 0);
INSERT INTO `sys_log` VALUES (1260, '2021-10-08 11:42:24', '管理商品', 'get', '127.0.0.1', 10345, 'admin', '/shop/product', '', 0, 1, '2021-10-08 11:42:24', 0);
INSERT INTO `sys_log` VALUES (1261, '2021-10-08 11:42:27', '商品信息', 'get', '127.0.0.1', 2016, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 11:42:27', 0);
INSERT INTO `sys_log` VALUES (1262, '2021-10-08 11:46:00', '管理商品', 'get', '127.0.0.1', 9813, 'admin', '/shop/product', '', 0, 1, '2021-10-08 11:46:00', 0);
INSERT INTO `sys_log` VALUES (1263, '2021-10-08 11:46:00', '管理商品', 'get', '127.0.0.1', 10471, 'admin', '/shop/product', '', 0, 1, '2021-10-08 11:46:00', 0);
INSERT INTO `sys_log` VALUES (1264, '2021-10-08 11:46:02', '商品信息', 'get', '127.0.0.1', 2061, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 11:46:02', 0);
INSERT INTO `sys_log` VALUES (1265, '2021-10-08 11:47:56', '管理商品', 'get', '127.0.0.1', 10214, 'admin', '/shop/product', '', 0, 1, '2021-10-08 11:47:56', 0);
INSERT INTO `sys_log` VALUES (1266, '2021-10-08 11:47:56', '管理商品', 'get', '127.0.0.1', 10514, 'admin', '/shop/product', '', 0, 1, '2021-10-08 11:47:56', 0);
INSERT INTO `sys_log` VALUES (1267, '2021-10-08 11:47:58', '商品信息', 'get', '127.0.0.1', 4413, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 11:47:58', 0);
INSERT INTO `sys_log` VALUES (1268, '2021-10-08 11:48:24', '管理商品', 'get', '127.0.0.1', 7035, 'admin', '/shop/product', '', 0, 1, '2021-10-08 11:48:24', 0);
INSERT INTO `sys_log` VALUES (1269, '2021-10-08 11:48:24', '管理商品', 'get', '127.0.0.1', 11166, 'admin', '/shop/product', '', 0, 1, '2021-10-08 11:48:24', 0);
INSERT INTO `sys_log` VALUES (1270, '2021-10-08 11:48:27', '商品信息', 'get', '127.0.0.1', 1479, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 11:48:27', 0);
INSERT INTO `sys_log` VALUES (1271, '2021-10-08 11:49:20', '管理商品', 'get', '127.0.0.1', 8343, 'admin', '/shop/product', '', 0, 1, '2021-10-08 11:49:20', 0);
INSERT INTO `sys_log` VALUES (1272, '2021-10-08 11:49:20', '管理商品', 'get', '127.0.0.1', 11829, 'admin', '/shop/product', '', 0, 1, '2021-10-08 11:49:20', 0);
INSERT INTO `sys_log` VALUES (1273, '2021-10-08 11:49:22', '商品信息', 'get', '127.0.0.1', 2207, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 11:49:22', 0);
INSERT INTO `sys_log` VALUES (1274, '2021-10-08 11:50:14', '管理商品', 'get', '127.0.0.1', 10615, 'admin', '/shop/product', '', 0, 1, '2021-10-08 11:50:14', 0);
INSERT INTO `sys_log` VALUES (1275, '2021-10-08 11:50:14', '管理商品', 'get', '127.0.0.1', 10380, 'admin', '/shop/product', '', 0, 1, '2021-10-08 11:50:14', 0);
INSERT INTO `sys_log` VALUES (1276, '2021-10-08 11:50:16', '商品信息', 'get', '127.0.0.1', 3147, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 11:50:16', 0);
INSERT INTO `sys_log` VALUES (1277, '2021-10-08 11:51:27', '管理商品', 'get', '127.0.0.1', 7875, 'admin', '/shop/product', '', 0, 1, '2021-10-08 11:51:27', 0);
INSERT INTO `sys_log` VALUES (1278, '2021-10-08 11:51:27', '管理商品', 'get', '127.0.0.1', 8820, 'admin', '/shop/product', '', 0, 1, '2021-10-08 11:51:27', 0);
INSERT INTO `sys_log` VALUES (1279, '2021-10-08 11:51:29', '商品信息', 'get', '127.0.0.1', 4285, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 11:51:29', 0);
INSERT INTO `sys_log` VALUES (1280, '2021-10-08 11:52:21', '管理商品', 'get', '127.0.0.1', 8308, 'admin', '/shop/product', '', 0, 1, '2021-10-08 11:52:21', 0);
INSERT INTO `sys_log` VALUES (1281, '2021-10-08 11:52:21', '管理商品', 'get', '127.0.0.1', 9008, 'admin', '/shop/product', '', 0, 1, '2021-10-08 11:52:21', 0);
INSERT INTO `sys_log` VALUES (1282, '2021-10-08 11:52:23', '商品信息', 'get', '127.0.0.1', 1915, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 11:52:23', 0);
INSERT INTO `sys_log` VALUES (1283, '2021-10-08 11:52:52', '管理商品', 'get', '127.0.0.1', 7199, 'admin', '/shop/product', '', 0, 1, '2021-10-08 11:52:52', 0);
INSERT INTO `sys_log` VALUES (1284, '2021-10-08 11:52:52', '管理商品', 'get', '127.0.0.1', 10458, 'admin', '/shop/product', '', 0, 1, '2021-10-08 11:52:52', 0);
INSERT INTO `sys_log` VALUES (1285, '2021-10-08 11:52:53', '商品信息', 'get', '127.0.0.1', 1867, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 11:52:53', 0);
INSERT INTO `sys_log` VALUES (1286, '2021-10-08 11:55:34', '管理商品', 'get', '127.0.0.1', 8588, 'admin', '/shop/product', '', 0, 1, '2021-10-08 11:55:34', 0);
INSERT INTO `sys_log` VALUES (1287, '2021-10-08 11:55:34', '管理商品', 'get', '127.0.0.1', 9950, 'admin', '/shop/product', '', 0, 1, '2021-10-08 11:55:34', 0);
INSERT INTO `sys_log` VALUES (1288, '2021-10-08 11:55:37', '商品信息', 'get', '127.0.0.1', 1984, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 11:55:37', 0);
INSERT INTO `sys_log` VALUES (1289, '2021-10-08 13:39:45', '管理商品', 'get', '127.0.0.1', 9064, 'admin', '/shop/product', '', 0, 1, '2021-10-08 13:39:45', 0);
INSERT INTO `sys_log` VALUES (1290, '2021-10-08 13:39:45', '管理商品', 'get', '127.0.0.1', 11394, 'admin', '/shop/product', '', 0, 1, '2021-10-08 13:39:45', 0);
INSERT INTO `sys_log` VALUES (1291, '2021-10-08 13:39:47', '商品信息', 'get', '127.0.0.1', 2003, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 13:39:47', 0);
INSERT INTO `sys_log` VALUES (1292, '2021-10-08 13:42:22', '管理商品', 'get', '127.0.0.1', 6797, 'admin', '/shop/product', '', 0, 1, '2021-10-08 13:42:22', 0);
INSERT INTO `sys_log` VALUES (1293, '2021-10-08 13:42:22', '管理商品', 'get', '127.0.0.1', 8224, 'admin', '/shop/product', '', 0, 1, '2021-10-08 13:42:22', 0);
INSERT INTO `sys_log` VALUES (1294, '2021-10-08 13:42:24', '商品信息', 'get', '127.0.0.1', 1938, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 13:42:24', 0);
INSERT INTO `sys_log` VALUES (1295, '2021-10-08 13:49:11', '管理商品', 'get', '127.0.0.1', 10542, 'admin', '/shop/product', '', 0, 1, '2021-10-08 13:49:11', 0);
INSERT INTO `sys_log` VALUES (1296, '2021-10-08 13:49:11', '管理商品', 'get', '127.0.0.1', 11299, 'admin', '/shop/product', '', 0, 1, '2021-10-08 13:49:11', 0);
INSERT INTO `sys_log` VALUES (1297, '2021-10-08 13:49:13', '商品信息', 'get', '127.0.0.1', 3217, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 13:49:13', 0);
INSERT INTO `sys_log` VALUES (1298, '2021-10-08 13:59:05', '管理商品', 'get', '127.0.0.1', 11641, 'admin', '/shop/product', '', 0, 1, '2021-10-08 13:59:05', 0);
INSERT INTO `sys_log` VALUES (1299, '2021-10-08 13:59:05', '管理商品', 'get', '127.0.0.1', 13456, 'admin', '/shop/product', '', 0, 1, '2021-10-08 13:59:05', 0);
INSERT INTO `sys_log` VALUES (1300, '2021-10-08 13:59:07', '商品信息', 'get', '127.0.0.1', 3186, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 13:59:07', 0);
INSERT INTO `sys_log` VALUES (1301, '2021-10-08 13:59:50', '管理商品', 'get', '127.0.0.1', 10302, 'admin', '/shop/product', '', 0, 1, '2021-10-08 13:59:50', 0);
INSERT INTO `sys_log` VALUES (1302, '2021-10-08 13:59:50', '管理商品', 'get', '127.0.0.1', 11365, 'admin', '/shop/product', '', 0, 1, '2021-10-08 13:59:50', 0);
INSERT INTO `sys_log` VALUES (1303, '2021-10-08 13:59:52', '商品信息', 'get', '127.0.0.1', 2000, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 13:59:52', 0);
INSERT INTO `sys_log` VALUES (1304, '2021-10-08 14:03:40', '管理商品', 'get', '127.0.0.1', 7260, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:03:40', 0);
INSERT INTO `sys_log` VALUES (1305, '2021-10-08 14:03:40', '管理商品', 'get', '127.0.0.1', 7844, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:03:40', 0);
INSERT INTO `sys_log` VALUES (1306, '2021-10-08 14:03:42', '商品信息', 'get', '127.0.0.1', 2396, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:03:42', 0);
INSERT INTO `sys_log` VALUES (1307, '2021-10-08 14:09:47', '管理商品', 'get', '127.0.0.1', 10705, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:09:47', 0);
INSERT INTO `sys_log` VALUES (1308, '2021-10-08 14:09:47', '管理商品', 'get', '127.0.0.1', 11665, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:09:47', 0);
INSERT INTO `sys_log` VALUES (1309, '2021-10-08 14:09:50', '商品信息', 'get', '127.0.0.1', 1900, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:09:50', 0);
INSERT INTO `sys_log` VALUES (1310, '2021-10-08 14:11:51', '管理商品', 'get', '127.0.0.1', 9515, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:11:51', 0);
INSERT INTO `sys_log` VALUES (1311, '2021-10-08 14:11:51', '管理商品', 'get', '127.0.0.1', 10152, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:11:51', 0);
INSERT INTO `sys_log` VALUES (1312, '2021-10-08 14:11:53', '商品信息', 'get', '127.0.0.1', 1683, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:11:53', 0);
INSERT INTO `sys_log` VALUES (1313, '2021-10-08 14:13:11', '管理商品', 'get', '127.0.0.1', 7274, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:13:11', 0);
INSERT INTO `sys_log` VALUES (1314, '2021-10-08 14:13:11', '管理商品', 'get', '127.0.0.1', 7586, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:13:11', 0);
INSERT INTO `sys_log` VALUES (1315, '2021-10-08 14:13:13', '商品信息', 'get', '127.0.0.1', 3978, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:13:13', 0);
INSERT INTO `sys_log` VALUES (1316, '2021-10-08 14:13:50', '管理商品', 'get', '127.0.0.1', 7814, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:13:50', 0);
INSERT INTO `sys_log` VALUES (1317, '2021-10-08 14:13:50', '管理商品', 'get', '127.0.0.1', 8859, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:13:50', 0);
INSERT INTO `sys_log` VALUES (1318, '2021-10-08 14:13:52', '商品信息', 'get', '127.0.0.1', 2058, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:13:52', 0);
INSERT INTO `sys_log` VALUES (1319, '2021-10-08 14:14:51', '管理商品', 'get', '127.0.0.1', 11941, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:14:51', 0);
INSERT INTO `sys_log` VALUES (1320, '2021-10-08 14:14:51', '管理商品', 'get', '127.0.0.1', 14585, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:14:51', 0);
INSERT INTO `sys_log` VALUES (1321, '2021-10-08 14:14:53', '商品信息', 'get', '127.0.0.1', 1740, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:14:53', 0);
INSERT INTO `sys_log` VALUES (1322, '2021-10-08 14:20:28', '管理商品', 'get', '127.0.0.1', 7132, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:20:28', 0);
INSERT INTO `sys_log` VALUES (1323, '2021-10-08 14:20:28', '管理商品', 'get', '127.0.0.1', 8160, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:20:28', 0);
INSERT INTO `sys_log` VALUES (1324, '2021-10-08 14:20:32', '商品信息', 'get', '127.0.0.1', 2310, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:20:32', 0);
INSERT INTO `sys_log` VALUES (1325, '2021-10-08 14:20:32', '', 'post', '127.0.0.1', 2959, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-08 14:20:32', 0);
INSERT INTO `sys_log` VALUES (1326, '2021-10-08 14:21:12', '管理商品', 'get', '127.0.0.1', 10854, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:21:12', 0);
INSERT INTO `sys_log` VALUES (1327, '2021-10-08 14:21:12', '管理商品', 'get', '127.0.0.1', 12224, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:21:12', 0);
INSERT INTO `sys_log` VALUES (1328, '2021-10-08 14:21:14', '商品信息', 'get', '127.0.0.1', 1526, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:21:14', 0);
INSERT INTO `sys_log` VALUES (1329, '2021-10-08 14:21:14', '', 'post', '127.0.0.1', 602, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-08 14:21:14', 0);
INSERT INTO `sys_log` VALUES (1330, '2021-10-08 14:24:15', '商品信息', 'get', '127.0.0.1', 2046, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:24:15', 0);
INSERT INTO `sys_log` VALUES (1331, '2021-10-08 14:24:15', '', 'post', '127.0.0.1', 784, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-08 14:24:15', 0);
INSERT INTO `sys_log` VALUES (1332, '2021-10-08 14:24:31', '管理商品', 'get', '127.0.0.1', 12394, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:24:31', 0);
INSERT INTO `sys_log` VALUES (1333, '2021-10-08 14:24:31', '管理商品', 'get', '127.0.0.1', 13264, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:24:31', 0);
INSERT INTO `sys_log` VALUES (1334, '2021-10-08 14:24:40', '商品信息', 'get', '127.0.0.1', 1578, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:24:40', 0);
INSERT INTO `sys_log` VALUES (1335, '2021-10-08 14:24:40', '', 'post', '127.0.0.1', 75, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-08 14:24:40', 0);
INSERT INTO `sys_log` VALUES (1336, '2021-10-08 14:25:06', '管理商品', 'get', '127.0.0.1', 10926, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:25:06', 0);
INSERT INTO `sys_log` VALUES (1337, '2021-10-08 14:25:06', '管理商品', 'get', '127.0.0.1', 11026, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:25:06', 0);
INSERT INTO `sys_log` VALUES (1338, '2021-10-08 14:30:33', '用户个人信息', 'get', '127.0.0.1', 309, 'admin', '/admin/auth/info', '', 0, 1, '2021-10-08 14:30:33', 0);
INSERT INTO `sys_log` VALUES (1339, '2021-10-08 14:30:33', '', 'get', '127.0.0.1', 1780, 'admin', '/admin/menu/build', '', 0, 1, '2021-10-08 14:30:33', 0);
INSERT INTO `sys_log` VALUES (1340, '2021-10-08 14:30:34', '管理商品', 'get', '127.0.0.1', 14089, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:30:34', 0);
INSERT INTO `sys_log` VALUES (1341, '2021-10-08 14:30:34', '管理商品', 'get', '127.0.0.1', 13620, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:30:34', 0);
INSERT INTO `sys_log` VALUES (1342, '2021-10-08 14:30:42', '菜单管理', 'get', '127.0.0.1', 1577, 'admin', '/admin/menu', '', 0, 1, '2021-10-08 14:30:42', 0);
INSERT INTO `sys_log` VALUES (1343, '2021-10-08 14:30:51', '角色菜单数', 'get', '127.0.0.1', 1342, 'admin', '/admin/menu/tree', '', 0, 1, '2021-10-08 14:30:51', 0);
INSERT INTO `sys_log` VALUES (1344, '2021-10-08 14:31:00', '菜单编辑', 'put', '127.0.0.1', 2279, 'admin', '/admin/menu', '', 0, 1, '2021-10-08 14:31:00', 0);
INSERT INTO `sys_log` VALUES (1345, '2021-10-08 14:31:00', '菜单管理', 'get', '127.0.0.1', 1614, 'admin', '/admin/menu', '', 0, 1, '2021-10-08 14:31:00', 0);
INSERT INTO `sys_log` VALUES (1346, '2021-10-08 14:31:26', '角色菜单数', 'get', '127.0.0.1', 1130, 'admin', '/admin/menu/tree', '', 0, 1, '2021-10-08 14:31:26', 0);
INSERT INTO `sys_log` VALUES (1347, '2021-10-08 14:31:51', '角色菜单数', 'get', '127.0.0.1', 1297, 'admin', '/admin/menu/tree', '', 0, 1, '2021-10-08 14:31:51', 0);
INSERT INTO `sys_log` VALUES (1348, '2021-10-08 14:32:08', '菜单编辑', 'put', '127.0.0.1', 1178, 'admin', '/admin/menu', '', 0, 1, '2021-10-08 14:32:08', 0);
INSERT INTO `sys_log` VALUES (1349, '2021-10-08 14:32:08', '菜单管理', 'get', '127.0.0.1', 1704, 'admin', '/admin/menu', '', 0, 1, '2021-10-08 14:32:08', 0);
INSERT INTO `sys_log` VALUES (1350, '2021-10-08 14:32:14', '商品删除', 'delete', '127.0.0.1', 260, 'admin', '/shop/product/*', '', 0, 1, '2021-10-08 14:32:14', 0);
INSERT INTO `sys_log` VALUES (1351, '2021-10-08 14:32:43', '商品删除', 'delete', '127.0.0.1', 1496, 'admin', '/shop/product/*', '', 0, 1, '2021-10-08 14:32:43', 0);
INSERT INTO `sys_log` VALUES (1352, '2021-10-08 14:32:43', '管理商品', 'get', '127.0.0.1', 6743, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:32:43', 0);
INSERT INTO `sys_log` VALUES (1353, '2021-10-08 14:32:46', '商品删除', 'delete', '127.0.0.1', 1405, 'admin', '/shop/product/*', '', 0, 1, '2021-10-08 14:32:46', 0);
INSERT INTO `sys_log` VALUES (1354, '2021-10-08 14:32:46', '管理商品', 'get', '127.0.0.1', 6636, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:32:46', 0);
INSERT INTO `sys_log` VALUES (1355, '2021-10-08 14:32:48', '商品删除', 'delete', '127.0.0.1', 1189, 'admin', '/shop/product/*', '', 0, 1, '2021-10-08 14:32:48', 0);
INSERT INTO `sys_log` VALUES (1356, '2021-10-08 14:32:48', '管理商品', 'get', '127.0.0.1', 4371, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:32:48', 0);
INSERT INTO `sys_log` VALUES (1357, '2021-10-08 14:32:52', '商品删除', 'delete', '127.0.0.1', 1336, 'admin', '/shop/product/*', '', 0, 1, '2021-10-08 14:32:52', 0);
INSERT INTO `sys_log` VALUES (1358, '2021-10-08 14:32:52', '管理商品', 'get', '127.0.0.1', 3198, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:32:52', 0);
INSERT INTO `sys_log` VALUES (1359, '2021-10-08 14:32:54', '商品删除', 'delete', '127.0.0.1', 13854, 'admin', '/shop/product/*', '', 0, 1, '2021-10-08 14:32:54', 0);
INSERT INTO `sys_log` VALUES (1360, '2021-10-08 14:32:54', '管理商品', 'get', '127.0.0.1', 4382, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:32:54', 0);
INSERT INTO `sys_log` VALUES (1361, '2021-10-08 14:32:58', '商品删除', 'delete', '127.0.0.1', 1223, 'admin', '/shop/product/*', '', 0, 1, '2021-10-08 14:32:58', 0);
INSERT INTO `sys_log` VALUES (1362, '2021-10-08 14:32:58', '管理商品', 'get', '127.0.0.1', 3084, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:32:58', 0);
INSERT INTO `sys_log` VALUES (1363, '2021-10-08 14:33:00', '商品删除', 'delete', '127.0.0.1', 1137, 'admin', '/shop/product/*', '', 0, 1, '2021-10-08 14:33:00', 0);
INSERT INTO `sys_log` VALUES (1364, '2021-10-08 14:33:00', '管理商品', 'get', '127.0.0.1', 3343, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:33:00', 0);
INSERT INTO `sys_log` VALUES (1365, '2021-10-08 14:33:02', '商品删除', 'delete', '127.0.0.1', 870, 'admin', '/shop/product/*', '', 0, 1, '2021-10-08 14:33:02', 0);
INSERT INTO `sys_log` VALUES (1366, '2021-10-08 14:33:02', '管理商品', 'get', '127.0.0.1', 1811, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:33:02', 0);
INSERT INTO `sys_log` VALUES (1367, '2021-10-08 14:33:04', '商品删除', 'delete', '127.0.0.1', 993, 'admin', '/shop/product/*', '', 0, 1, '2021-10-08 14:33:04', 0);
INSERT INTO `sys_log` VALUES (1368, '2021-10-08 14:33:04', '管理商品', 'get', '127.0.0.1', 1629, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:33:04', 0);
INSERT INTO `sys_log` VALUES (1369, '2021-10-08 14:33:10', '商品信息', 'get', '127.0.0.1', 1027, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:33:10', 0);
INSERT INTO `sys_log` VALUES (1370, '2021-10-08 14:33:31', '', 'get', '127.0.0.1', 3229, 'admin', '/admin/materialgroup', '', 0, 1, '2021-10-08 14:33:31', 0);
INSERT INTO `sys_log` VALUES (1371, '2021-10-08 14:33:58', '', 'get', '127.0.0.1', 501, 'admin', '/admin/materialgroup', '', 0, 1, '2021-10-08 14:33:58', 0);
INSERT INTO `sys_log` VALUES (1372, '2021-10-08 14:34:19', '商品新增', 'post', '127.0.0.1', 8341, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-08 14:34:19', 0);
INSERT INTO `sys_log` VALUES (1373, '2021-10-08 14:34:20', '管理商品', 'get', '127.0.0.1', 3319, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:34:20', 0);
INSERT INTO `sys_log` VALUES (1374, '2021-10-08 14:34:20', '管理商品', 'get', '127.0.0.1', 6658, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:34:20', 0);
INSERT INTO `sys_log` VALUES (1375, '2021-10-08 14:34:23', '商品信息', 'get', '127.0.0.1', 1719, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:34:23', 0);
INSERT INTO `sys_log` VALUES (1376, '2021-10-08 14:34:23', '', 'post', '127.0.0.1', 686, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-08 14:34:23', 0);
INSERT INTO `sys_log` VALUES (1377, '2021-10-08 14:37:35', '商品信息', 'get', '127.0.0.1', 1073, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:37:35', 0);
INSERT INTO `sys_log` VALUES (1378, '2021-10-08 14:37:38', '商品信息', 'get', '127.0.0.1', 2426, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:37:38', 0);
INSERT INTO `sys_log` VALUES (1379, '2021-10-08 14:37:38', '', 'post', '127.0.0.1', 96, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-08 14:37:38', 0);
INSERT INTO `sys_log` VALUES (1380, '2021-10-08 14:37:41', '管理商品', 'get', '127.0.0.1', 5295, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:37:41', 0);
INSERT INTO `sys_log` VALUES (1381, '2021-10-08 14:37:41', '管理商品', 'get', '127.0.0.1', 6180, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:37:41', 0);
INSERT INTO `sys_log` VALUES (1382, '2021-10-08 14:37:44', '商品信息', 'get', '127.0.0.1', 1713, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:37:44', 0);
INSERT INTO `sys_log` VALUES (1383, '2021-10-08 14:37:44', '', 'post', '127.0.0.1', 1066, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-08 14:37:44', 0);
INSERT INTO `sys_log` VALUES (1384, '2021-10-08 14:37:57', '商品新增', 'post', '127.0.0.1', 10617, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-08 14:37:57', 0);
INSERT INTO `sys_log` VALUES (1385, '2021-10-08 14:39:08', '管理商品', 'get', '127.0.0.1', 4509, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:39:08', 0);
INSERT INTO `sys_log` VALUES (1386, '2021-10-08 14:39:08', '管理商品', 'get', '127.0.0.1', 5090, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:39:08', 0);
INSERT INTO `sys_log` VALUES (1387, '2021-10-08 14:39:13', '商品信息', 'get', '127.0.0.1', 1845, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:39:13', 0);
INSERT INTO `sys_log` VALUES (1388, '2021-10-08 14:39:13', '', 'post', '127.0.0.1', 196, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-08 14:39:13', 0);
INSERT INTO `sys_log` VALUES (1389, '2021-10-08 14:40:28', '管理商品', 'get', '127.0.0.1', 3152, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:40:28', 0);
INSERT INTO `sys_log` VALUES (1390, '2021-10-08 14:40:28', '管理商品', 'get', '127.0.0.1', 3941, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:40:28', 0);
INSERT INTO `sys_log` VALUES (1391, '2021-10-08 14:40:30', '商品信息', 'get', '127.0.0.1', 2133, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:40:30', 0);
INSERT INTO `sys_log` VALUES (1392, '2021-10-08 14:40:30', '', 'post', '127.0.0.1', 245, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-08 14:40:30', 0);
INSERT INTO `sys_log` VALUES (1393, '2021-10-08 14:43:11', '管理商品', 'get', '127.0.0.1', 4630, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:43:11', 0);
INSERT INTO `sys_log` VALUES (1394, '2021-10-08 14:43:11', '管理商品', 'get', '127.0.0.1', 4889, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:43:11', 0);
INSERT INTO `sys_log` VALUES (1395, '2021-10-08 14:43:13', '商品信息', 'get', '127.0.0.1', 2853, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:43:13', 0);
INSERT INTO `sys_log` VALUES (1396, '2021-10-08 14:43:53', '管理商品', 'get', '127.0.0.1', 3238, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:43:53', 0);
INSERT INTO `sys_log` VALUES (1397, '2021-10-08 14:43:53', '管理商品', 'get', '127.0.0.1', 8296, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:43:53', 0);
INSERT INTO `sys_log` VALUES (1398, '2021-10-08 14:43:55', '商品信息', 'get', '127.0.0.1', 2239, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:43:55', 0);
INSERT INTO `sys_log` VALUES (1399, '2021-10-08 14:43:55', '', 'post', '127.0.0.1', 229, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-08 14:43:55', 0);
INSERT INTO `sys_log` VALUES (1400, '2021-10-08 14:46:08', '管理商品', 'get', '127.0.0.1', 2957, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:46:08', 0);
INSERT INTO `sys_log` VALUES (1401, '2021-10-08 14:46:08', '管理商品', 'get', '127.0.0.1', 3553, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:46:08', 0);
INSERT INTO `sys_log` VALUES (1402, '2021-10-08 14:46:10', '商品信息', 'get', '127.0.0.1', 2187, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:46:10', 0);
INSERT INTO `sys_log` VALUES (1403, '2021-10-08 14:46:10', '', 'post', '127.0.0.1', 202, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-08 14:46:10', 0);
INSERT INTO `sys_log` VALUES (1404, '2021-10-08 14:49:45', '管理商品', 'get', '127.0.0.1', 5301, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:49:45', 0);
INSERT INTO `sys_log` VALUES (1405, '2021-10-08 14:49:45', '管理商品', 'get', '127.0.0.1', 5048, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:49:45', 0);
INSERT INTO `sys_log` VALUES (1406, '2021-10-08 14:49:52', '商品信息', 'get', '127.0.0.1', 1835, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:49:52', 0);
INSERT INTO `sys_log` VALUES (1407, '2021-10-08 14:49:52', '', 'post', '127.0.0.1', 2615, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-08 14:49:52', 0);
INSERT INTO `sys_log` VALUES (1408, '2021-10-08 14:51:28', '管理商品', 'get', '127.0.0.1', 2655, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:51:28', 0);
INSERT INTO `sys_log` VALUES (1409, '2021-10-08 14:51:28', '管理商品', 'get', '127.0.0.1', 3547, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:51:28', 0);
INSERT INTO `sys_log` VALUES (1410, '2021-10-08 14:51:31', '商品信息', 'get', '127.0.0.1', 1979, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:51:31', 0);
INSERT INTO `sys_log` VALUES (1411, '2021-10-08 14:51:31', '', 'post', '127.0.0.1', 2412, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-08 14:51:31', 0);
INSERT INTO `sys_log` VALUES (1412, '2021-10-08 14:52:53', '管理商品', 'get', '127.0.0.1', 2513, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:52:53', 0);
INSERT INTO `sys_log` VALUES (1413, '2021-10-08 14:52:53', '管理商品', 'get', '127.0.0.1', 2752, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:52:53', 0);
INSERT INTO `sys_log` VALUES (1414, '2021-10-08 14:52:55', '商品信息', 'get', '127.0.0.1', 1953, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:52:55', 0);
INSERT INTO `sys_log` VALUES (1415, '2021-10-08 14:52:55', '', 'post', '127.0.0.1', 2495, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-08 14:52:55', 0);
INSERT INTO `sys_log` VALUES (1416, '2021-10-08 14:53:01', '管理商品', 'get', '127.0.0.1', 3530, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:53:01', 0);
INSERT INTO `sys_log` VALUES (1417, '2021-10-08 14:53:01', '管理商品', 'get', '127.0.0.1', 4543, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:53:01', 0);
INSERT INTO `sys_log` VALUES (1418, '2021-10-08 14:53:04', '商品信息', 'get', '127.0.0.1', 1786, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:53:04', 0);
INSERT INTO `sys_log` VALUES (1419, '2021-10-08 14:53:52', '管理商品', 'get', '127.0.0.1', 3439, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:53:52', 0);
INSERT INTO `sys_log` VALUES (1420, '2021-10-08 14:53:52', '管理商品', 'get', '127.0.0.1', 3113, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:53:52', 0);
INSERT INTO `sys_log` VALUES (1421, '2021-10-08 14:53:55', '商品信息', 'get', '127.0.0.1', 1995, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:53:55', 0);
INSERT INTO `sys_log` VALUES (1422, '2021-10-08 14:53:55', '', 'post', '127.0.0.1', 849, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-08 14:53:55', 0);
INSERT INTO `sys_log` VALUES (1423, '2021-10-08 14:54:01', '商品新增', 'post', '127.0.0.1', 7116, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-08 14:54:01', 0);
INSERT INTO `sys_log` VALUES (1424, '2021-10-08 14:54:02', '管理商品', 'get', '127.0.0.1', 6611, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:54:02', 0);
INSERT INTO `sys_log` VALUES (1425, '2021-10-08 14:54:02', '管理商品', 'get', '127.0.0.1', 7033, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:54:02', 0);
INSERT INTO `sys_log` VALUES (1426, '2021-10-08 14:54:28', '商品信息', 'get', '127.0.0.1', 2218, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:54:28', 0);
INSERT INTO `sys_log` VALUES (1427, '2021-10-08 14:54:28', '', 'post', '127.0.0.1', 708, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-08 14:54:28', 0);
INSERT INTO `sys_log` VALUES (1428, '2021-10-08 14:54:32', '管理商品', 'get', '127.0.0.1', 2859, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:54:32', 0);
INSERT INTO `sys_log` VALUES (1429, '2021-10-08 14:54:32', '管理商品', 'get', '127.0.0.1', 2692, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:54:32', 0);
INSERT INTO `sys_log` VALUES (1430, '2021-10-08 14:54:34', '商品信息', 'get', '127.0.0.1', 929, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:54:34', 0);
INSERT INTO `sys_log` VALUES (1431, '2021-10-08 14:54:43', '', 'get', '127.0.0.1', 586, 'admin', '/admin/materialgroup', '', 0, 1, '2021-10-08 14:54:43', 0);
INSERT INTO `sys_log` VALUES (1432, '2021-10-08 14:54:49', '', 'get', '127.0.0.1', 489, 'admin', '/admin/materialgroup', '', 0, 1, '2021-10-08 14:54:49', 0);
INSERT INTO `sys_log` VALUES (1433, '2021-10-08 14:55:08', '', 'post', '127.0.0.1', 643, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-08 14:55:08', 0);
INSERT INTO `sys_log` VALUES (1434, '2021-10-08 14:55:58', '用户个人信息', 'get', '127.0.0.1', 382, 'admin', '/admin/auth/info', '', 0, 1, '2021-10-08 14:55:58', 0);
INSERT INTO `sys_log` VALUES (1435, '2021-10-08 14:55:59', '', 'get', '127.0.0.1', 1529, 'admin', '/admin/menu/build', '', 0, 1, '2021-10-08 14:55:59', 0);
INSERT INTO `sys_log` VALUES (1436, '2021-10-08 14:55:59', '', 'get', '127.0.0.1', 480, 'admin', '/admin/materialgroup', '', 0, 1, '2021-10-08 14:55:59', 0);
INSERT INTO `sys_log` VALUES (1437, '2021-10-08 14:56:06', '商品新增', 'post', '127.0.0.1', 38908, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-08 14:56:06', 0);
INSERT INTO `sys_log` VALUES (1438, '2021-10-08 14:56:07', '管理商品', 'get', '127.0.0.1', 4781, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:56:07', 0);
INSERT INTO `sys_log` VALUES (1439, '2021-10-08 14:56:07', '管理商品', 'get', '127.0.0.1', 5582, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:56:07', 0);
INSERT INTO `sys_log` VALUES (1440, '2021-10-08 14:56:11', '商品信息', 'get', '127.0.0.1', 3876, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:56:11', 0);
INSERT INTO `sys_log` VALUES (1441, '2021-10-08 14:56:11', '', 'post', '127.0.0.1', 10145, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-08 14:56:11', 0);
INSERT INTO `sys_log` VALUES (1442, '2021-10-08 14:56:59', '商品信息', 'get', '127.0.0.1', 1129, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:56:59', 0);
INSERT INTO `sys_log` VALUES (1443, '2021-10-08 14:57:02', '商品信息', 'get', '127.0.0.1', 1649, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:57:02', 0);
INSERT INTO `sys_log` VALUES (1444, '2021-10-08 14:57:02', '', 'post', '127.0.0.1', 626, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-08 14:57:02', 0);
INSERT INTO `sys_log` VALUES (1445, '2021-10-08 14:57:04', '管理商品', 'get', '127.0.0.1', 5091, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:57:04', 0);
INSERT INTO `sys_log` VALUES (1446, '2021-10-08 14:57:04', '管理商品', 'get', '127.0.0.1', 5329, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:57:04', 0);
INSERT INTO `sys_log` VALUES (1447, '2021-10-08 14:57:06', '商品信息', 'get', '127.0.0.1', 1809, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:57:06', 0);
INSERT INTO `sys_log` VALUES (1448, '2021-10-08 14:57:07', '', 'post', '127.0.0.1', 9972, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-08 14:57:07', 0);
INSERT INTO `sys_log` VALUES (1449, '2021-10-08 14:57:09', '管理商品', 'get', '127.0.0.1', 4123, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:57:09', 0);
INSERT INTO `sys_log` VALUES (1450, '2021-10-08 14:57:09', '管理商品', 'get', '127.0.0.1', 6346, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:57:09', 0);
INSERT INTO `sys_log` VALUES (1451, '2021-10-08 14:57:12', '商品信息', 'get', '127.0.0.1', 1710, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:57:12', 0);
INSERT INTO `sys_log` VALUES (1452, '2021-10-08 14:57:12', '', 'post', '127.0.0.1', 75, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-08 14:57:12', 0);
INSERT INTO `sys_log` VALUES (1453, '2021-10-08 14:57:44', '管理商品', 'get', '127.0.0.1', 4793, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:57:44', 0);
INSERT INTO `sys_log` VALUES (1454, '2021-10-08 14:57:44', '管理商品', 'get', '127.0.0.1', 5480, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:57:44', 0);
INSERT INTO `sys_log` VALUES (1455, '2021-10-08 14:57:48', '商品删除', 'delete', '127.0.0.1', 1247, 'admin', '/shop/product/*', '', 0, 1, '2021-10-08 14:57:48', 0);
INSERT INTO `sys_log` VALUES (1456, '2021-10-08 14:57:48', '管理商品', 'get', '127.0.0.1', 3167, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:57:48', 0);
INSERT INTO `sys_log` VALUES (1457, '2021-10-08 14:57:53', '商品信息', 'get', '127.0.0.1', 2201, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:57:53', 0);
INSERT INTO `sys_log` VALUES (1458, '2021-10-08 14:57:53', '', 'post', '127.0.0.1', 2943, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-08 14:57:53', 0);
INSERT INTO `sys_log` VALUES (1459, '2021-10-08 14:57:57', '商品新增', 'post', '127.0.0.1', 10194, 'admin', '/shop/product/addOrSave', '', 0, 1, '2021-10-08 14:57:57', 0);
INSERT INTO `sys_log` VALUES (1460, '2021-10-08 14:57:58', '管理商品', 'get', '127.0.0.1', 4826, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:57:58', 0);
INSERT INTO `sys_log` VALUES (1461, '2021-10-08 14:57:58', '管理商品', 'get', '127.0.0.1', 4718, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:57:58', 0);
INSERT INTO `sys_log` VALUES (1462, '2021-10-08 14:58:01', '商品信息', 'get', '127.0.0.1', 1707, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:58:01', 0);
INSERT INTO `sys_log` VALUES (1463, '2021-10-08 14:58:01', '', 'post', '127.0.0.1', 2557, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-08 14:58:01', 0);
INSERT INTO `sys_log` VALUES (1464, '2021-10-08 14:58:04', '商品信息', 'get', '127.0.0.1', 1878, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 14:58:04', 0);
INSERT INTO `sys_log` VALUES (1465, '2021-10-08 14:58:04', '', 'post', '127.0.0.1', 80, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-08 14:58:04', 0);
INSERT INTO `sys_log` VALUES (1466, '2021-10-08 14:58:08', '管理商品', 'get', '127.0.0.1', 3876, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:58:08', 0);
INSERT INTO `sys_log` VALUES (1467, '2021-10-08 14:58:08', '管理商品', 'get', '127.0.0.1', 4322, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:58:08', 0);
INSERT INTO `sys_log` VALUES (1468, '2021-10-08 14:59:32', '管理商品', 'get', '127.0.0.1', 2124, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:59:32', 0);
INSERT INTO `sys_log` VALUES (1469, '2021-10-08 14:59:35', '管理商品', 'get', '127.0.0.1', 1965, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:59:35', 0);
INSERT INTO `sys_log` VALUES (1470, '2021-10-08 14:59:36', '管理商品', 'get', '127.0.0.1', 1621, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:59:36', 0);
INSERT INTO `sys_log` VALUES (1471, '2021-10-08 14:59:37', '管理商品', 'get', '127.0.0.1', 1996, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:59:37', 0);
INSERT INTO `sys_log` VALUES (1472, '2021-10-08 14:59:38', '管理商品', 'get', '127.0.0.1', 2163, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:59:38', 0);
INSERT INTO `sys_log` VALUES (1473, '2021-10-08 14:59:40', '管理商品', 'get', '127.0.0.1', 2033, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:59:40', 0);
INSERT INTO `sys_log` VALUES (1474, '2021-10-08 14:59:42', '管理商品', 'get', '127.0.0.1', 2069, 'admin', '/shop/product', '', 0, 1, '2021-10-08 14:59:42', 0);
INSERT INTO `sys_log` VALUES (1475, '2021-10-08 15:00:10', '管理商品', 'get', '127.0.0.1', 3933, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:00:10', 0);
INSERT INTO `sys_log` VALUES (1476, '2021-10-08 15:00:13', '管理商品', 'get', '127.0.0.1', 2078, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:00:13', 0);
INSERT INTO `sys_log` VALUES (1477, '2021-10-08 15:00:33', '管理商品', 'get', '127.0.0.1', 1979, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:00:33', 0);
INSERT INTO `sys_log` VALUES (1478, '2021-10-08 15:00:36', '管理商品', 'get', '127.0.0.1', 1927, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:00:36', 0);
INSERT INTO `sys_log` VALUES (1479, '2021-10-08 15:00:42', '管理商品', 'get', '127.0.0.1', 1857, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:00:42', 0);
INSERT INTO `sys_log` VALUES (1480, '2021-10-08 15:00:45', '管理商品', 'get', '127.0.0.1', 2059, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:00:45', 0);
INSERT INTO `sys_log` VALUES (1481, '2021-10-08 15:01:17', '管理商品', 'get', '127.0.0.1', 2430, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:01:17', 0);
INSERT INTO `sys_log` VALUES (1482, '2021-10-08 15:01:22', '管理商品', 'get', '127.0.0.1', 2314, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:01:22', 0);
INSERT INTO `sys_log` VALUES (1483, '2021-10-08 15:02:51', '管理商品', 'get', '127.0.0.1', 1835, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:02:51', 0);
INSERT INTO `sys_log` VALUES (1484, '2021-10-08 15:02:52', '管理商品', 'get', '127.0.0.1', 1659, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:02:52', 0);
INSERT INTO `sys_log` VALUES (1485, '2021-10-08 15:03:42', '管理商品', 'get', '127.0.0.1', 2000, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:03:42', 0);
INSERT INTO `sys_log` VALUES (1486, '2021-10-08 15:03:44', '管理商品', 'get', '127.0.0.1', 2075, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:03:44', 0);
INSERT INTO `sys_log` VALUES (1487, '2021-10-08 15:03:48', '管理商品', 'get', '127.0.0.1', 944, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:03:48', 0);
INSERT INTO `sys_log` VALUES (1488, '2021-10-08 15:06:08', '管理商品', 'get', '127.0.0.1', 2053, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:06:08', 0);
INSERT INTO `sys_log` VALUES (1489, '2021-10-08 15:06:13', '管理商品', 'get', '127.0.0.1', 2905, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:06:13', 0);
INSERT INTO `sys_log` VALUES (1490, '2021-10-08 15:06:16', '管理商品', 'get', '127.0.0.1', 976, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:06:16', 0);
INSERT INTO `sys_log` VALUES (1491, '2021-10-08 15:06:19', '管理商品', 'get', '127.0.0.1', 2095, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:06:19', 0);
INSERT INTO `sys_log` VALUES (1492, '2021-10-08 15:06:20', '管理商品', 'get', '127.0.0.1', 1164, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:06:20', 0);
INSERT INTO `sys_log` VALUES (1493, '2021-10-08 15:06:23', '管理商品', 'get', '127.0.0.1', 2057, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:06:23', 0);
INSERT INTO `sys_log` VALUES (1494, '2021-10-08 15:06:27', '商品信息', 'get', '127.0.0.1', 1047, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-08 15:06:27', 0);
INSERT INTO `sys_log` VALUES (1495, '2021-10-08 15:06:29', '管理商品', 'get', '127.0.0.1', 3013, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:06:29', 0);
INSERT INTO `sys_log` VALUES (1496, '2021-10-08 15:06:29', '管理商品', 'get', '127.0.0.1', 3367, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:06:29', 0);
INSERT INTO `sys_log` VALUES (1497, '2021-10-08 15:06:33', '管理商品', 'get', '127.0.0.1', 2645, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:06:33', 0);
INSERT INTO `sys_log` VALUES (1498, '2021-10-08 15:07:02', '角色菜单数', 'get', '127.0.0.1', 1137, 'admin', '/admin/menu/tree', '', 0, 1, '2021-10-08 15:07:02', 0);
INSERT INTO `sys_log` VALUES (1499, '2021-10-08 15:07:10', '菜单管理', 'get', '127.0.0.1', 1535, 'admin', '/admin/menu', '', 0, 1, '2021-10-08 15:07:10', 0);
INSERT INTO `sys_log` VALUES (1500, '2021-10-08 15:07:11', '角色菜单数', 'get', '127.0.0.1', 1431, 'admin', '/admin/menu/tree', '', 0, 1, '2021-10-08 15:07:11', 0);
INSERT INTO `sys_log` VALUES (1501, '2021-10-08 15:08:28', '菜单新增', 'post', '127.0.0.1', 1832, 'admin', '/admin/menu', '', 0, 1, '2021-10-08 15:08:28', 0);
INSERT INTO `sys_log` VALUES (1502, '2021-10-08 15:08:28', '菜单管理', 'get', '127.0.0.1', 1541, 'admin', '/admin/menu', '', 0, 1, '2021-10-08 15:08:28', 0);
INSERT INTO `sys_log` VALUES (1503, '2021-10-08 15:23:28', '管理商品', 'get', '127.0.0.1', 4013, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:23:28', 0);
INSERT INTO `sys_log` VALUES (1504, '2021-10-08 15:23:28', '管理商品', 'get', '127.0.0.1', 5223, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:23:28', 0);
INSERT INTO `sys_log` VALUES (1505, '2021-10-08 15:23:55', '菜单管理', 'get', '127.0.0.1', 1566, 'admin', '/admin/menu', '', 0, 1, '2021-10-08 15:23:55', 0);
INSERT INTO `sys_log` VALUES (1506, '2021-10-08 15:23:58', '角色菜单数', 'get', '127.0.0.1', 1384, 'admin', '/admin/menu/tree', '', 0, 1, '2021-10-08 15:23:58', 0);
INSERT INTO `sys_log` VALUES (1507, '2021-10-08 15:24:06', '菜单编辑', 'put', '127.0.0.1', 1061, 'admin', '/admin/menu', '', 0, 1, '2021-10-08 15:24:06', 0);
INSERT INTO `sys_log` VALUES (1508, '2021-10-08 15:24:06', '菜单管理', 'get', '127.0.0.1', 1742, 'admin', '/admin/menu', '', 0, 1, '2021-10-08 15:24:06', 0);
INSERT INTO `sys_log` VALUES (1509, '2021-10-08 15:24:09', '角色菜单数', 'get', '127.0.0.1', 1396, 'admin', '/admin/menu/tree', '', 0, 1, '2021-10-08 15:24:09', 0);
INSERT INTO `sys_log` VALUES (1510, '2021-10-08 15:24:09', '角色管理', 'get', '127.0.0.1', 4576, 'admin', '/admin/roles', '', 0, 1, '2021-10-08 15:24:09', 0);
INSERT INTO `sys_log` VALUES (1511, '2021-10-08 15:24:09', '角色管理', 'get', '127.0.0.1', 4006, 'admin', '/admin/roles', '', 0, 1, '2021-10-08 15:24:09', 0);
INSERT INTO `sys_log` VALUES (1512, '2021-10-08 15:24:17', '角色菜单保存', 'put', '127.0.0.1', 3995, 'admin', '/admin/roles/menu', '', 0, 1, '2021-10-08 15:24:17', 0);
INSERT INTO `sys_log` VALUES (1513, '2021-10-08 15:24:17', '单个角色', 'get', '127.0.0.1', 1698, 'admin', '/admin/roles/*', '', 0, 1, '2021-10-08 15:24:17', 0);
INSERT INTO `sys_log` VALUES (1514, '2021-10-08 15:24:20', '用户个人信息', 'get', '127.0.0.1', 394, 'admin', '/admin/auth/info', '', 0, 1, '2021-10-08 15:24:20', 0);
INSERT INTO `sys_log` VALUES (1515, '2021-10-08 15:24:20', '', 'get', '127.0.0.1', 2704, 'admin', '/admin/menu/build', '', 0, 1, '2021-10-08 15:24:20', 0);
INSERT INTO `sys_log` VALUES (1516, '2021-10-08 15:24:21', '管理商品', 'get', '127.0.0.1', 3676, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:24:21', 0);
INSERT INTO `sys_log` VALUES (1517, '2021-10-08 15:24:21', '管理商品', 'get', '127.0.0.1', 6203, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:24:21', 0);
INSERT INTO `sys_log` VALUES (1518, '2021-10-08 15:24:42', '菜单管理', 'get', '127.0.0.1', 1346, 'admin', '/admin/menu', '', 0, 1, '2021-10-08 15:24:42', 0);
INSERT INTO `sys_log` VALUES (1519, '2021-10-08 15:24:49', '角色菜单数', 'get', '127.0.0.1', 1528, 'admin', '/admin/menu/tree', '', 0, 1, '2021-10-08 15:24:49', 0);
INSERT INTO `sys_log` VALUES (1520, '2021-10-08 15:25:18', '菜单编辑', 'put', '127.0.0.1', 1085, 'admin', '/admin/menu', '', 0, 1, '2021-10-08 15:25:18', 0);
INSERT INTO `sys_log` VALUES (1521, '2021-10-08 15:25:18', '菜单管理', 'get', '127.0.0.1', 1572, 'admin', '/admin/menu', '', 0, 1, '2021-10-08 15:25:18', 0);
INSERT INTO `sys_log` VALUES (1522, '2021-10-08 15:25:32', '角色菜单数', 'get', '127.0.0.1', 1598, 'admin', '/admin/menu/tree', '', 0, 1, '2021-10-08 15:25:32', 0);
INSERT INTO `sys_log` VALUES (1523, '2021-10-08 15:25:39', '角色菜单数', 'get', '127.0.0.1', 1485, 'admin', '/admin/menu/tree', '', 0, 1, '2021-10-08 15:25:39', 0);
INSERT INTO `sys_log` VALUES (1524, '2021-10-08 15:26:01', '菜单编辑', 'put', '127.0.0.1', 967, 'admin', '/admin/menu', '', 0, 1, '2021-10-08 15:26:01', 0);
INSERT INTO `sys_log` VALUES (1525, '2021-10-08 15:26:01', '菜单管理', 'get', '127.0.0.1', 1491, 'admin', '/admin/menu', '', 0, 1, '2021-10-08 15:26:01', 0);
INSERT INTO `sys_log` VALUES (1526, '2021-10-08 15:26:13', '角色菜单数', 'get', '127.0.0.1', 1791, 'admin', '/admin/menu/tree', '', 0, 1, '2021-10-08 15:26:13', 0);
INSERT INTO `sys_log` VALUES (1527, '2021-10-08 15:26:17', '菜单编辑', 'put', '127.0.0.1', 1295, 'admin', '/admin/menu', '', 0, 1, '2021-10-08 15:26:17', 0);
INSERT INTO `sys_log` VALUES (1528, '2021-10-08 15:26:17', '菜单管理', 'get', '127.0.0.1', 1398, 'admin', '/admin/menu', '', 0, 1, '2021-10-08 15:26:17', 0);
INSERT INTO `sys_log` VALUES (1529, '2021-10-08 15:26:27', '角色菜单数', 'get', '127.0.0.1', 1243, 'admin', '/admin/menu/tree', '', 0, 1, '2021-10-08 15:26:27', 0);
INSERT INTO `sys_log` VALUES (1530, '2021-10-08 15:26:37', '角色菜单数', 'get', '127.0.0.1', 1296, 'admin', '/admin/menu/tree', '', 0, 1, '2021-10-08 15:26:37', 0);
INSERT INTO `sys_log` VALUES (1531, '2021-10-08 15:26:44', '角色菜单数', 'get', '127.0.0.1', 1239, 'admin', '/admin/menu/tree', '', 0, 1, '2021-10-08 15:26:44', 0);
INSERT INTO `sys_log` VALUES (1532, '2021-10-08 15:26:57', '菜单编辑', 'put', '127.0.0.1', 1209, 'admin', '/admin/menu', '', 0, 1, '2021-10-08 15:26:57', 0);
INSERT INTO `sys_log` VALUES (1533, '2021-10-08 15:26:57', '菜单管理', 'get', '127.0.0.1', 1546, 'admin', '/admin/menu', '', 0, 1, '2021-10-08 15:26:57', 0);
INSERT INTO `sys_log` VALUES (1534, '2021-10-08 15:27:05', '用户退出', 'delete', '127.0.0.1', 267, 'admin', '/admin/auth/logout', '', 0, 1, '2021-10-08 15:27:05', 0);
INSERT INTO `sys_log` VALUES (1535, '2021-10-08 15:27:10', '', 'get', '127.0.0.1', 1338, 'admin', '/admin/menu/build', '', 0, 1, '2021-10-08 15:27:10', 0);
INSERT INTO `sys_log` VALUES (1536, '2021-10-08 15:27:11', '管理商品', 'get', '127.0.0.1', 31081, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:27:11', 0);
INSERT INTO `sys_log` VALUES (1537, '2021-10-08 15:27:11', '管理商品', 'get', '127.0.0.1', 35056, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:27:11', 0);
INSERT INTO `sys_log` VALUES (1538, '2021-10-08 15:27:17', '上下架', 'post', '127.0.0.1', 794, 'admin', '/shop/product/onsale/*', '', 0, 1, '2021-10-08 15:27:17', 0);
INSERT INTO `sys_log` VALUES (1539, '2021-10-08 15:27:18', '管理商品', 'get', '127.0.0.1', 1865, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:27:18', 0);
INSERT INTO `sys_log` VALUES (1540, '2021-10-08 15:27:30', '管理商品', 'get', '127.0.0.1', 2213, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:27:30', 0);
INSERT INTO `sys_log` VALUES (1541, '2021-10-08 15:27:35', '管理商品', 'get', '127.0.0.1', 1902, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:27:35', 0);
INSERT INTO `sys_log` VALUES (1542, '2021-10-08 15:33:24', '管理商品', 'get', '127.0.0.1', 463, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:33:24', 0);
INSERT INTO `sys_log` VALUES (1543, '2021-10-08 15:33:25', '管理商品', 'get', '127.0.0.1', 264, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:33:25', 0);
INSERT INTO `sys_log` VALUES (1544, '2021-10-08 15:34:31', '管理商品', 'get', '127.0.0.1', 1751, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:34:31', 0);
INSERT INTO `sys_log` VALUES (1545, '2021-10-08 15:34:32', '管理商品', 'get', '127.0.0.1', 4712, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:34:32', 0);
INSERT INTO `sys_log` VALUES (1546, '2021-10-08 15:35:23', '管理商品', 'get', '127.0.0.1', 1393, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:35:23', 0);
INSERT INTO `sys_log` VALUES (1547, '2021-10-08 15:35:27', '上下架', 'post', '127.0.0.1', 1122, 'admin', '/shop/product/onsale/*', '', 0, 1, '2021-10-08 15:35:27', 0);
INSERT INTO `sys_log` VALUES (1548, '2021-10-08 15:35:28', '管理商品', 'get', '127.0.0.1', 1238, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:35:28', 0);
INSERT INTO `sys_log` VALUES (1549, '2021-10-08 15:35:30', '管理商品', 'get', '127.0.0.1', 2213, 'admin', '/shop/product', '', 0, 1, '2021-10-08 15:35:30', 0);
INSERT INTO `sys_log` VALUES (1550, '2021-10-09 10:04:01', '', 'get', '127.0.0.1', 4918, 'admin', '/admin/menu/build', '', 0, 1, '2021-10-09 10:04:01', 0);
INSERT INTO `sys_log` VALUES (1551, '2021-10-09 10:08:13', '用户个人信息', 'get', '127.0.0.1', 540, 'admin', '/admin/auth/info', '', 0, 1, '2021-10-09 10:08:13', 0);
INSERT INTO `sys_log` VALUES (1552, '2021-10-09 10:08:13', '', 'get', '127.0.0.1', 1191, 'admin', '/admin/menu/build', '', 0, 1, '2021-10-09 10:08:13', 0);
INSERT INTO `sys_log` VALUES (1553, '2021-10-09 10:08:38', '用户个人信息', 'get', '127.0.0.1', 341, 'admin', '/admin/auth/info', '', 0, 1, '2021-10-09 10:08:38', 0);
INSERT INTO `sys_log` VALUES (1554, '2021-10-09 10:08:38', '', 'get', '127.0.0.1', 11070, 'admin', '/admin/menu/build', '', 0, 1, '2021-10-09 10:08:38', 0);
INSERT INTO `sys_log` VALUES (1555, '2021-10-09 10:08:54', '用户个人信息', 'get', '127.0.0.1', 314, 'admin', '/admin/auth/info', '', 0, 1, '2021-10-09 10:08:54', 0);
INSERT INTO `sys_log` VALUES (1556, '2021-10-09 10:09:56', '商品分类', 'get', '127.0.0.1', 4562, 'admin', '/shop/cate', '', 0, 1, '2021-10-09 10:09:56', 0);
INSERT INTO `sys_log` VALUES (1557, '2021-10-09 10:10:59', '商品分类', 'get', '127.0.0.1', 684, 'admin', '/shop/cate', '', 0, 1, '2021-10-09 10:10:59', 0);
INSERT INTO `sys_log` VALUES (1558, '2021-10-09 10:11:01', '', 'get', '127.0.0.1', 26120, 'admin', '/admin/materialgroup', '', 0, 1, '2021-10-09 10:11:01', 0);
INSERT INTO `sys_log` VALUES (1559, '2021-10-09 10:11:54', '商品规格', 'get', '127.0.0.1', 5193, 'admin', '/shop/rule', '', 0, 1, '2021-10-09 10:11:54', 0);
INSERT INTO `sys_log` VALUES (1560, '2021-10-09 10:13:08', '管理商品', 'get', '127.0.0.1', 7076, 'admin', '/shop/product', '', 0, 1, '2021-10-09 10:13:08', 0);
INSERT INTO `sys_log` VALUES (1561, '2021-10-09 10:13:08', '管理商品', 'get', '127.0.0.1', 9378, 'admin', '/shop/product', '', 0, 1, '2021-10-09 10:13:08', 0);
INSERT INTO `sys_log` VALUES (1562, '2021-10-09 10:13:34', '商品信息', 'get', '127.0.0.1', 9615, 'admin', '/shop/product/info/*', '', 0, 1, '2021-10-09 10:13:34', 0);
INSERT INTO `sys_log` VALUES (1563, '2021-10-09 10:13:34', '', 'post', '127.0.0.1', 28548, 'admin', '/shop/product/isFormatAttr/*', '', 0, 1, '2021-10-09 10:13:34', 0);
INSERT INTO `sys_log` VALUES (1564, '2021-10-09 10:13:58', '用户个人信息', 'get', '127.0.0.1', 243, 'admin', '/admin/auth/info', '', 0, 1, '2021-10-09 10:13:58', 0);
INSERT INTO `sys_log` VALUES (1565, '2021-10-09 10:13:58', '', 'get', '127.0.0.1', 13850, 'admin', '/admin/menu/build', '', 0, 1, '2021-10-09 10:13:58', 0);
INSERT INTO `sys_log` VALUES (1566, '2021-10-09 10:13:58', '', 'get', '127.0.0.1', 8118, 'admin', '/admin/materialgroup', '', 0, 1, '2021-10-09 10:13:58', 0);
INSERT INTO `sys_log` VALUES (1567, '2021-10-09 10:14:59', '字典详情列表', 'get', '127.0.0.1', 3796, 'admin', '/admin/dictDetail', '', 0, 1, '2021-10-09 10:14:59', 0);
INSERT INTO `sys_log` VALUES (1568, '2021-10-09 10:14:59', '部门管理', 'get', '127.0.0.1', 1890, 'admin', '/admin/dept', '', 0, 1, '2021-10-09 10:14:59', 0);
INSERT INTO `sys_log` VALUES (1569, '2021-10-09 10:14:59', '用户管理', 'get', '127.0.0.1', 40929, 'admin', '/admin/user', '', 0, 1, '2021-10-09 10:14:59', 0);
INSERT INTO `sys_log` VALUES (1570, '2021-10-09 10:14:59', '用户管理', 'get', '127.0.0.1', 34510, 'admin', '/admin/user', '', 0, 1, '2021-10-09 10:14:59', 0);
INSERT INTO `sys_log` VALUES (1571, '2021-10-09 10:15:25', '角色菜单数', 'get', '127.0.0.1', 2658, 'admin', '/admin/menu/tree', '', 0, 1, '2021-10-09 10:15:25', 0);
INSERT INTO `sys_log` VALUES (1572, '2021-10-09 10:15:25', '角色管理', 'get', '127.0.0.1', 7031, 'admin', '/admin/roles', '', 0, 1, '2021-10-09 10:15:25', 0);
INSERT INTO `sys_log` VALUES (1573, '2021-10-09 10:15:25', '角色管理', 'get', '127.0.0.1', 4671, 'admin', '/admin/roles', '', 0, 1, '2021-10-09 10:15:25', 0);
INSERT INTO `sys_log` VALUES (1574, '2021-10-09 10:15:43', '菜单管理', 'get', '127.0.0.1', 22370, 'admin', '/admin/menu', '', 0, 1, '2021-10-09 10:15:43', 0);
INSERT INTO `sys_log` VALUES (1575, '2021-10-09 10:16:00', '字典详情列表', 'get', '127.0.0.1', 1278, 'admin', '/admin/dictDetail', '', 0, 1, '2021-10-09 10:16:00', 0);
INSERT INTO `sys_log` VALUES (1576, '2021-10-09 10:16:00', '部门管理', 'get', '127.0.0.1', 628, 'admin', '/admin/dept', '', 0, 1, '2021-10-09 10:16:00', 0);
INSERT INTO `sys_log` VALUES (1577, '2021-10-09 10:16:04', '操作日志', 'get', '127.0.0.1', 2299, 'admin', '/admin/logs', '', 0, 1, '2021-10-09 10:16:04', 0);
INSERT INTO `sys_log` VALUES (1578, '2021-10-09 10:16:19', '部门管理', 'get', '127.0.0.1', 476, 'admin', '/admin/dept', '', 0, 1, '2021-10-09 10:16:19', 0);
INSERT INTO `sys_log` VALUES (1579, '2021-10-09 10:16:19', '字典详情列表', 'get', '127.0.0.1', 1543, 'admin', '/admin/dictDetail', '', 0, 1, '2021-10-09 10:16:19', 0);
INSERT INTO `sys_log` VALUES (1580, '2021-10-09 10:16:27', '字典管理', 'get', '127.0.0.1', 5628, 'admin', '/admin/dict', '', 0, 1, '2021-10-09 10:16:27', 0);
INSERT INTO `sys_log` VALUES (1581, '2021-10-09 10:16:29', '字典详情列表', 'get', '127.0.0.1', 1294, 'admin', '/admin/dictDetail', '', 0, 1, '2021-10-09 10:16:29', 0);
INSERT INTO `sys_log` VALUES (1582, '2021-10-09 10:16:32', '字典详情列表', 'get', '127.0.0.1', 27923, 'admin', '/admin/dictDetail', '', 0, 1, '2021-10-09 10:16:32', 0);
INSERT INTO `sys_log` VALUES (1583, '2021-11-16 15:13:36', '分类修改', 'put', '127.0.0.1', 2007, 'admin', '/shop/cate', '', 0, 1, '2021-11-16 15:13:36', 0);
INSERT INTO `sys_log` VALUES (1584, '2021-11-16 15:13:36', '商品分类', 'get', '127.0.0.1', 574, 'admin', '/shop/cate', '', 0, 1, '2021-11-16 15:13:36', 0);
INSERT INTO `sys_log` VALUES (1585, '2021-11-16 15:17:01', '字典详情列表', 'get', '127.0.0.1', 1586, 'admin', '/admin/dictDetail', '', 0, 1, '2021-11-16 15:17:01', 0);
INSERT INTO `sys_log` VALUES (1586, '2021-11-16 15:17:01', '用户管理', 'get', '127.0.0.1', 3840, 'admin', '/admin/user', '', 0, 1, '2021-11-16 15:17:01', 0);
INSERT INTO `sys_log` VALUES (1587, '2021-11-16 15:17:01', '部门管理', 'get', '127.0.0.1', 635, 'admin', '/admin/dept', '', 0, 1, '2021-11-16 15:17:01', 0);
INSERT INTO `sys_log` VALUES (1588, '2021-11-16 15:17:01', '用户管理', 'get', '127.0.0.1', 3688, 'admin', '/admin/user', '', 0, 1, '2021-11-16 15:17:01', 0);
INSERT INTO `sys_log` VALUES (1589, '2021-11-16 15:17:03', '岗位管理', 'get', '127.0.0.1', 1401, 'admin', '/admin/job', '', 0, 1, '2021-11-16 15:17:03', 0);
INSERT INTO `sys_log` VALUES (1590, '2021-11-16 15:17:03', '部门管理', 'get', '127.0.0.1', 458, 'admin', '/admin/dept', '', 0, 1, '2021-11-16 15:17:03', 0);
INSERT INTO `sys_log` VALUES (1591, '2021-11-16 15:17:03', '角色管理', 'get', '127.0.0.1', 4272, 'admin', '/admin/roles', '', 0, 1, '2021-11-16 15:17:03', 0);
INSERT INTO `sys_log` VALUES (1592, '2021-11-16 15:17:03', '岗位管理', 'get', '127.0.0.1', 1631, 'admin', '/admin/job', '', 0, 1, '2021-11-16 15:17:03', 0);
INSERT INTO `sys_log` VALUES (1593, '2021-11-16 15:17:05', '用户编辑', 'put', '127.0.0.1', 3617, 'admin', '/admin/user', '', 0, 1, '2021-11-16 15:17:05', 0);
INSERT INTO `sys_log` VALUES (1594, '2021-11-16 15:17:05', '用户管理', 'get', '127.0.0.1', 2798, 'admin', '/admin/user', '', 0, 1, '2021-11-16 15:17:05', 0);
INSERT INTO `sys_log` VALUES (1595, '2021-11-16 15:17:26', '操作日志', 'get', '127.0.0.1', 1506, 'admin', '/admin/logs', '', 0, 1, '2021-11-16 15:17:26', 0);
INSERT INTO `sys_log` VALUES (1596, '2021-11-16 15:47:59', '用户个人信息', 'get', '127.0.0.1', 744, 'admin', '/admin/auth/info', '', 0, 1, '2021-11-16 15:47:59', 0);
INSERT INTO `sys_log` VALUES (1597, '2021-11-16 15:48:00', '', 'get', '127.0.0.1', 3357, 'admin', '/admin/menu/build', '', 0, 1, '2021-11-16 15:48:00', 0);
INSERT INTO `sys_log` VALUES (1598, '2021-11-16 15:49:04', '用户个人信息', 'get', '127.0.0.1', 316, 'admin', '/admin/auth/info', '', 0, 1, '2021-11-16 15:49:04', 0);
INSERT INTO `sys_log` VALUES (1599, '2021-11-16 15:49:04', '', 'get', '127.0.0.1', 5682, 'admin', '/admin/menu/build', '', 0, 1, '2021-11-16 15:49:04', 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_material
-- ----------------------------
DROP TABLE IF EXISTS `sys_material`;
CREATE TABLE `sys_material` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_id` bigint DEFAULT NULL COMMENT '创建者ID',
  `type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '类型1、图片；2、视频',
  `group_id` bigint DEFAULT NULL COMMENT '分组ID',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '素材名',
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '素材链接',
  `update_time` datetime DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='素材库';

-- ----------------------------
-- Records of sys_material
-- ----------------------------
BEGIN;
INSERT INTO `sys_material` VALUES (1, '2021-09-04 16:16:09', 0, '1', 0, 'test9.png', '', '2021-09-04 16:16:09', 1);
INSERT INTO `sys_material` VALUES (2, '2021-09-04 16:23:35', 0, '1', 0, 'test8.png', 'https://goapi.yixiang.co/static/upload/test8.png', '2021-09-04 16:23:35', 0);
INSERT INTO `sys_material` VALUES (3, '2021-09-04 16:24:38', 0, '1', 0, 'test4.png', 'https://goapi.yixiang.co/static/upload/test4.png', '2021-09-04 16:24:38', 0);
INSERT INTO `sys_material` VALUES (4, '2021-09-04 16:24:38', 0, '1', 0, 'test3.png', 'https://goapi.yixiang.co/static/upload/test3.png', '2021-09-04 16:24:38', 0);
INSERT INTO `sys_material` VALUES (5, '2021-09-04 16:35:03', 0, '1', 0, 'test5.png', 'https://goapi.yixiang.co/static/upload/test5.png', '2021-09-04 16:35:03', 0);
INSERT INTO `sys_material` VALUES (6, '2021-09-04 16:38:24', 0, '1', 2, 'test6.png', 'https://goapi.yixiang.co/static/upload/test6.png', '2021-09-04 16:38:24', 0);
INSERT INTO `sys_material` VALUES (7, '2021-09-04 16:38:41', 0, '1', 1, 'test8.png', 'https://goapi.yixiang.co/static/upload/test8.png', '2021-09-04 16:38:41', 0);
INSERT INTO `sys_material` VALUES (8, '2021-09-04 16:38:50', 0, '1', 1, 'test8.png', 'https://goapi.yixiang.co/static/upload/test8.png', '2021-09-04 16:38:50', 0);
INSERT INTO `sys_material` VALUES (9, '2021-10-07 15:48:10', 0, '1', 0, '1.jpg', '', '2021-10-07 15:48:10', 0);
INSERT INTO `sys_material` VALUES (10, '2021-10-07 15:54:37', 0, '1', 0, '1.jpg', 'https://goapi.yixiang.co/static/upload/1.jpg', '2021-10-07 15:54:37', 0);
INSERT INTO `sys_material` VALUES (11, '2021-10-08 14:33:51', 0, '1', 0, 'wawa.jpeg', 'https://goapi.yixiang.co/static/upload/wawa.jpeg', '2021-10-08 14:33:51', 0);
INSERT INTO `sys_material` VALUES (12, '2021-11-15 10:10:06', 1, '1', 0, '404.png', 'http://127.0.0.1:8000/upload/images/4f4adcbf8c6f66dcfc8a3282ac2bf10a.png', '2021-11-15 10:10:06', 0);
INSERT INTO `sys_material` VALUES (13, '2021-11-15 10:20:58', 1, '1', 0, 'address.png', 'http://127.0.0.1:8000/upload/images/884d9804999fc47a3c2694e49ad2536a.png', '2021-11-15 10:20:58', 0);
INSERT INTO `sys_material` VALUES (14, '2021-11-15 10:22:27', 1, '1', 4, 'angle.png', 'http://127.0.0.1:8000/upload/images/899186f7879ef9f1cf011b415f548c03.png', '2021-11-15 10:22:27', 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_material_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_material_group`;
CREATE TABLE `sys_material_group` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_id` bigint DEFAULT NULL COMMENT '创建者ID',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '分组名',
  `update_time` datetime DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='素材分组';

-- ----------------------------
-- Records of sys_material_group
-- ----------------------------
BEGIN;
INSERT INTO `sys_material_group` VALUES (1, '2021-09-04 14:59:20', 0, '分类', '2021-09-04 14:56:43', 0);
INSERT INTO `sys_material_group` VALUES (2, '2021-09-04 14:59:06', 0, '商品', '2021-09-04 14:59:06', 0);
INSERT INTO `sys_material_group` VALUES (3, '2021-09-04 14:59:28', 0, '啊啊啊啊', '2021-09-04 14:59:28', 1);
INSERT INTO `sys_material_group` VALUES (4, '2021-11-15 09:46:16', 1, 'aaa', '2021-11-15 09:46:16', 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `i_frame` tinyint(1) DEFAULT NULL COMMENT '是否外链',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单名称',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '组件',
  `pid` bigint NOT NULL COMMENT '上级菜单ID',
  `sort` int NOT NULL COMMENT '排序',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图标',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '链接地址',
  `cache` tinyint(1) DEFAULT '0' COMMENT '缓存',
  `hidden` tinyint(1) DEFAULT '0' COMMENT '是否隐藏',
  `component_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '-' COMMENT '组件名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `permission` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限',
  `type` int DEFAULT NULL COMMENT '类型',
  `update_time` datetime DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '0',
  `router` varchar(255) DEFAULT NULL COMMENT '操作的路由',
  `router_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '路由动作',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKqcf9gem97gqa5qjm4d3elcqt5` (`pid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1012 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', '', 0, 105, 'system', 'system', 0, 0, '', '2021-09-05 15:07:54', '', 1, '2020-07-16 20:05:34', 0, '', '');
INSERT INTO `sys_menu` VALUES (2, 0, '用户管理', 'system/user/index', 1, 2, 'peoples', 'user', 0, 0, 'User', '2021-05-25 14:56:42', 'user:list', 1, NULL, 0, '/admin/user', 'get');
INSERT INTO `sys_menu` VALUES (3, 0, '角色管理', 'system/role/index', 1, 3, 'role', 'role', 0, 0, 'Role', '2021-03-06 10:31:55', 'roles:list', 1, NULL, 0, '/admin/roles', 'get');
INSERT INTO `sys_menu` VALUES (5, 0, '菜单管理', 'system/menu/index', 1, 5, 'menu', 'menu', 0, 0, 'Menu', '2021-03-06 10:33:17', 'menu:list', 1, NULL, 0, '/admin/menu', 'get');
INSERT INTO `sys_menu` VALUES (35, 0, '部门管理', 'system/dept/index', 1, 6, 'dept', 'dept', 0, 0, 'Dept', '2021-03-06 10:34:35', 'dept:list', 1, NULL, 0, '/admin/dept', 'get');
INSERT INTO `sys_menu` VALUES (37, 0, '岗位管理', 'system/job/index', 1, 7, 'Steve-Jobs', 'job', 0, 0, 'Job', '2021-03-06 10:35:42', 'user:list', 1, NULL, 0, '/admin/job', 'get');
INSERT INTO `sys_menu` VALUES (39, 0, '字典管理', 'system/dict/index', 1, 8, 'dictionary', 'dict', 0, 0, 'Dict', '2021-03-06 12:54:29', 'dict:list', 1, NULL, 0, '/admin/dict', 'get');
INSERT INTO `sys_menu` VALUES (117, 0, '图表库', 'components/Echarts', 10, 50, 'chart', 'echarts', 1, 0, 'Echarts', '2019-11-21 09:04:32', '', 1, NULL, 0, NULL, NULL);
INSERT INTO `sys_menu` VALUES (120, 0, '商品删除', NULL, 45, 4, NULL, NULL, 0, 0, NULL, '2019-12-24 13:03:51', 'YXSTOREPRODUCT_DELETE', 2, '2020-07-10 16:22:51', 0, NULL, NULL);
INSERT INTO `sys_menu` VALUES (123, 0, '后台接口文档', 'tools/swagger/index', 999, 31, 'swagger', 'swagger2', 0, 0, 'Swagger', '2020-01-07 18:05:52', NULL, 1, NULL, 0, NULL, NULL);
INSERT INTO `sys_menu` VALUES (126, 0, '编辑', NULL, 54, 1, NULL, NULL, 0, 0, NULL, '2020-02-14 21:05:28', 'YXSTOREORDER_EDIT', 2, NULL, 0, NULL, NULL);
INSERT INTO `sys_menu` VALUES (127, 0, '用户新增', '', 2, 2, '', '', 0, 0, '', '2021-09-05 14:57:07', 'user:add', 2, NULL, 0, '/admin/user', 'post');
INSERT INTO `sys_menu` VALUES (128, 0, '用户编辑', '', 2, 3, '', '', 0, 0, '', '2021-09-05 14:57:39', 'user:edit', 2, NULL, 0, '/admin/user', 'put');
INSERT INTO `sys_menu` VALUES (129, 0, '用户删除', '', 2, 4, '', '', 0, 0, '', '2021-03-06 10:30:48', 'user:del', 2, NULL, 0, '/admin/user', 'delete');
INSERT INTO `sys_menu` VALUES (130, 0, '角色创建', '', 3, 2, '', '', 0, 0, '', '2021-03-06 10:32:15', 'roles:add', 2, NULL, 0, '/admin/roles', 'post');
INSERT INTO `sys_menu` VALUES (131, 0, '角色修改', '', 3, 3, '', '', 0, 0, '', '2021-03-06 10:32:27', 'roles:edit', 2, NULL, 0, '/admin/roles', 'put');
INSERT INTO `sys_menu` VALUES (132, 0, '角色删除', '', 3, 999, '', '', 0, 0, '', '2021-03-06 10:32:40', 'roles:del', 2, NULL, 0, '/admin/roles', 'delete');
INSERT INTO `sys_menu` VALUES (133, 0, '菜单新增', '', 5, 2, '', '', 0, 0, '', '2021-03-06 10:33:27', 'menu:add', 2, NULL, 0, '/admin/menu', 'post');
INSERT INTO `sys_menu` VALUES (134, 0, '菜单编辑', '', 5, 3, '', '', 0, 0, '', '2021-03-06 10:33:37', 'menu:edit', 2, NULL, 0, '/admin/menu', 'put');
INSERT INTO `sys_menu` VALUES (135, 0, '菜单删除', '', 5, 4, '', '', 0, 0, '', '2021-03-06 10:33:47', 'menu:del', 2, NULL, 0, '/admin/menu', 'delete');
INSERT INTO `sys_menu` VALUES (136, 0, '部门新增', '', 35, 2, '', '', 0, 0, '', '2021-03-06 10:34:58', 'dept:add', 2, NULL, 0, '/admin/dept', 'post');
INSERT INTO `sys_menu` VALUES (137, 0, '部门编辑', '', 35, 3, '', '', 0, 0, '', '2021-03-06 10:35:07', 'dept:edit', 2, NULL, 0, '/admin/dept', 'put');
INSERT INTO `sys_menu` VALUES (138, 0, '部门删除', '', 35, 4, '', '', 0, 0, '', '2021-03-06 10:35:16', 'dept:del', 2, NULL, 0, '/admin/dept', 'delete');
INSERT INTO `sys_menu` VALUES (139, 0, '岗位新增', '', 37, 2, '', '', 0, 0, '', '2021-03-06 10:35:53', 'job:add', 2, NULL, 0, '/admin/job', 'post');
INSERT INTO `sys_menu` VALUES (140, 0, '岗位编辑', '', 37, 3, '', '', 0, 0, '', '2021-03-06 10:36:02', 'job:edit', 2, NULL, 0, '/admin/job', 'put');
INSERT INTO `sys_menu` VALUES (141, 0, '岗位删除', '', 37, 4, '', '', 0, 0, '', '2021-03-06 10:36:10', 'job:del', 2, NULL, 0, '/admin/job', 'delete');
INSERT INTO `sys_menu` VALUES (142, 0, '字典新增', '', 39, 2, '', '', 0, 0, '', '2021-03-06 10:36:51', 'dict:add', 2, NULL, 0, '/admin/dict', 'post');
INSERT INTO `sys_menu` VALUES (143, 0, '字典编辑', '', 39, 3, '', '', 0, 0, '', '2021-03-06 10:36:59', 'dict:edit', 2, NULL, 0, '/admin/dict', 'put');
INSERT INTO `sys_menu` VALUES (144, 0, '字典删除', '', 39, 4, '', '', 0, 0, '', '2021-03-06 10:37:10', 'dict:del', 2, NULL, 0, '/admin/dict', 'delete');
INSERT INTO `sys_menu` VALUES (184, 0, '新增菜单', NULL, 49, 0, 'add', NULL, 0, 0, NULL, '2020-06-14 20:10:02', 'YxWechatMenu_CREATE', 2, NULL, 0, NULL, NULL);
INSERT INTO `sys_menu` VALUES (265, 0, '顶级2', 'top/aa', 264, 999, 'alipay', 'top2', 0, 0, 'TOp', '2021-03-03 16:09:42', 'top2', 1, '2021-03-03 16:00:39', 0, '/top', 'get');
INSERT INTO `sys_menu` VALUES (269, 0, '字典详情列表', 'system/dict/index', 1, 999, 'configure', 'dictDetail', 0, 1, 'DictDetail', '2021-09-22 15:49:18', 'dict_detail:list', 1, '2021-03-06 10:40:50', 0, '/admin/dictDetail', 'get');
INSERT INTO `sys_menu` VALUES (270, 0, '字典详情增加', '', 269, 999, '', '', 0, 0, '', '2021-03-06 12:57:17', 'dict_detail:add', 2, '2021-03-06 10:42:14', 0, '/admin/dictDetail', 'post');
INSERT INTO `sys_menu` VALUES (271, 0, '字典详情编辑', '', 269, 999, '', '', 0, 0, '', '2021-03-06 12:57:25', 'dict_detail:edit', 2, '2021-03-06 10:43:33', 0, '/admin/dictDetail', 'put');
INSERT INTO `sys_menu` VALUES (272, 0, '字典详情删除', '', 269, 999, '', '', 0, 0, '', '2021-03-06 12:57:33', 'dict_detail:delete', 2, '2021-03-06 10:44:09', 0, '/admin/dictDetail', 'delete');
INSERT INTO `sys_menu` VALUES (273, 0, '角色菜单数', '', 3, 999, '', '', 0, 0, '', '2021-03-06 10:36:41', 'role_menu:tree', 2, '2021-03-06 10:46:21', 0, '/admin/menu/tree', 'get');
INSERT INTO `sys_menu` VALUES (274, 0, '角色菜单保存', '', 3, 999, '', '', 0, 0, '', '2021-03-06 10:36:41', 'role_menu:save', 2, '2021-03-06 10:49:47', 0, '/admin/roles/menu', 'put');
INSERT INTO `sys_menu` VALUES (275, 0, '单个角色', '', 3, 999, '', '', 0, 0, '', '2021-03-06 10:36:41', 'roles:one', 2, '2021-03-06 11:18:28', 0, '/admin/roles/*', 'get');
INSERT INTO `sys_menu` VALUES (276, 0, '用户个人信息', '', 2, 999, '', '', 0, 0, '', '2021-03-06 10:36:41', 'user:info', 2, '2021-03-06 11:20:25', 0, '/admin/auth/info', 'get');
INSERT INTO `sys_menu` VALUES (277, 0, '用户头像', '', 2, 999, '', '', 0, 0, '', '2021-03-06 10:36:41', 'user:avatar', 2, '2021-03-06 11:21:41', 0, '/admin/user/updateAvatar', 'post');
INSERT INTO `sys_menu` VALUES (278, 0, '用户退出', '', 2, 999, '', '', 0, 0, '', '2021-03-06 11:25:00', 'user:logout', 2, '2021-03-06 11:25:00', 0, '/admin/auth/logout', 'delete');
INSERT INTO `sys_menu` VALUES (279, 0, '操作日志', 'system/log/index', 1, 999, 'log', 'log', 0, 0, 'Log', '2021-07-14 15:13:49', 'log:list', 1, '2021-07-14 14:45:05', 0, '/admin/logs', 'get');
INSERT INTO `sys_menu` VALUES (280, 0, '商品管理', '', 0, 103, 'shop', 'mall', 0, 0, '', '2021-09-05 16:24:08', '', 1, '2021-11-13 13:22:53', 0, '', '');
INSERT INTO `sys_menu` VALUES (281, 0, '商品分类', 'shop/cate/index', 280, 1, 'icon', 'cate', 0, 0, 'Cate', '2021-09-05 14:52:26', 'cate:list', 1, '2021-09-05 14:52:26', 0, '/shop/cate', 'get');
INSERT INTO `sys_menu` VALUES (282, 0, '新增分类', '', 281, 1, '', '', 0, 0, '', '2021-09-05 14:55:13', 'cate:add', 2, '2021-09-05 14:55:13', 0, '/shop/cate', 'post');
INSERT INTO `sys_menu` VALUES (283, 0, '分类修改', '', 281, 2, '', '', 0, 0, '', '2021-09-05 14:57:54', 'cate:edit', 2, '2021-09-05 14:57:54', 0, '/shop/cate', 'put');
INSERT INTO `sys_menu` VALUES (284, 0, '分类删除', '', 281, 3, '', '', 0, 0, '', '2021-09-05 14:58:24', 'cate:del', 2, '2021-09-05 14:58:24', 0, '/shop/cate', 'delete');
INSERT INTO `sys_menu` VALUES (999, 0, '系统工具', '', 0, 999, 'sys-tools', 'sys-tools', 0, 0, '', '2021-09-05 15:00:33', '', 1, NULL, 0, '', '');
INSERT INTO `sys_menu` VALUES (1000, 0, '商品规格', 'shop/storeProductRule/index', 280, 2, 'mnt', 'rule', 0, 0, 'Rule', '2021-09-10 10:36:38', 'rule:list', 1, '2021-09-10 10:36:38', 0, '/shop/rule', 'get');
INSERT INTO `sys_menu` VALUES (1001, 0, '新增/编辑规格', '', 1000, 1, '', '', 0, 0, '', '2021-09-10 10:54:18', 'rule:add', 2, '2021-09-10 10:38:37', 0, '/shop/rule/save/*', 'post');
INSERT INTO `sys_menu` VALUES (1002, 0, '规格编辑', '', 1000, 2, '', '', 0, 0, '', '2021-09-10 10:39:13', 'rule:edit', 2, '2021-09-10 10:39:13', 0, '/shop/rule', 'put');
INSERT INTO `sys_menu` VALUES (1003, 0, '规格删除', '', 1000, 3, '', '', 0, 0, '', '2021-09-10 10:39:57', 'rule:del', 2, '2021-09-10 10:39:57', 0, '/shop/rule', 'delete');
INSERT INTO `sys_menu` VALUES (1004, 0, '管理商品', 'shop/goods/tab', 280, 3, 'develop', 'goods', 0, 0, 'Goods', '2021-09-16 09:55:06', 'product:list', 1, '2021-09-16 09:55:06', 0, '/shop/product', 'get');
INSERT INTO `sys_menu` VALUES (1005, 0, '商品删除', '', 1004, 1, '', '', 0, 0, '', '2021-10-08 14:32:08', 'product:del', 2, '2021-09-16 09:56:28', 0, '/shop/product/*', 'delete');
INSERT INTO `sys_menu` VALUES (1006, 0, '商品新增', 'shop/goods/form', 280, 4, 'anq', 'goodsAdd', 0, 1, 'GoodsAdd', '2021-10-06 11:26:54', 'product;add', 1, '2021-09-16 09:58:00', 0, '/shop/product/addOrSave', 'post');
INSERT INTO `sys_menu` VALUES (1007, 0, '商品修改', 'shop/goods/form', 280, 5, 'anq', 'goodsEdit/:id', 0, 1, 'GoodsEdit', '2021-09-22 15:07:11', 'product:edit', 1, '2021-09-16 09:59:38', 0, 'product', 'put');
INSERT INTO `sys_menu` VALUES (1008, 0, '商品信息', '', 1004, 2, '', '', 0, 0, '', '2021-09-26 16:31:23', 'product:info', 2, '2021-09-26 16:31:23', 0, '/shop/product/info/*', 'get');
INSERT INTO `sys_menu` VALUES (1009, 0, '上下架', '', 1004, 3, '', '', 0, 0, '', '2021-10-08 15:26:57', 'product:on', 2, '2021-10-08 15:08:28', 0, '/shop/product/onsale/*', 'post');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `data_scope` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '数据权限',
  `level` int DEFAULT NULL COMMENT '角色级别',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `permission` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '功能权限',
  `update_time` datetime DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '超级管理员', '-9999', '全部', 1, '2021-05-25 15:06:39', 'admin', '2021-11-12 15:13:48', 0);
INSERT INTO `sys_role` VALUES (2, '普通用户', '-555', '本级', 2, '2021-07-14 14:12:26', 'common', '2021-11-13 13:22:42', 0);
INSERT INTO `sys_role` VALUES (3, '管理员2', '222', '全部', 3, '2020-01-31 16:53:25', '22', NULL, 0);
INSERT INTO `sys_role` VALUES (4, '667', '66', '全部', 3, '2021-03-02 16:16:43', '666', '2021-03-02 16:15:20', 1);
INSERT INTO `sys_role` VALUES (5, '99', '9', '全部', 3, '2021-03-02 16:16:35', '9', '2021-03-02 16:16:35', 1);
INSERT INTO `sys_role` VALUES (6, 'ttttr', 'tttt', '全部', 3, '2021-11-12 15:13:40', 'tttt', '2021-11-12 15:14:08', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_roles_depts
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_depts`;
CREATE TABLE `sys_roles_depts` (
  `sys_role_id` bigint NOT NULL,
  `sys_dept_id` bigint NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK7qg6itn5ajdoa9h9o78v9ksur` (`sys_dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='角色部门关联';

-- ----------------------------
-- Records of sys_roles_depts
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_roles_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_menus`;
CREATE TABLE `sys_roles_menus` (
  `sys_menu_id` bigint NOT NULL COMMENT '菜单ID',
  `sys_role_id` bigint NOT NULL COMMENT '角色ID',
  `id` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `FKcngg2qadojhi3a651a5adkvbq` (`sys_role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1195 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='角色菜单关联';

-- ----------------------------
-- Records of sys_roles_menus
-- ----------------------------
BEGIN;
INSERT INTO `sys_roles_menus` VALUES (280, 1, 946);
INSERT INTO `sys_roles_menus` VALUES (281, 1, 947);
INSERT INTO `sys_roles_menus` VALUES (282, 1, 948);
INSERT INTO `sys_roles_menus` VALUES (283, 1, 949);
INSERT INTO `sys_roles_menus` VALUES (284, 1, 950);
INSERT INTO `sys_roles_menus` VALUES (1000, 1, 951);
INSERT INTO `sys_roles_menus` VALUES (1001, 1, 952);
INSERT INTO `sys_roles_menus` VALUES (1002, 1, 953);
INSERT INTO `sys_roles_menus` VALUES (1003, 1, 954);
INSERT INTO `sys_roles_menus` VALUES (1004, 1, 955);
INSERT INTO `sys_roles_menus` VALUES (1005, 1, 956);
INSERT INTO `sys_roles_menus` VALUES (1008, 1, 957);
INSERT INTO `sys_roles_menus` VALUES (1009, 1, 958);
INSERT INTO `sys_roles_menus` VALUES (1006, 1, 959);
INSERT INTO `sys_roles_menus` VALUES (1007, 1, 960);
INSERT INTO `sys_roles_menus` VALUES (1, 1, 961);
INSERT INTO `sys_roles_menus` VALUES (2, 1, 962);
INSERT INTO `sys_roles_menus` VALUES (127, 1, 963);
INSERT INTO `sys_roles_menus` VALUES (128, 1, 964);
INSERT INTO `sys_roles_menus` VALUES (129, 1, 965);
INSERT INTO `sys_roles_menus` VALUES (278, 1, 966);
INSERT INTO `sys_roles_menus` VALUES (277, 1, 967);
INSERT INTO `sys_roles_menus` VALUES (276, 1, 968);
INSERT INTO `sys_roles_menus` VALUES (3, 1, 969);
INSERT INTO `sys_roles_menus` VALUES (130, 1, 970);
INSERT INTO `sys_roles_menus` VALUES (131, 1, 971);
INSERT INTO `sys_roles_menus` VALUES (275, 1, 972);
INSERT INTO `sys_roles_menus` VALUES (274, 1, 973);
INSERT INTO `sys_roles_menus` VALUES (273, 1, 974);
INSERT INTO `sys_roles_menus` VALUES (132, 1, 975);
INSERT INTO `sys_roles_menus` VALUES (5, 1, 976);
INSERT INTO `sys_roles_menus` VALUES (133, 1, 977);
INSERT INTO `sys_roles_menus` VALUES (134, 1, 978);
INSERT INTO `sys_roles_menus` VALUES (135, 1, 979);
INSERT INTO `sys_roles_menus` VALUES (35, 1, 980);
INSERT INTO `sys_roles_menus` VALUES (136, 1, 981);
INSERT INTO `sys_roles_menus` VALUES (137, 1, 982);
INSERT INTO `sys_roles_menus` VALUES (138, 1, 983);
INSERT INTO `sys_roles_menus` VALUES (37, 1, 984);
INSERT INTO `sys_roles_menus` VALUES (139, 1, 985);
INSERT INTO `sys_roles_menus` VALUES (140, 1, 986);
INSERT INTO `sys_roles_menus` VALUES (141, 1, 987);
INSERT INTO `sys_roles_menus` VALUES (39, 1, 988);
INSERT INTO `sys_roles_menus` VALUES (142, 1, 989);
INSERT INTO `sys_roles_menus` VALUES (143, 1, 990);
INSERT INTO `sys_roles_menus` VALUES (144, 1, 991);
INSERT INTO `sys_roles_menus` VALUES (279, 1, 992);
INSERT INTO `sys_roles_menus` VALUES (269, 1, 993);
INSERT INTO `sys_roles_menus` VALUES (272, 1, 994);
INSERT INTO `sys_roles_menus` VALUES (271, 1, 995);
INSERT INTO `sys_roles_menus` VALUES (270, 1, 996);
INSERT INTO `sys_roles_menus` VALUES (999, 1, 997);
INSERT INTO `sys_roles_menus` VALUES (123, 1, 998);
INSERT INTO `sys_roles_menus` VALUES (1, 3, 1125);
INSERT INTO `sys_roles_menus` VALUES (2, 3, 1126);
INSERT INTO `sys_roles_menus` VALUES (127, 3, 1127);
INSERT INTO `sys_roles_menus` VALUES (128, 3, 1128);
INSERT INTO `sys_roles_menus` VALUES (129, 3, 1129);
INSERT INTO `sys_roles_menus` VALUES (278, 3, 1130);
INSERT INTO `sys_roles_menus` VALUES (277, 3, 1131);
INSERT INTO `sys_roles_menus` VALUES (276, 3, 1132);
INSERT INTO `sys_roles_menus` VALUES (3, 3, 1133);
INSERT INTO `sys_roles_menus` VALUES (130, 3, 1134);
INSERT INTO `sys_roles_menus` VALUES (131, 3, 1135);
INSERT INTO `sys_roles_menus` VALUES (275, 3, 1136);
INSERT INTO `sys_roles_menus` VALUES (274, 3, 1137);
INSERT INTO `sys_roles_menus` VALUES (273, 3, 1138);
INSERT INTO `sys_roles_menus` VALUES (132, 3, 1139);
INSERT INTO `sys_roles_menus` VALUES (5, 3, 1140);
INSERT INTO `sys_roles_menus` VALUES (133, 3, 1141);
INSERT INTO `sys_roles_menus` VALUES (134, 3, 1142);
INSERT INTO `sys_roles_menus` VALUES (135, 3, 1143);
INSERT INTO `sys_roles_menus` VALUES (35, 3, 1144);
INSERT INTO `sys_roles_menus` VALUES (136, 3, 1145);
INSERT INTO `sys_roles_menus` VALUES (137, 3, 1146);
INSERT INTO `sys_roles_menus` VALUES (138, 3, 1147);
INSERT INTO `sys_roles_menus` VALUES (37, 3, 1148);
INSERT INTO `sys_roles_menus` VALUES (139, 3, 1149);
INSERT INTO `sys_roles_menus` VALUES (140, 3, 1150);
INSERT INTO `sys_roles_menus` VALUES (141, 3, 1151);
INSERT INTO `sys_roles_menus` VALUES (39, 3, 1152);
INSERT INTO `sys_roles_menus` VALUES (142, 3, 1153);
INSERT INTO `sys_roles_menus` VALUES (143, 3, 1154);
INSERT INTO `sys_roles_menus` VALUES (144, 3, 1155);
INSERT INTO `sys_roles_menus` VALUES (1, 2, 1182);
INSERT INTO `sys_roles_menus` VALUES (35, 2, 1183);
INSERT INTO `sys_roles_menus` VALUES (136, 2, 1184);
INSERT INTO `sys_roles_menus` VALUES (137, 2, 1185);
INSERT INTO `sys_roles_menus` VALUES (138, 2, 1186);
INSERT INTO `sys_roles_menus` VALUES (37, 2, 1187);
INSERT INTO `sys_roles_menus` VALUES (139, 2, 1188);
INSERT INTO `sys_roles_menus` VALUES (140, 2, 1189);
INSERT INTO `sys_roles_menus` VALUES (141, 2, 1190);
INSERT INTO `sys_roles_menus` VALUES (269, 2, 1191);
INSERT INTO `sys_roles_menus` VALUES (272, 2, 1192);
INSERT INTO `sys_roles_menus` VALUES (271, 2, 1193);
INSERT INTO `sys_roles_menus` VALUES (270, 2, 1194);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `avatar` varchar(200) DEFAULT NULL COMMENT '头像',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `enabled` tinyint(1) DEFAULT NULL COMMENT '状态：1启用、0禁用',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `dept_id` bigint DEFAULT NULL COMMENT '部门名称',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号码',
  `job_id` bigint DEFAULT NULL COMMENT '岗位名称',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `FK5rwmryny6jthaaxkogownknqp` (`dept_id`) USING BTREE,
  KEY `FKfftoc2abhot8f2wu6cl9a5iky` (`job_id`) USING BTREE,
  KEY `FKpq2dhypk2qgt68nauh2by22jb` (`avatar`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10031 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 'http://127.0.0.1:8000/upload/images/4f4adcbf8c6f66dcfc8a3282ac2bf10a.png', 'yshop@qq.com', 1, '$2a$10$fP.426qKaTmix50Oln8L.uav55gELhAd0Eg66Av4oG86u8km7D/Ky', 'admin', 2, '18888888886', 11, '2021-11-14 10:43:03', '管理员', '男', '2021-11-14 10:43:03', 0);
INSERT INTO `sys_user` VALUES (3, '', 'test@yshopnet', 1, '$2a$04$tw0sZ2EOqt7y.tkrnWHdgeyTG6ku7iv0vAACBTBwym5lNr2oQkG.y', 'test', 2, '17777777777', 12, NULL, '测试2', '男', '2021-11-10 17:08:33', 1);
INSERT INTO `sys_user` VALUES (4, NULL, 'test2@qq.com', 1, '$2a$10$IjehtV8MiXb8ni.Qz0wBteE7FjVn49cEcsSj2.ZBUqqHjnC3umSh.', 'test2', 2, '15136175247', 11, NULL, 'test2', '男', '2021-11-10 17:09:08', 1);
INSERT INTO `sys_user` VALUES (5, '', '444@qq.com', 1, '$2a$10$f/VH35NBOBszycV9KEA1HenQ0qVjazDm8LacQU9PO.A4UizFxLMuq', 'qqqqq', 11, '15136175249', 8, NULL, 'eeeeee', '男', '2021-11-10 17:09:10', 1);
INSERT INTO `sys_user` VALUES (6, '', '666@qq.com', 0, '$2a$10$3Vlo24eOmHHW7.3vAjqPSusfIINNo4JiujzxgqsaoWLx/d5de/jEm', '7777', 8, '15136175246', 8, NULL, '777', '男', '2021-11-10 17:09:19', 1);
INSERT INTO `sys_user` VALUES (9992, '', '66@qq.com', 1, '$2a$04$zI7VSH/WspYF9Kea1lCMkO/0pMh.d0U72EO6T0YinOxs.d97dTImi', 'hupeng33333', 7, '18888888888', 8, NULL, 'hu', '男', '2021-11-10 17:09:21', 1);
INSERT INTO `sys_user` VALUES (9993, '', '44@qq.com', 1, '$2a$04$IBgD8Un9Xgbi0lzbklZlC.uK1srn5w1Y5ntN1qfpzDgcipLLRp1aG', 'hupeng2', 11, '', 10, NULL, 'hu2', '男', '2021-11-10 17:09:24', 1);
INSERT INTO `sys_user` VALUES (9996, '', '777@qq.com', 0, '$2a$04$Ep/UAK2kmJKPto6efG9qyOYlwQ5NGL0T/PkLVrUcXJxTcq6WG5Zca', 'zhang', 5, '18888888888', 11, NULL, 'zhang', '男', '2021-11-10 17:09:27', 1);
INSERT INTO `sys_user` VALUES (9998, '', 'hu@qq.com', 1, '$2a$04$RWLjxYCIDjVweW5kKcg/B.uYvXdlaZT1NWkCJEj3EanhuB4ou4sZe', 'hupeng', 2, '15136175233', 8, '2021-11-16 15:17:05', 'hupeng', '男', '2021-11-16 15:17:05', 0);
INSERT INTO `sys_user` VALUES (10030, '', 'guchengwuyue@163.com', 1, '$2a$04$tkOcjauo03Fc2sWmm0aetOGl78iKOBNNiZHoTJpUiS6zWyCePU.u2', 'aaaaa111', 6, '15136175246', 8, '2021-11-10 17:53:23', 'aaa', '男', '2021-11-10 17:53:23', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_users_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_users_roles`;
CREATE TABLE `sys_users_roles` (
  `sys_user_id` bigint NOT NULL COMMENT '用户ID',
  `sys_role_id` bigint NOT NULL COMMENT '角色ID',
  `id` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='用户角色关联';

-- ----------------------------
-- Records of sys_users_roles
-- ----------------------------
BEGIN;
INSERT INTO `sys_users_roles` VALUES (1, 1, 1);
INSERT INTO `sys_users_roles` VALUES (3, 2, 2);
INSERT INTO `sys_users_roles` VALUES (4, 2, 3);
INSERT INTO `sys_users_roles` VALUES (9998, 2, 77);
COMMIT;

-- ----------------------------
-- Table structure for yshop_store_category
-- ----------------------------
DROP TABLE IF EXISTS `yshop_store_category`;
CREATE TABLE `yshop_store_category` (
  `id` mediumint NOT NULL AUTO_INCREMENT COMMENT '商品分类表ID',
  `pid` mediumint NOT NULL COMMENT '父id',
  `cate_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `sort` mediumint DEFAULT NULL COMMENT '排序',
  `pic` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '图标',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '是否推荐',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL,
  `is_del` tinyint unsigned DEFAULT '0' COMMENT '删除状态',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `is_base` (`is_show`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE,
  KEY `add_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='商品分类表';

-- ----------------------------
-- Records of yshop_store_category
-- ----------------------------
BEGIN;
INSERT INTO `yshop_store_category` VALUES (11, 0, '数码', 1, 'https://goapi.yixiang.co/static/upload/test3.png', 1, '2021-09-05 16:43:02', '2021-11-16 15:13:36', 0);
INSERT INTO `yshop_store_category` VALUES (12, 11, '手机', 1, 'https://goapi.yixiang.co/static/upload/test3.png', 1, '2021-09-05 16:40:29', '2021-09-05 16:40:29', 0);
INSERT INTO `yshop_store_category` VALUES (13, 0, '广告', 0, 'https://goapi.yixiang.co/static/upload/test3.png', 1, '2021-09-05 16:41:38', '2021-11-16 15:05:59', 0);
INSERT INTO `yshop_store_category` VALUES (14, 13, '写真', 1, 'https://goapi.yixiang.co/static/upload/test3.png', 1, '2021-09-17 15:33:12', '2021-09-05 16:41:56', 0);
INSERT INTO `yshop_store_category` VALUES (16, 0, 'tttt', 1, '', 1, '2021-11-15 10:53:39', '2021-11-15 10:54:23', 1);
INSERT INTO `yshop_store_category` VALUES (17, 16, 'tt44466', 1, 'http://127.0.0.1:8000/upload/images/899186f7879ef9f1cf011b415f548c03.png', 1, '2021-11-15 10:53:57', '2021-11-15 10:54:18', 1);
COMMIT;

-- ----------------------------
-- Table structure for yshop_store_product
-- ----------------------------
DROP TABLE IF EXISTS `yshop_store_product`;
CREATE TABLE `yshop_store_product` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `image` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品图片',
  `slider_image` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '轮播图',
  `store_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `store_info` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品简介',
  `keyword` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键字',
  `cate_id` int NOT NULL COMMENT '分类id',
  `price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `vip_price` decimal(8,2) unsigned DEFAULT '0.00' COMMENT '会员价格',
  `ot_price` decimal(8,2) unsigned DEFAULT '0.00' COMMENT '市场价',
  `postage` decimal(8,2) unsigned DEFAULT '0.00' COMMENT '邮费',
  `unit_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '单位名',
  `sort` smallint DEFAULT '0' COMMENT '排序',
  `sales` int unsigned DEFAULT '0' COMMENT '销量',
  `stock` int unsigned DEFAULT '0' COMMENT '库存',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '状态（0：未上架，1：上架）',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT '是否热卖',
  `is_benefit` tinyint(1) DEFAULT '0' COMMENT '是否优惠',
  `is_best` tinyint(1) DEFAULT '0' COMMENT '是否精品',
  `is_new` tinyint(1) DEFAULT '0' COMMENT '是否新品',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '产品描述',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL,
  `is_postage` tinyint unsigned DEFAULT '0' COMMENT '是否包邮',
  `is_del` tinyint unsigned DEFAULT '0' COMMENT '是否删除',
  `give_integral` decimal(8,2) unsigned DEFAULT NULL COMMENT '获得积分',
  `cost` decimal(8,2) unsigned DEFAULT NULL COMMENT '成本价',
  `is_good` tinyint(1) DEFAULT '0' COMMENT '是否优品推荐',
  `ficti` mediumint DEFAULT '100' COMMENT '虚拟销量',
  `browse` int DEFAULT '0' COMMENT '浏览量',
  `code_path` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '产品二维码地址(用户小程序海报)',
  `is_sub` tinyint(1) DEFAULT '0' COMMENT '是否单独分佣',
  `temp_id` int DEFAULT NULL COMMENT '运费模板ID',
  `spec_type` tinyint(1) DEFAULT '0' COMMENT '规格 0单 1多',
  `is_integral` tinyint(1) unsigned zerofill DEFAULT NULL COMMENT '是开启积分兑换',
  `integral` int(10) unsigned zerofill DEFAULT '0000000000' COMMENT '需要多少积分兑换',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `is_hot` (`is_hot`) USING BTREE,
  KEY `is_benefit` (`is_benefit`) USING BTREE,
  KEY `is_best` (`is_best`) USING BTREE,
  KEY `is_new` (`is_new`) USING BTREE,
  KEY `toggle_on_sale, is_del` (`is_del`) USING BTREE,
  KEY `price` (`price`) USING BTREE,
  KEY `is_show` (`is_show`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE,
  KEY `sales` (`sales`) USING BTREE,
  KEY `add_time` (`create_time`) USING BTREE,
  KEY `is_postage` (`is_postage`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='商品表';

-- ----------------------------
-- Records of yshop_store_product
-- ----------------------------
BEGIN;
INSERT INTO `yshop_store_product` VALUES (9, 'https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg', 'https://image.dayouqiantu.cn/5ca081af6183f.jpg,https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg', '照片打印', '照片打印', '照片打印', 12, 10.00, 8.00, 5.00, 1.00, '张', 0, 0, 99, 1, 0, 0, 0, 0, '<p><br/></p><p><img src=\"https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg\"/></p>', '2021-09-17 10:12:34', '2021-09-17 10:12:37', 0, 1, 1.00, 1.00, 0, 100, 0, '', 0, NULL, 0, 1, 0000000001);
INSERT INTO `yshop_store_product` VALUES (10, 'https://goapi.yixiang.co/static/upload/test6.png', 'https://goapi.yixiang.co/static/upload/test6.png', '11', '11', '11', 14, 0.00, 0.00, 0.00, 0.00, '1', 0, 0, 99, 1, 0, 0, 0, 0, '<p>99</p>', '2021-10-07 15:22:32', '2021-10-07 15:22:32', 0, 1, 0.00, 0.00, 0, 0, 0, '', 0, 0, 0, 0, 0000000000);
INSERT INTO `yshop_store_product` VALUES (11, 'https://goapi.yixiang.co/static/upload/test6.png', 'https://goapi.yixiang.co/static/upload/test6.png', '11', '11', '11', 14, 0.00, 0.00, 0.00, 0.00, '1', 0, 0, 99, 1, 0, 0, 0, 0, '<p>99</p>', '2021-10-07 15:23:38', '2021-10-07 15:23:38', 0, 1, 0.00, 0.00, 0, 0, 0, '', 0, 0, 0, 0, 0000000000);
INSERT INTO `yshop_store_product` VALUES (12, 'https://goapi.yixiang.co/static/upload/test6.png', 'https://goapi.yixiang.co/static/upload/test6.png', '11', '11', '11', 14, 0.00, 0.00, 0.00, 0.00, '1', 0, 0, 99, 1, 0, 0, 0, 0, '<p>99</p>', '2021-10-07 15:24:37', '2021-10-07 15:24:37', 0, 1, 0.00, 0.00, 0, 0, 0, '', 0, 0, 0, 0, 0000000000);
INSERT INTO `yshop_store_product` VALUES (13, 'https://goapi.yixiang.co/static/upload/test6.png', 'https://goapi.yixiang.co/static/upload/test6.png', '11', '11', '11', 14, 0.00, 0.00, 0.00, 0.00, '1', 0, 0, 99, 1, 0, 0, 0, 0, '<p>99</p>', '2021-10-07 15:26:35', '2021-10-07 15:26:35', 0, 1, 0.00, 0.00, 0, 0, 0, '', 0, 0, 0, 0, 0000000000);
INSERT INTO `yshop_store_product` VALUES (14, 'https://goapi.yixiang.co/static/upload/test6.png', 'https://goapi.yixiang.co/static/upload/test6.png', '11', '11', '11', 14, 0.00, 0.00, 0.00, 0.00, '1', 0, 0, 99, 1, 0, 0, 0, 0, '<p>99</p>', '2021-10-07 15:27:13', '2021-10-07 15:27:13', 0, 1, 0.00, 0.00, 0, 0, 0, '', 0, 0, 0, 0, 0000000000);
INSERT INTO `yshop_store_product` VALUES (15, 'https://goapi.yixiang.co/static/upload/test6.png', 'https://goapi.yixiang.co/static/upload/test6.png', '11', '11', '11', 14, 0.00, 0.00, 0.00, 0.00, '1', 0, 0, 99, 1, 0, 0, 0, 0, '<p>99</p>', '2021-10-07 15:28:18', '2021-10-07 15:28:18', 0, 1, 0.00, 0.00, 0, 0, 0, '', 0, 0, 0, 0, 0000000000);
INSERT INTO `yshop_store_product` VALUES (16, 'https://goapi.yixiang.co/static/upload/test6.png', 'https://goapi.yixiang.co/static/upload/test6.png', '11', '11', '11', 14, 0.00, 0.00, 0.00, 0.00, '1', 0, 0, 99, 1, 0, 0, 0, 0, '<p>99</p>', '2021-10-07 15:42:45', '2021-10-07 15:42:45', 0, 1, 0.00, 0.00, 0, 0, 0, '', 0, 0, 0, 0, 0000000000);
INSERT INTO `yshop_store_product` VALUES (17, 'https://goapi.yixiang.co/static/upload/test6.png', 'https://goapi.yixiang.co/static/upload/test6.png', '11', '11', '11', 14, 0.00, 0.00, 0.00, 0.00, '1', 0, 0, 99, 1, 0, 0, 0, 0, '<p>99</p>', '2021-10-07 15:43:15', '2021-10-07 15:43:15', 0, 1, 0.00, 0.00, 0, 0, 0, '', 0, 0, 0, 0, 0000000000);
INSERT INTO `yshop_store_product` VALUES (18, 'https://goapi.yixiang.co/static/upload/test6.png', 'https://goapi.yixiang.co/static/upload/test6.png', '11', '11', '11', 14, 0.00, 0.00, 0.00, 0.00, '1', 0, 0, 99, 1, 0, 0, 0, 0, '<p>99</p>', '2021-10-07 15:45:16', '2021-10-07 15:45:16', 0, 1, 0.00, 0.00, 0, 0, 0, '', 0, 0, 0, 0, 0000000000);
INSERT INTO `yshop_store_product` VALUES (19, 'https://goapi.yixiang.co/static/upload/1.jpg', 'https://goapi.yixiang.co/static/upload/1.jpg', '照片打印', '照片打印', '打印', 12, 0.00, 0.00, 0.00, 0.00, '张', 0, 0, 0, 1, 0, 0, 0, 0, '<p>多规格</p>', '2021-10-08 14:57:57', '2021-10-07 15:55:49', 0, 0, 0.00, 0.00, 0, 0, 0, '', 0, 0, 1, 0, 0000000000);
INSERT INTO `yshop_store_product` VALUES (20, 'https://goapi.yixiang.co/static/upload/wawa.jpeg', 'https://goapi.yixiang.co/static/upload/wawa.jpeg', '单规格4', '单规格', '单规格', 12, 1.00, 0.00, 1.00, 0.00, '个', 0, 0, 2, 1, 0, 0, 0, 0, '<p>2222444</p>', '2021-10-08 14:54:01', '2021-10-08 14:34:19', 0, 0, 0.00, 1.00, 0, 0, 0, '', 0, 0, 0, 0, 0000000000);
INSERT INTO `yshop_store_product` VALUES (21, 'https://goapi.yixiang.co/static/upload/wawa.jpeg', 'https://goapi.yixiang.co/static/upload/wawa.jpeg,https://goapi.yixiang.co/static/upload/wawa.jpeg,https://goapi.yixiang.co/static/upload/1.jpg', '222', '22', '222', 14, 1.00, 0.00, 1.00, 0.00, '22', 0, 0, 15, 1, 0, 0, 0, 0, '<p>1111</p><p><img src=\"https://goapi.yixiang.co/static/upload/wawa.jpeg\"/></p>', '2021-11-16 10:34:48', '2021-11-16 10:34:48', 0, 1, 0.00, 1.00, 0, 0, 0, '', 0, 0, 1, 0, 0000000000);
INSERT INTO `yshop_store_product` VALUES (22, 'http://127.0.0.1:8000/upload/images/899186f7879ef9f1cf011b415f548c03.png', 'http://127.0.0.1:8000/upload/images/899186f7879ef9f1cf011b415f548c03.png', 'www2', 'ww', 'www', 12, 1.00, 0.00, 1.00, 0.00, 'www', 0, 0, 110, 1, 0, 0, 0, 0, '<p>22</p>', '2021-11-16 10:31:14', '2021-11-16 10:31:14', 0, 0, 0.00, 1.00, 0, 0, 0, '', 0, 0, 1, 0, 0000000000);
COMMIT;

-- ----------------------------
-- Table structure for yshop_store_product_attr
-- ----------------------------
DROP TABLE IF EXISTS `yshop_store_product_attr`;
CREATE TABLE `yshop_store_product_attr` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `attr_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名',
  `attr_values` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `store_id` (`product_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='商品属性表';

-- ----------------------------
-- Records of yshop_store_product_attr
-- ----------------------------
BEGIN;
INSERT INTO `yshop_store_product_attr` VALUES (81, 10, '规格', '默认');
INSERT INTO `yshop_store_product_attr` VALUES (82, 11, '规格', '默认');
INSERT INTO `yshop_store_product_attr` VALUES (83, 12, '规格', '默认');
INSERT INTO `yshop_store_product_attr` VALUES (84, 13, '规格', '默认');
INSERT INTO `yshop_store_product_attr` VALUES (85, 14, '规格', '默认');
INSERT INTO `yshop_store_product_attr` VALUES (86, 15, '规格', '默认');
INSERT INTO `yshop_store_product_attr` VALUES (87, 16, '规格', '默认');
INSERT INTO `yshop_store_product_attr` VALUES (88, 17, '规格', '默认');
INSERT INTO `yshop_store_product_attr` VALUES (89, 18, '规格', '默认');
INSERT INTO `yshop_store_product_attr` VALUES (94, 20, '规格', '默认');
INSERT INTO `yshop_store_product_attr` VALUES (95, 21, '颜色', '黑色,白色,红色');
INSERT INTO `yshop_store_product_attr` VALUES (96, 21, '尺寸', '11,111');
INSERT INTO `yshop_store_product_attr` VALUES (97, 21, '大小', 'a3,a4');
INSERT INTO `yshop_store_product_attr` VALUES (98, 19, '颜色', '黑色,白色');
INSERT INTO `yshop_store_product_attr` VALUES (99, 19, '尺寸', '111,112');
INSERT INTO `yshop_store_product_attr` VALUES (102, 0, '颜色', '黑色,白色');
INSERT INTO `yshop_store_product_attr` VALUES (103, 0, '尺寸', '111,112');
INSERT INTO `yshop_store_product_attr` VALUES (106, 22, '颜色', '黑色,白色');
INSERT INTO `yshop_store_product_attr` VALUES (107, 22, '尺寸', '111,112');
COMMIT;

-- ----------------------------
-- Table structure for yshop_store_product_attr_result
-- ----------------------------
DROP TABLE IF EXISTS `yshop_store_product_attr_result`;
CREATE TABLE `yshop_store_product_attr_result` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL COMMENT '商品ID',
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性参数',
  `change_time` datetime NOT NULL COMMENT '上次修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='商品属性详情表';

-- ----------------------------
-- Records of yshop_store_product_attr_result
-- ----------------------------
BEGIN;
INSERT INTO `yshop_store_product_attr_result` VALUES (61, 16, '{\"attr\":[{\"detail\":[\"默认\"],\"value\":\"规格\"}],\"value\":[{\"brokerage\":\"\",\"brokerage_two\":\"\",\"price\":\"\",\"ot_price\":\"\",\"postage\":\"\",\"cost\":\"\",\"stock\":\"99\",\"pic\":\"https://goapi.yixiang.co/static/upload/test6.png\",\"value1\":\"规格\",\"value2\":\"\",\"weight\":\"\",\"volume\":\"\",\"detail\":{\"规格\":\"默认\"}}]}', '2021-10-07 15:42:45');
INSERT INTO `yshop_store_product_attr_result` VALUES (62, 17, '{\"attr\":[{\"detail\":[\"默认\"],\"value\":\"规格\"}],\"value\":[{\"brokerage\":\"\",\"brokerage_two\":\"\",\"price\":\"\",\"ot_price\":\"\",\"postage\":\"\",\"cost\":\"\",\"stock\":\"99\",\"pic\":\"https://goapi.yixiang.co/static/upload/test6.png\",\"value1\":\"规格\",\"value2\":\"\",\"weight\":\"\",\"volume\":\"\",\"detail\":{\"规格\":\"默认\"}}]}', '2021-10-07 15:43:15');
INSERT INTO `yshop_store_product_attr_result` VALUES (63, 18, '{\"attr\":[{\"detail\":[\"默认\"],\"value\":\"规格\"}],\"value\":[{\"brokerage\":\"\",\"brokerage_two\":\"\",\"price\":\"\",\"ot_price\":\"\",\"postage\":\"\",\"cost\":\"\",\"stock\":\"99\",\"pic\":\"https://goapi.yixiang.co/static/upload/test6.png\",\"value1\":\"规格\",\"value2\":\"\",\"weight\":\"\",\"volume\":\"\",\"detail\":{\"规格\":\"默认\"}}]}', '2021-10-07 15:45:16');
INSERT INTO `yshop_store_product_attr_result` VALUES (67, 20, '{\"attr\":[{\"detail\":[\"默认\"],\"value\":\"规格\"}],\"value\":[{\"brokerage\":\"\",\"brokerage_two\":\"\",\"price\":\"1\",\"ot_price\":\"1\",\"postage\":\"\",\"cost\":\"1\",\"stock\":\"2\",\"pic\":\"https://goapi.yixiang.co/static/upload/wawa.jpeg\",\"value1\":\"规格\",\"value2\":\"\",\"weight\":\"\",\"volume\":\"\",\"detail\":{\"规格\":\"默认\"}}]}', '2021-10-08 14:54:01');
INSERT INTO `yshop_store_product_attr_result` VALUES (68, 21, '{\"attr\":[{\"detail\":[\"黑色\",\"白色\",\"红色\"],\"value\":\"颜色\"},{\"detail\":[\"11\",\"111\"],\"value\":\"尺寸\"},{\"detail\":[\"a3\",\"a4\"],\"value\":\"大小\"}],\"value\":[{\"brokerage\":\"\",\"brokerage_two\":\"\",\"price\":\"1\",\"ot_price\":\"\",\"postage\":\"\",\"cost\":\"\",\"stock\":\"1\",\"pic\":\"https://goapi.yixiang.co/static/upload/wawa.jpeg\",\"value1\":\"黑色\",\"value2\":\"11\",\"weight\":\"\",\"volume\":\"\",\"detail\":{\"大小\":\"a3\",\"尺寸\":\"11\",\"颜色\":\"黑色\"}},{\"brokerage\":\"\",\"brokerage_two\":\"\",\"price\":\"1\",\"ot_price\":\"\",\"postage\":\"\",\"cost\":\"\",\"stock\":\"1\",\"pic\":\"https://goapi.yixiang.co/static/upload/wawa.jpeg\",\"value1\":\"黑色\",\"value2\":\"11\",\"weight\":\"\",\"volume\":\"\",\"detail\":{\"大小\":\"a4\",\"尺寸\":\"11\",\"颜色\":\"黑色\"}},{\"brokerage\":\"\",\"brokerage_two\":\"\",\"price\":\"1\",\"ot_price\":\"\",\"postage\":\"\",\"cost\":\"\",\"stock\":\"1\",\"pic\":\"https://goapi.yixiang.co/static/upload/wawa.jpeg\",\"value1\":\"黑色\",\"value2\":\"111\",\"weight\":\"\",\"volume\":\"\",\"detail\":{\"大小\":\"a3\",\"尺寸\":\"111\",\"颜色\":\"黑色\"}},{\"brokerage\":\"\",\"brokerage_two\":\"\",\"price\":\"1\",\"ot_price\":\"\",\"postage\":\"\",\"cost\":\"\",\"stock\":\"1\",\"pic\":\"https://goapi.yixiang.co/static/upload/wawa.jpeg\",\"value1\":\"黑色\",\"value2\":\"111\",\"weight\":\"\",\"volume\":\"\",\"detail\":{\"大小\":\"a4\",\"尺寸\":\"111\",\"颜色\":\"黑色\"}},{\"brokerage\":\"\",\"brokerage_two\":\"\",\"price\":\"2\",\"ot_price\":\"\",\"postage\":\"\",\"cost\":\"\",\"stock\":\"2\",\"pic\":\"https://goapi.yixiang.co/static/upload/wawa.jpeg\",\"value1\":\"白色\",\"value2\":\"11\",\"weight\":\"\",\"volume\":\"\",\"detail\":{\"大小\":\"a3\",\"尺寸\":\"11\",\"颜色\":\"白色\"}},{\"brokerage\":\"\",\"brokerage_two\":\"\",\"price\":\"4\",\"ot_price\":\"\",\"postage\":\"\",\"cost\":\"\",\"stock\":\"3\",\"pic\":\"https://goapi.yixiang.co/static/upload/wawa.jpeg\",\"value1\":\"白色\",\"value2\":\"11\",\"weight\":\"\",\"volume\":\"\",\"detail\":{\"大小\":\"a4\",\"尺寸\":\"11\",\"颜色\":\"白色\"}},{\"brokerage\":\"\",\"brokerage_two\":\"\",\"price\":\"1\",\"ot_price\":\"\",\"postage\":\"\",\"cost\":\"\",\"stock\":\"1\",\"pic\":\"https://goapi.yixiang.co/static/upload/wawa.jpeg\",\"value1\":\"白色\",\"value2\":\"111\",\"weight\":\"\",\"volume\":\"\",\"detail\":{\"大小\":\"a3\",\"尺寸\":\"111\",\"颜色\":\"白色\"}},{\"brokerage\":\"\",\"brokerage_two\":\"\",\"price\":\"1\",\"ot_price\":\"\",\"postage\":\"\",\"cost\":\"\",\"stock\":\"1\",\"pic\":\"https://goapi.yixiang.co/static/upload/wawa.jpeg\",\"value1\":\"白色\",\"value2\":\"111\",\"weight\":\"\",\"volume\":\"\",\"detail\":{\"大小\":\"a4\",\"尺寸\":\"111\",\"颜色\":\"白色\"}},{\"brokerage\":\"\",\"brokerage_two\":\"\",\"price\":\"1\",\"ot_price\":\"\",\"postage\":\"\",\"cost\":\"\",\"stock\":\"1\",\"pic\":\"https://goapi.yixiang.co/static/upload/wawa.jpeg\",\"value1\":\"红色\",\"value2\":\"11\",\"weight\":\"\",\"volume\":\"\",\"detail\":{\"大小\":\"a3\",\"尺寸\":\"11\",\"颜色\":\"红色\"}},{\"brokerage\":\"\",\"brokerage_two\":\"\",\"price\":\"1\",\"ot_price\":\"\",\"postage\":\"\",\"cost\":\"\",\"stock\":\"1\",\"pic\":\"https://goapi.yixiang.co/static/upload/wawa.jpeg\",\"value1\":\"红色\",\"value2\":\"11\",\"weight\":\"\",\"volume\":\"\",\"detail\":{\"大小\":\"a4\",\"尺寸\":\"11\",\"颜色\":\"红色\"}},{\"brokerage\":\"\",\"brokerage_two\":\"\",\"price\":\"1\",\"ot_price\":\"\",\"postage\":\"\",\"cost\":\"\",\"stock\":\"1\",\"pic\":\"https://goapi.yixiang.co/static/upload/wawa.jpeg\",\"value1\":\"红色\",\"value2\":\"111\",\"weight\":\"\",\"volume\":\"\",\"detail\":{\"大小\":\"a3\",\"尺寸\":\"111\",\"颜色\":\"红色\"}},{\"brokerage\":\"\",\"brokerage_two\":\"\",\"price\":\"1\",\"ot_price\":\"\",\"postage\":\"\",\"cost\":\"\",\"stock\":\"1\",\"pic\":\"https://goapi.yixiang.co/static/upload/wawa.jpeg\",\"value1\":\"红色\",\"value2\":\"111\",\"weight\":\"\",\"volume\":\"\",\"detail\":{\"大小\":\"a4\",\"尺寸\":\"111\",\"颜色\":\"红色\"}}]}', '2021-10-08 14:56:06');
INSERT INTO `yshop_store_product_attr_result` VALUES (69, 19, '{\"attr\":[{\"detail\":[\"黑色\",\"白色\"],\"value\":\"颜色\"},{\"detail\":[\"111\",\"112\"],\"value\":\"尺寸\"}],\"value\":[{\"brokerage\":\"\",\"brokerage_two\":\"\",\"price\":\"\",\"ot_price\":\"\",\"postage\":\"\",\"cost\":\"\",\"stock\":\"\",\"pic\":\"https://goapi.yixiang.co/static/upload/1.jpg\",\"value1\":\"黑色\",\"value2\":\"111\",\"weight\":\"\",\"volume\":\"\",\"detail\":{\"尺寸\":\"111\",\"颜色\":\"黑色\"}},{\"brokerage\":\"\",\"brokerage_two\":\"\",\"price\":\"\",\"ot_price\":\"\",\"postage\":\"\",\"cost\":\"\",\"stock\":\"\",\"pic\":\"https://goapi.yixiang.co/static/upload/1.jpg\",\"value1\":\"黑色\",\"value2\":\"112\",\"weight\":\"\",\"volume\":\"\",\"detail\":{\"尺寸\":\"112\",\"颜色\":\"黑色\"}},{\"brokerage\":\"\",\"brokerage_two\":\"\",\"price\":\"\",\"ot_price\":\"\",\"postage\":\"\",\"cost\":\"\",\"stock\":\"\",\"pic\":\"https://goapi.yixiang.co/static/upload/1.jpg\",\"value1\":\"白色\",\"value2\":\"111\",\"weight\":\"\",\"volume\":\"\",\"detail\":{\"尺寸\":\"111\",\"颜色\":\"白色\"}},{\"brokerage\":\"\",\"brokerage_two\":\"\",\"price\":\"\",\"ot_price\":\"\",\"postage\":\"\",\"cost\":\"\",\"stock\":\"\",\"pic\":\"https://goapi.yixiang.co/static/upload/1.jpg\",\"value1\":\"白色\",\"value2\":\"112\",\"weight\":\"\",\"volume\":\"\",\"detail\":{\"尺寸\":\"112\",\"颜色\":\"白色\"}}]}', '2021-10-08 14:57:57');
INSERT INTO `yshop_store_product_attr_result` VALUES (70, 0, '{\"attr\":[{\"detail\":[\"黑色\",\"白色\"],\"value\":\"颜色\"},{\"detail\":[\"111\",\"112\"],\"value\":\"尺寸\"}],\"value\":[{\"brokerage\":\"\",\"brokerage_two\":\"\",\"price\":\"1\",\"ot_price\":\"1\",\"postage\":\"\",\"cost\":\"1\",\"stock\":\"11\",\"pic\":\"http://127.0.0.1:8000/upload/images/899186f7879ef9f1cf011b415f548c03.png\",\"value1\":\"黑色\",\"value2\":\"111\",\"weight\":\"1\",\"volume\":\"1\",\"detail\":{\"尺寸\":\"111\",\"颜色\":\"黑色\"}},{\"brokerage\":\"\",\"brokerage_two\":\"\",\"price\":\"2\",\"ot_price\":\"1\",\"postage\":\"\",\"cost\":\"1\",\"stock\":\"22\",\"pic\":\"http://127.0.0.1:8000/upload/images/899186f7879ef9f1cf011b415f548c03.png\",\"value1\":\"黑色\",\"value2\":\"112\",\"weight\":\"1\",\"volume\":\"1\",\"detail\":{\"尺寸\":\"112\",\"颜色\":\"黑色\"}},{\"brokerage\":\"\",\"brokerage_two\":\"\",\"price\":\"3\",\"ot_price\":\"1\",\"postage\":\"\",\"cost\":\"1\",\"stock\":\"33\",\"pic\":\"http://127.0.0.1:8000/upload/images/899186f7879ef9f1cf011b415f548c03.png\",\"value1\":\"白色\",\"value2\":\"111\",\"weight\":\"1\",\"volume\":\"1\",\"detail\":{\"尺寸\":\"111\",\"颜色\":\"白色\"}},{\"brokerage\":\"\",\"brokerage_two\":\"\",\"price\":\"4\",\"ot_price\":\"1\",\"postage\":\"\",\"cost\":\"1\",\"stock\":\"44\",\"pic\":\"http://127.0.0.1:8000/upload/images/899186f7879ef9f1cf011b415f548c03.png\",\"value1\":\"白色\",\"value2\":\"112\",\"weight\":\"1\",\"volume\":\"1\",\"detail\":{\"尺寸\":\"112\",\"颜色\":\"白色\"}}]}', '2021-11-16 09:45:34');
INSERT INTO `yshop_store_product_attr_result` VALUES (72, 22, '{\"attr\":[{\"detail\":[\"黑色\",\"白色\"],\"value\":\"颜色\"},{\"detail\":[\"111\",\"112\"],\"value\":\"尺寸\"}],\"value\":[{\"brokerage\":\"\",\"brokerage_two\":\"\",\"price\":\"1\",\"ot_price\":\"1\",\"postage\":\"\",\"cost\":\"0\",\"stock\":\"11\",\"pic\":\"http://127.0.0.1:8000/upload/images/899186f7879ef9f1cf011b415f548c03.png\",\"value1\":\"黑色\",\"value2\":\"111\",\"weight\":\"0\",\"volume\":\"0\",\"detail\":{\"尺寸\":\"111\",\"颜色\":\"黑色\"}},{\"brokerage\":\"\",\"brokerage_two\":\"\",\"price\":\"2\",\"ot_price\":\"2\",\"postage\":\"\",\"cost\":\"0\",\"stock\":\"22\",\"pic\":\"http://127.0.0.1:8000/upload/images/899186f7879ef9f1cf011b415f548c03.png\",\"value1\":\"黑色\",\"value2\":\"112\",\"weight\":\"0\",\"volume\":\"0\",\"detail\":{\"尺寸\":\"112\",\"颜色\":\"黑色\"}},{\"brokerage\":\"\",\"brokerage_two\":\"\",\"price\":\"3\",\"ot_price\":\"3\",\"postage\":\"\",\"cost\":\"0\",\"stock\":\"33\",\"pic\":\"http://127.0.0.1:8000/upload/images/899186f7879ef9f1cf011b415f548c03.png\",\"value1\":\"白色\",\"value2\":\"111\",\"weight\":\"0\",\"volume\":\"0\",\"detail\":{\"尺寸\":\"111\",\"颜色\":\"白色\"}},{\"brokerage\":\"\",\"brokerage_two\":\"\",\"price\":\"4\",\"ot_price\":\"4\",\"postage\":\"\",\"cost\":\"0\",\"stock\":\"44\",\"pic\":\"http://127.0.0.1:8000/upload/images/899186f7879ef9f1cf011b415f548c03.png\",\"value1\":\"白色\",\"value2\":\"112\",\"weight\":\"0\",\"volume\":\"0\",\"detail\":{\"尺寸\":\"112\",\"颜色\":\"白色\"}}]}', '2021-11-16 10:13:37');
COMMIT;

-- ----------------------------
-- Table structure for yshop_store_product_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `yshop_store_product_attr_value`;
CREATE TABLE `yshop_store_product_attr_value` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL COMMENT '商品ID',
  `sku` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性索引值 (attr_value|attr_value[|....])',
  `stock` int unsigned NOT NULL COMMENT '属性对应的库存',
  `sales` int unsigned DEFAULT '0' COMMENT '销量',
  `price` decimal(8,2) unsigned NOT NULL COMMENT '属性金额',
  `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片',
  `unique` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '唯一值',
  `cost` decimal(8,2) unsigned NOT NULL COMMENT '成本价',
  `bar_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品条码',
  `ot_price` decimal(10,2) DEFAULT '0.00' COMMENT '原价',
  `weight` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '重量',
  `volume` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '体积',
  `brokerage` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '一级返佣',
  `brokerage_two` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '二级返佣',
  `pink_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '拼团价',
  `pink_stock` int NOT NULL DEFAULT '0' COMMENT '拼团库存',
  `seckill_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '秒杀价',
  `seckill_stock` int NOT NULL DEFAULT '0' COMMENT '秒杀库存',
  `integral` int(10) unsigned zerofill DEFAULT '0000000000' COMMENT '需要多少积分兑换',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unique` (`unique`,`sku`) USING BTREE,
  KEY `store_id` (`product_id`,`sku`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='商品属性值表';

-- ----------------------------
-- Records of yshop_store_product_attr_value
-- ----------------------------
BEGIN;
INSERT INTO `yshop_store_product_attr_value` VALUES (135, 16, '默认', 99, 0, 0.00, 'https://goapi.yixiang.co/static/upload/test6.png', '1zAYsQLP8Gbf2I57WuSAw6h22yA', 0.00, '', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 0000000000);
INSERT INTO `yshop_store_product_attr_value` VALUES (136, 17, '默认', 99, 0, 0.00, 'https://goapi.yixiang.co/static/upload/test6.png', '1zAYwBqK7dAlqtFxC2bMP5DJ00H', 0.00, '', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 0000000000);
INSERT INTO `yshop_store_product_attr_value` VALUES (137, 18, '默认', 99, 0, 0.00, 'https://goapi.yixiang.co/static/upload/test6.png', '1zAZBHyGODXKvaj9QthWGr23JQJ', 0.00, '', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 0000000000);
INSERT INTO `yshop_store_product_attr_value` VALUES (144, 20, '默认', 2, 0, 1.00, 'https://goapi.yixiang.co/static/upload/wawa.jpeg', '1zDI4TFt2vdXvDlJljzr1GQN7S0', 1.00, '', 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 0000000000);
INSERT INTO `yshop_store_product_attr_value` VALUES (145, 21, '11,a3,黑色', 1, 0, 1.00, 'https://goapi.yixiang.co/static/upload/wawa.jpeg', '1zDIKI0bYI0Bw47a47Y97MdWAC3', 0.00, '', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 0000000000);
INSERT INTO `yshop_store_product_attr_value` VALUES (146, 21, '11,a4,黑色', 1, 0, 1.00, 'https://goapi.yixiang.co/static/upload/wawa.jpeg', '1zDIKDDkEAb0lDX8ll3911usAn5', 0.00, '', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 0000000000);
INSERT INTO `yshop_store_product_attr_value` VALUES (147, 21, '111,a3,黑色', 1, 0, 1.00, 'https://goapi.yixiang.co/static/upload/wawa.jpeg', '1zDIKG66aTSeHtpEFAAz4lMncpK', 0.00, '', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 0000000000);
INSERT INTO `yshop_store_product_attr_value` VALUES (148, 21, '111,a4,黑色', 1, 0, 1.00, 'https://goapi.yixiang.co/static/upload/wawa.jpeg', '1zDIKHGx6fq1JnSVS3Ppa6mXV3K', 0.00, '', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 0000000000);
INSERT INTO `yshop_store_product_attr_value` VALUES (149, 21, '11,a3,白色', 2, 0, 2.00, 'https://goapi.yixiang.co/static/upload/wawa.jpeg', '1zDIKHEs9MFpT6oH4y1kwVzojQD', 0.00, '', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 0000000000);
INSERT INTO `yshop_store_product_attr_value` VALUES (150, 21, '11,a4,白色', 3, 0, 4.00, 'https://goapi.yixiang.co/static/upload/wawa.jpeg', '1zDIKIRR4hxb73574dxptEx1E2w', 0.00, '', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 0000000000);
INSERT INTO `yshop_store_product_attr_value` VALUES (151, 21, '111,a3,白色', 1, 0, 1.00, 'https://goapi.yixiang.co/static/upload/wawa.jpeg', '1zDIKB6XZ1DL53ColeyisgVMGM8', 0.00, '', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 0000000000);
INSERT INTO `yshop_store_product_attr_value` VALUES (152, 21, '111,a4,白色', 1, 0, 1.00, 'https://goapi.yixiang.co/static/upload/wawa.jpeg', '1zDIKDTsaMpmIEQ16sY9fdlroS2', 0.00, '', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 0000000000);
INSERT INTO `yshop_store_product_attr_value` VALUES (153, 21, '11,a3,红色', 1, 0, 1.00, 'https://goapi.yixiang.co/static/upload/wawa.jpeg', '1zDIKBftB8USJsVYvVA2QYZCS4D', 0.00, '', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 0000000000);
INSERT INTO `yshop_store_product_attr_value` VALUES (154, 21, '11,a4,红色', 1, 0, 1.00, 'https://goapi.yixiang.co/static/upload/wawa.jpeg', '1zDIKGy7av8Z8Gzt9NSWAufUaky', 0.00, '', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 0000000000);
INSERT INTO `yshop_store_product_attr_value` VALUES (155, 21, '111,a3,红色', 1, 0, 1.00, 'https://goapi.yixiang.co/static/upload/wawa.jpeg', '1zDIKHIB5anryA34KLTDu0kYQiu', 0.00, '', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 0000000000);
INSERT INTO `yshop_store_product_attr_value` VALUES (156, 21, '111,a4,红色', 1, 0, 1.00, 'https://goapi.yixiang.co/static/upload/wawa.jpeg', '1zDIKGb4Ry8tCHGcUDxdOgk85nm', 0.00, '', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 0000000000);
INSERT INTO `yshop_store_product_attr_value` VALUES (157, 19, '111,黑色', 0, 0, 0.00, 'https://goapi.yixiang.co/static/upload/1.jpg', '1zDIYKS5baHLzRTLVWVUuUrA0H6', 0.00, '', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 0000000000);
INSERT INTO `yshop_store_product_attr_value` VALUES (158, 19, '112,黑色', 0, 0, 0.00, 'https://goapi.yixiang.co/static/upload/1.jpg', '1zDIYKx6dgOF5y2NI2FyDzJqGOB', 0.00, '', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 0000000000);
INSERT INTO `yshop_store_product_attr_value` VALUES (159, 19, '111,白色', 0, 0, 0.00, 'https://goapi.yixiang.co/static/upload/1.jpg', '1zDIYKYxa2RE4KICWUBCNDlkkkk', 0.00, '', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 0000000000);
INSERT INTO `yshop_store_product_attr_value` VALUES (160, 19, '112,白色', 0, 0, 0.00, 'https://goapi.yixiang.co/static/upload/1.jpg', '1zDIYGzcwkgqMJu1ndXHJ1VwkQW', 0.00, '', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 0000000000);
INSERT INTO `yshop_store_product_attr_value` VALUES (165, 0, '111,黑色', 11, 0, 1.00, 'http://127.0.0.1:8000/upload/images/899186f7879ef9f1cf011b415f548c03.png', '20yqNJ9BDaMq1Wsut8TPD55vfM3', 1.00, '', 1.00, 1.00, 1.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 0000000000);
INSERT INTO `yshop_store_product_attr_value` VALUES (166, 0, '112,黑色', 22, 0, 2.00, 'http://127.0.0.1:8000/upload/images/899186f7879ef9f1cf011b415f548c03.png', '20yqNNDsM7w8PFwuHlxA0QANYkK', 1.00, '', 1.00, 1.00, 1.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 0000000000);
INSERT INTO `yshop_store_product_attr_value` VALUES (167, 0, '111,白色', 33, 0, 3.00, 'http://127.0.0.1:8000/upload/images/899186f7879ef9f1cf011b415f548c03.png', '20yqNJg0davoTOsD5ebZGHEBwod', 1.00, '', 1.00, 1.00, 1.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 0000000000);
INSERT INTO `yshop_store_product_attr_value` VALUES (168, 0, '112,白色', 44, 0, 4.00, 'http://127.0.0.1:8000/upload/images/899186f7879ef9f1cf011b415f548c03.png', '20yqNKflhkO8gkwPEdYicMxirL8', 1.00, '', 1.00, 1.00, 1.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 0000000000);
INSERT INTO `yshop_store_product_attr_value` VALUES (173, 22, '111,黑色', 11, 0, 1.00, 'http://127.0.0.1:8000/upload/images/899186f7879ef9f1cf011b415f548c03.png', '20ytmmj2gS2YuOBXukmbEYJOLnS', 0.00, '', 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 0000000000);
INSERT INTO `yshop_store_product_attr_value` VALUES (174, 22, '112,黑色', 22, 0, 2.00, 'http://127.0.0.1:8000/upload/images/899186f7879ef9f1cf011b415f548c03.png', '20ytmmo6ZRt5NH0kEv513CzhsoE', 0.00, '', 2.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 0000000000);
INSERT INTO `yshop_store_product_attr_value` VALUES (175, 22, '111,白色', 33, 0, 3.00, 'http://127.0.0.1:8000/upload/images/899186f7879ef9f1cf011b415f548c03.png', '20ytmrWb73BfBVjyzYjhUNTDlBX', 0.00, '', 3.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 0000000000);
INSERT INTO `yshop_store_product_attr_value` VALUES (176, 22, '112,白色', 44, 0, 4.00, 'http://127.0.0.1:8000/upload/images/899186f7879ef9f1cf011b415f548c03.png', '20ytmoPouTuXMiWoemHqHyCkyZK', 0.00, '', 4.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 0000000000);
COMMIT;

-- ----------------------------
-- Table structure for yshop_store_product_rule
-- ----------------------------
DROP TABLE IF EXISTS `yshop_store_product_rule`;
CREATE TABLE `yshop_store_product_rule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rule_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规格名称',
  `rule_value` text NOT NULL COMMENT '规格值',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='商品规则值(规格)表';

-- ----------------------------
-- Records of yshop_store_product_rule
-- ----------------------------
BEGIN;
INSERT INTO `yshop_store_product_rule` VALUES (26, '规格', '[{\"detail\":[\"黑色\",\"白色\"],\"value\":\"颜色\"},{\"detail\":[\"111\",\"112\"],\"value\":\"尺寸\"}]', '2021-09-10 16:20:51', '2021-09-10 16:20:51', 0);
INSERT INTO `yshop_store_product_rule` VALUES (27, '规格2', '[{\"detail\":[\"黑色\",\"白色\"],\"value\":\"颜色\"},{\"detail\":[\"111\",\"112\"],\"value\":\"尺寸\"}]', '2021-09-11 11:44:13', '2021-09-11 11:44:13', 0);
INSERT INTO `yshop_store_product_rule` VALUES (28, '规格22', '[{\"detail\":[\"黑色\",\"白色\"],\"value\":\"颜色\"},{\"detail\":[\"111\",\"112\"],\"value\":\"尺寸\"}]', '2021-09-11 11:45:24', '2021-09-11 11:45:24', 1);
INSERT INTO `yshop_store_product_rule` VALUES (29, '规格2277', '[{\"detail\":[\"黑色\",\"白色\"],\"value\":\"颜色\"},{\"detail\":[\"111\",\"112\"],\"value\":\"尺寸\"}]', '2021-09-11 11:46:27', '2021-09-11 11:46:27', 1);
INSERT INTO `yshop_store_product_rule` VALUES (30, '规格288', '[{\"detail\":[\"黑色\",\"白色\"],\"value\":\"颜色\"},{\"detail\":[\"111\",\"112\"],\"value\":\"尺寸\"}]', '2021-09-11 11:46:43', '2021-09-11 11:46:43', 1);
INSERT INTO `yshop_store_product_rule` VALUES (31, '规格2889', '[{\"detail\":[\"黑色\",\"白色\"],\"value\":\"颜色\"},{\"detail\":[\"111\",\"112\"],\"value\":\"尺寸\"}]', '2021-09-11 11:47:06', '2021-09-11 11:47:06', 1);
INSERT INTO `yshop_store_product_rule` VALUES (32, '规格288999', '[{\"detail\":[\"黑色\",\"白色\"],\"value\":\"颜色\"},{\"detail\":[\"111\",\"112\"],\"value\":\"尺寸\"}]', '2021-09-11 11:52:40', '2021-09-11 11:52:40', 1);
INSERT INTO `yshop_store_product_rule` VALUES (33, '规格20', '[{\"detail\":[\"黑色\",\"白色\"],\"value\":\"颜色\"},{\"detail\":[\"111\",\"112\"],\"value\":\"尺寸\"}]', '2021-09-11 11:53:18', '2021-09-11 11:53:18', 1);
INSERT INTO `yshop_store_product_rule` VALUES (34, '规格211', '[{\"detail\":[\"黑色\",\"白色\"],\"value\":\"颜色\"},{\"detail\":[\"111\",\"112\"],\"value\":\"尺寸\"}]', '2021-09-11 13:32:14', '2021-09-11 13:31:31', 0);
INSERT INTO `yshop_store_product_rule` VALUES (35, '一个规格', '[{\"detail\":[\"11\",\"30\",\"40\"],\"value\":\"尺寸\"}]', '2021-10-05 13:41:11', '2021-10-05 13:41:11', 0);
INSERT INTO `yshop_store_product_rule` VALUES (36, '三个规格', '[{\"detail\":[\"黑色\",\"白色\",\"红色\"],\"value\":\"颜色\"},{\"detail\":[\"11\",\"111\"],\"value\":\"尺寸\"},{\"detail\":[\"a3\",\"a4\"],\"value\":\"大小\"}]', '2021-10-05 13:42:09', '2021-10-05 13:42:09', 0);
INSERT INTO `yshop_store_product_rule` VALUES (37, '四个规格', '[{\"detail\":[\"110\",\"119\"],\"value\":\"长度\"},{\"detail\":[\"110h\"],\"value\":\"高度\"},{\"detail\":[\"99hou\"],\"value\":\"厚度\"},{\"detail\":[\"77shen\"],\"value\":\"深度\"}]', '2021-10-05 15:06:53', '2021-10-05 15:06:53', 0);
INSERT INTO `yshop_store_product_rule` VALUES (38, 'test24', '[{\"detail\":[\"黑色\"],\"value\":\"颜色\"},{\"detail\":[\"aaa\"],\"value\":\"尺寸\"}]', '2021-11-15 14:53:17', '2021-11-15 14:55:44', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
