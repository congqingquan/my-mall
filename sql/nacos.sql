/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50738
 Source Host           : localhost:3306
 Source Schema         : nacos

 Target Server Type    : MySQL
 Target Server Version : 50738
 File Encoding         : 65001

 Date: 10/07/2023 17:30:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `encrypted_data_key` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (1, 'order-service', 'DEFAULT_GROUP', 'server:\n  port: 6200\n\nlogging:\n  level:\n    root: info\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: order-service', '7307c765b64ca32c9ee59348ef8c2d52', '2023-06-30 07:58:19', '2023-07-04 08:35:59', 'nacos', '0:0:0:0:0:0:0:1', '', '0298b122-a60d-47f5-9be3-9ea149f17185', NULL, NULL, NULL, 'text', NULL, '');
INSERT INTO `config_info` VALUES (2, 'goods-service', 'DEFAULT_GROUP', 'server:\n  port: 6100\n\nlogging:\n  level:\n    root: info\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: goods-service', '925d96de09932fb30832547f5f645e5a', '2023-06-30 07:59:09', '2023-07-04 08:36:09', 'nacos', '0:0:0:0:0:0:0:1', '', '0298b122-a60d-47f5-9be3-9ea149f17185', NULL, NULL, NULL, 'text', NULL, '');
INSERT INTO `config_info` VALUES (3, 'nacos-service', 'DEFAULT_GROUP', 'server:\n  port: 6300\n\nlogging:\n  level:\n    root: info\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: nacos-service\n\ntest-key: nacos-service-test-key', 'cb9ed0dde0069a40a666a75cd47cb9d1', '2023-07-03 01:53:46', '2023-07-04 08:36:21', 'nacos', '0:0:0:0:0:0:0:1', '', '0298b122-a60d-47f5-9be3-9ea149f17185', NULL, NULL, NULL, 'text', NULL, '');
INSERT INTO `config_info` VALUES (4, 'load-balance-service', 'DEFAULT_GROUP', 'server:\n  port: 6400\n\nlogging:\n  level:\n    root: info\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: load-balance-service', 'c6474b927ed56467faa9f05213b8b49c', '2023-07-04 06:56:27', '2023-07-10 07:21:05', 'nacos', '0:0:0:0:0:0:0:1', '', '0298b122-a60d-47f5-9be3-9ea149f17185', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (5, 'openfeign-service', 'DEFAULT_GROUP', 'server:\n  port: 6500\n\nlogging:\n  level:\n    priv.cqq.openfeign.feign.*: debug\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: openfeign-service', '75bcf39ef4ae8464d46d58aed249997c', '2023-07-05 09:08:10', '2023-07-10 07:21:15', 'nacos', '0:0:0:0:0:0:0:1', '', '0298b122-a60d-47f5-9be3-9ea149f17185', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (6, 'sentinel-service', 'DEFAULT_GROUP', 'server:\n  port: 6600\n\nlogging:\n  level:\n    root: info\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n    \n    # sentinel:\n    #   transport:\n    #     # 控制台的地址\n    #     dashboard: 127.0.0.1:8400\n    #     # 与控制台通讯的端口，默认是8719，不可用会一直+1，只至找到一个可用的\n    #     port: 6601\n    #     # 和控制台保持心跳的ip地址\n    #     client-ip: 127.0.0.1\n    #     # 发送心跳的周期，默认是10s\n    #     heartbeat-interval-ms: 3000\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: sentinel-service', '459d0ef6ec70b264930ead70cae8a88d', '2023-07-10 03:15:15', '2023-07-10 08:36:08', 'nacos', '0:0:0:0:0:0:0:1', '', '0298b122-a60d-47f5-9be3-9ea149f17185', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (10, 'extension-config-0', 'DEFAULT_GROUP', 'test-key: extendsion0', '9d2ad2c4ec812cfe597bc04463c84b2c', '2023-07-03 02:56:45', '2023-07-03 08:13:07', 'nacos', '0:0:0:0:0:0:0:1', '', '0298b122-a60d-47f5-9be3-9ea149f17185', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (11, 'extension-config-1', 'DEFAULT_GROUP', 'test-key: extendsion1', '9903b3f8eeda52bb84fd11e1dba16433', '2023-06-30 08:30:02', '2023-07-03 03:57:30', 'nacos', '0:0:0:0:0:0:0:1', '', '0298b122-a60d-47f5-9be3-9ea149f17185', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (23, 'mysql-config', 'DEFAULT_GROUP', 'test-key: mysql', '84f28d4460bc32f901e57556356ec60c', '2023-07-03 03:07:31', '2023-07-03 03:49:53', 'nacos', '0:0:0:0:0:0:0:1', '', '0298b122-a60d-47f5-9be3-9ea149f17185', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (24, 'redis-config', 'DEFAULT_GROUP', 'test-key: redis', 'c73e18dba860501d7e42008453711c06', '2023-07-03 03:07:40', '2023-07-03 03:57:16', 'nacos', '0:0:0:0:0:0:0:1', '', '0298b122-a60d-47f5-9be3-9ea149f17185', '', '', '', 'yaml', '', '');

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id`, `group_id`, `tenant_id`, `datum_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '增加租户字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_beta' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id`, `group_id`, `tenant_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_tag' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id`, `tag_name`, `tag_type`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_tag_relation' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create`) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified`) USING BTREE,
  INDEX `idx_did`(`data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 142 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '多租户改造' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (4, 99, 'extension-config-0', 'DEFAULT_GROUP', '', 'test-key: extendsion0', '9d2ad2c4ec812cfe597bc04463c84b2c', '2023-07-03 16:12:25', '2023-07-03 08:12:26', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (4, 100, 'extension-config-0', 'DEFAULT_GROUP', '', 'test-key: extendsion0', '9d2ad2c4ec812cfe597bc04463c84b2c', '2023-07-03 16:13:04', '2023-07-03 08:13:05', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (4, 101, 'extension-config-0', 'DEFAULT_GROUP', '', 'test-key: extendsion0', '9d2ad2c4ec812cfe597bc04463c84b2c', '2023-07-03 16:13:06', '2023-07-03 08:13:07', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (3, 102, 'nacos-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6300\n\nlogging:\n  level:\n    root: info\n\nspring:\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: nacos-service\n\ntest-key: nacos-service-test-key', 'f1ebaf4b2fe1f6b3401ac8b5a4ae8567', '2023-07-03 16:15:59', '2023-07-03 08:16:00', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (3, 103, 'nacos-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6300\n\nlogging:\n  level:\n    root: info\n\nspring:\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: nacos-service\n\n# test-key: nacos-service-test-key', 'f88c730ad702ec71022be50b161c7907', '2023-07-03 16:22:09', '2023-07-03 08:22:09', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (3, 104, 'nacos-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6300\n\nlogging:\n  level:\n    root: info\n\nspring:\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: nacos-service\n\ntest-key: nacos-service-test-key', 'f1ebaf4b2fe1f6b3401ac8b5a4ae8567', '2023-07-03 16:22:46', '2023-07-03 08:22:47', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (3, 105, 'nacos-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6300\n\nlogging:\n  level:\n    root: info\n\nspring:\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: nacos-service\n\n# test-key: nacos-service-test-key', 'f88c730ad702ec71022be50b161c7907', '2023-07-03 16:24:05', '2023-07-03 08:24:06', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (3, 106, 'nacos-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6300\n\nlogging:\n  level:\n    root: info\n\nspring:\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: nacos-service\n\ntest-key: nacos-service-test-key', 'f1ebaf4b2fe1f6b3401ac8b5a4ae8567', '2023-07-03 16:24:55', '2023-07-03 08:24:55', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (3, 107, 'nacos-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6300\n\nlogging:\n  level:\n    root: info\n\nspring:\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: nacos-service\n\n# test-key: nacos-service-test-key', 'f88c730ad702ec71022be50b161c7907', '2023-07-03 16:27:57', '2023-07-03 08:27:57', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (3, 108, 'nacos-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6300\n\nlogging:\n  level:\n    root: info\n\nspring:\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: nacos-service\n\ntest-key: nacos-service-test-key', 'f1ebaf4b2fe1f6b3401ac8b5a4ae8567', '2023-07-03 16:29:38', '2023-07-03 08:29:39', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (3, 109, 'nacos-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6300\n\nlogging:\n  level:\n    root: info\n\nspring:\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: nacos-service\n\n# test-key: nacos-service-test-key', 'f88c730ad702ec71022be50b161c7907', '2023-07-03 16:34:51', '2023-07-03 08:34:51', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (0, 110, 'load-balance-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6300\n\nlogging:\n  level:\n    root: info\n\nspring:\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: nacos-service\n\ntest-key: nacos-service-test-key', 'f1ebaf4b2fe1f6b3401ac8b5a4ae8567', '2023-07-04 14:56:26', '2023-07-04 06:56:27', NULL, '0:0:0:0:0:0:0:1', 'I', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (4, 111, 'load-balance-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6300\n\nlogging:\n  level:\n    root: info\n\nspring:\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: nacos-service\n\ntest-key: nacos-service-test-key', 'f1ebaf4b2fe1f6b3401ac8b5a4ae8567', '2023-07-04 15:00:53', '2023-07-04 07:00:53', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (1, 112, 'order-service', 'DEFAULT_GROUP', '', 'server:\r\n  port: 6200\r\n\r\nlogging:\r\n  level:\r\n    root: info\r\n\r\nspring:\r\n  mvc:\r\n    path-match:\r\n      matching-strategy: ANT_PATH_MATCHER\r\n  application:\r\n    name: order-service', 'a6719020ee48a4f57cb5a80853e39d32', '2023-07-04 15:59:23', '2023-07-04 07:59:23', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (2, 113, 'goods-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6100\n\nlogging:\n  level:\n    root: info\n\nspring:\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: goods-service', '9849e269e17e42d6dba2a0d136cbe52b', '2023-07-04 16:13:08', '2023-07-04 08:13:08', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (3, 114, 'nacos-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6300\n\nlogging:\n  level:\n    root: info\n\nspring:\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: nacos-service\n\ntest-key: nacos-service-test-key', 'f1ebaf4b2fe1f6b3401ac8b5a4ae8567', '2023-07-04 16:13:18', '2023-07-04 08:13:18', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (4, 115, 'load-balance-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6400\n\nlogging:\n  level:\n    root: info\n\nspring:\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: nacos-service\n\ntest-key: nacos-service-test-key', 'd3be59a8350cc8ba43151baee2cfd405', '2023-07-04 16:13:39', '2023-07-04 08:13:39', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (1, 116, 'order-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6200\n\nlogging:\n  level:\n    root: info\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: order-service', '7307c765b64ca32c9ee59348ef8c2d52', '2023-07-04 16:33:54', '2023-07-04 08:33:55', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (2, 117, 'goods-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6100\n\nlogging:\n  level:\n    root: info\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: goods-service', '925d96de09932fb30832547f5f645e5a', '2023-07-04 16:34:12', '2023-07-04 08:34:12', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (3, 118, 'nacos-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6300\n\nlogging:\n  level:\n    root: info\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: nacos-service\n\ntest-key: nacos-service-test-key', 'cb9ed0dde0069a40a666a75cd47cb9d1', '2023-07-04 16:34:26', '2023-07-04 08:34:26', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (4, 119, 'load-balance-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6400\n\nlogging:\n  level:\n    root: info\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: nacos-service\n\ntest-key: nacos-service-test-key', 'a4bfc1a960d8d0984ed89363a38803a6', '2023-07-04 16:34:36', '2023-07-04 08:34:37', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (1, 120, 'order-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6200\n\nlogging:\n  level:\n    root: info\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  main:\n    allow-bean-definition-overriding: true\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: order-service', '21a3b5f6af84fa239040275b13648a7b', '2023-07-04 16:35:59', '2023-07-04 08:35:59', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (2, 121, 'goods-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6100\n\nlogging:\n  level:\n    root: info\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  main:\n    allow-bean-definition-overriding: true\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: goods-service', 'd56b983fc38433550e3b9bdb6cefed5d', '2023-07-04 16:36:09', '2023-07-04 08:36:09', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (3, 122, 'nacos-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6300\n\nlogging:\n  level:\n    root: info\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  main:\n    allow-bean-definition-overriding: true\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: nacos-service\n\ntest-key: nacos-service-test-key', '1b83c2c63d82d3b5c356341fcf8856bc', '2023-07-04 16:36:20', '2023-07-04 08:36:21', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (4, 123, 'load-balance-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6400\n\nlogging:\n  level:\n    root: info\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  main:\n    allow-bean-definition-overriding: true\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: nacos-service\n\ntest-key: nacos-service-test-key', '39888dc788528194f4916694a0d43e91', '2023-07-04 16:36:30', '2023-07-04 08:36:31', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (0, 124, 'openfeign-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6400\n\nlogging:\n  level:\n    root: info\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: nacos-service\n\ntest-key: nacos-service-test-key', 'a4bfc1a960d8d0984ed89363a38803a6', '2023-07-05 17:08:09', '2023-07-05 09:08:10', NULL, '0:0:0:0:0:0:0:1', 'I', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (5, 125, 'openfeign-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6400\n\nlogging:\n  level:\n    root: info\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: nacos-service\n\ntest-key: nacos-service-test-key', 'a4bfc1a960d8d0984ed89363a38803a6', '2023-07-05 17:09:43', '2023-07-05 09:09:43', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (4, 126, 'load-balance-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6400\n\nlogging:\n  level:\n    root: info\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: nacos-service\n\ntest-key: nacos-service-test-key', 'a4bfc1a960d8d0984ed89363a38803a6', '2023-07-05 17:10:33', '2023-07-05 09:10:33', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (5, 127, 'openfeign-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6500\n\nlogging:\n  level:\n    root: info\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: nacos-openfeign-service', '9dce836b21875415f526e19113c8b67b', '2023-07-06 16:24:04', '2023-07-06 08:24:04', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (5, 128, 'openfeign-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6500\n\nlogging:\n  level:\n    root: debug\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: nacos-openfeign-service', 'f50685a01b19ecceada76de31b71feda', '2023-07-06 16:31:04', '2023-07-06 08:31:04', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (5, 129, 'openfeign-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6500\n\nlogging:\n  level:\n    priv.cqq.openfeign.feign.*: debug\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: nacos-openfeign-service', 'a4e5184c950cace8c506da27fa3b4e92', '2023-07-06 16:48:41', '2023-07-06 08:48:41', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (5, 130, 'openfeign-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6500\n\nlogging:\n  level:\n    priv.cqq.openfeign.feign.*: debug\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: nacos-openfeign-service\n\nfeign:\n  client:\n    nacos-openfeign-service:\n      loggerLevel: BASIC', '76e3dd64de570334ce118f8622c31af4', '2023-07-06 16:50:10', '2023-07-06 08:50:10', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (5, 131, 'openfeign-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6500\n\nlogging:\n  level:\n    priv.cqq.openfeign.feign.*: debug\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: nacos-openfeign-service\n\nfeign:\n  client:\n    nacos-openfeign-service:\n      loggerLevel: FULL', '9e6366b3dc32223272f6ae526d290635', '2023-07-06 16:51:27', '2023-07-06 08:51:27', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (0, 132, 'sentinel-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6200\n\nlogging:\n  level:\n    root: info\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: order-service', '7307c765b64ca32c9ee59348ef8c2d52', '2023-07-10 11:15:15', '2023-07-10 03:15:15', NULL, '0:0:0:0:0:0:0:1', 'I', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (6, 133, 'sentinel-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6200\n\nlogging:\n  level:\n    root: info\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: order-service', '7307c765b64ca32c9ee59348ef8c2d52', '2023-07-10 11:17:53', '2023-07-10 03:17:53', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (4, 134, 'load-balance-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6400\n\nlogging:\n  level:\n    root: info\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: nacos-load-balance-service', '36d9ad27ec7f9803b39352f850df130e', '2023-07-10 15:21:04', '2023-07-10 07:21:05', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (5, 135, 'openfeign-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6500\n\nlogging:\n  level:\n    priv.cqq.openfeign.feign.*: debug\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: nacos-openfeign-service', 'a4e5184c950cace8c506da27fa3b4e92', '2023-07-10 15:21:14', '2023-07-10 07:21:15', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (6, 136, 'sentinel-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6600\n\nlogging:\n  level:\n    root: info\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: order-service', '53cd19da956d97c091bfc423738ac64d', '2023-07-10 15:22:54', '2023-07-10 07:22:54', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (6, 137, 'sentinel-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6600\n\nlogging:\n  level:\n    root: info\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n    sentinel:\n      transport:\n        dashboard: 127.0.0.1:8400\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: sentinel-service', '0230bf9a646713854b8ca9db543961ae', '2023-07-10 15:23:24', '2023-07-10 07:23:25', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (6, 138, 'sentinel-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6600\n\nlogging:\n  level:\n    root: info\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n    sentinel:\n      transport:\n        dashboard: 127.0.0.1\n        port: 8400\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: sentinel-service', '1b8bbe5cf2a0cfff5f6d7768b97545a7', '2023-07-10 15:24:05', '2023-07-10 07:24:05', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (6, 139, 'sentinel-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6600\n\nlogging:\n  level:\n    root: info\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: sentinel-service', '84fa1142ec808271e680fbac21605406', '2023-07-10 16:33:39', '2023-07-10 08:33:40', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (6, 140, 'sentinel-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6600\n\nlogging:\n  level:\n    root: info\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n    transport:\n      # 控制台的地址\n      dashboard: 127.0.0.1:8400\n      # 与控制台通讯的端口，默认是8719，不可用会一直+1，只至找到一个可用的\n      port: 6601\n      # 和控制台保持心跳的ip地址\n      client-ip: 127.0.0.1\n      # 发送心跳的周期，默认是10s\n      heartbeat-interval-ms: 3000\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: sentinel-service', '05f60ca2c2631d29b52ac7ecc539b67d', '2023-07-10 16:34:46', '2023-07-10 08:34:46', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (6, 141, 'sentinel-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6600\n\nlogging:\n  level:\n    root: info\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n    \n    sentinel:\n      transport:\n        # 控制台的地址\n        dashboard: 127.0.0.1:8400\n        # 与控制台通讯的端口，默认是8719，不可用会一直+1，只至找到一个可用的\n        port: 6601\n        # 和控制台保持心跳的ip地址\n        client-ip: 127.0.0.1\n        # 发送心跳的周期，默认是10s\n        heartbeat-interval-ms: 3000\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: sentinel-service', '14183b16812000bafb513cddf099582b', '2023-07-10 16:36:07', '2023-07-10 08:36:08', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `resource` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE INDEX `uk_role_permission`(`role`, `resource`, `action`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('ROLE_PROD', '8c346cfe-9333-448d-b72d-c957d9cc1a80:*:*', 'rw');
INSERT INTO `permissions` VALUES ('ROLE_TEST', '0298b122-a60d-47f5-9be3-9ea149f17185:*:*', 'rw');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE INDEX `idx_user_role`(`username`, `role`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');
INSERT INTO `roles` VALUES ('prod', 'ROLE_PROD');
INSERT INTO `roles` VALUES ('test', 'ROLE_TEST');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '租户容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp`, `tenant_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'tenant_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
INSERT INTO `tenant_info` VALUES (1, '1', '0298b122-a60d-47f5-9be3-9ea149f17185', 'test', '测试环境', 'nacos', 1687867984413, 1687867984413);
INSERT INTO `tenant_info` VALUES (2, '1', '8c346cfe-9333-448d-b72d-c957d9cc1a80', 'prod', '线上环境', 'nacos', 1688354031984, 1688354031984);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$e6yrFvt1CBARjo8sCP26bOhU29WGHZ1Fo9IksnDlNSyTkjyWbq12u', 1);
INSERT INTO `users` VALUES ('prod', '$2a$10$6xTvaoX7HQ5x4ZOENJjtTeiwt3uqpkoRMJq4Ryi/J8Yz/ywx8o.LO', 1);
INSERT INTO `users` VALUES ('test', '$2a$10$brMbWrvcn9RPhtLZXvclnOjWgQrhWzoe4xT7HVXgeslCCLN/T4Mlu', 1);

SET FOREIGN_KEY_CHECKS = 1;
