/*
 Navicat Premium Data Transfer

 Source Server         : local_mysql
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : nacos

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 24/09/2023 19:48:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `c_use` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `effect` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `c_schema` text COLLATE utf8_bin,
  `encrypted_data_key` text COLLATE utf8_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='config_info';

-- ----------------------------
-- Records of config_info
-- ----------------------------
BEGIN;
INSERT INTO `config_info` VALUES (1, 'order-service', 'DEFAULT_GROUP', 'server:\n  port: 6200\n\nlogging:\n  level:\n    root: info\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: order-service\n  datasource:\n    driver-class-name: com.mysql.jdbc.Driver\n    url: jdbc:mysql:///seata_tbl?useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&useSSL=false\n    username: root\n    password: root\n  \nmybatis-plus:\n  global-config:\n    db-config:\n      insert-strategy: not_null\n      update-strategy: not_null\n      id-type: auto', '816fd835060912f1ad045935c772e66b', '2023-06-30 07:58:19', '2023-08-23 09:22:20', 'nacos', '0:0:0:0:0:0:0:1', '', '0298b122-a60d-47f5-9be3-9ea149f17185', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (2, 'goods-service', 'DEFAULT_GROUP', 'server:\n  port: 6100\n\nlogging:\n  level:\n    root: info\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: goods-service\n  datasource:\n    driver-class-name: com.mysql.jdbc.Driver\n    url: jdbc:mysql:///seata_tbl?useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&useSSL=false\n    username: root\n    password: root\n  \nmybatis-plus:\n  global-config:\n    db-config:\n      insert-strategy: not_null\n      update-strategy: not_null\n      id-type: auto', '0652f4ae80d87dcfd70896f55679c17c', '2023-06-30 07:59:09', '2023-08-23 09:22:44', 'nacos', '0:0:0:0:0:0:0:1', '', '0298b122-a60d-47f5-9be3-9ea149f17185', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (3, 'nacos-service', 'DEFAULT_GROUP', 'server:\n  port: 6300\n\nlogging:\n  level:\n    root: info\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: nacos-service\n\ntest-key: nacos-service-test-key', 'cb9ed0dde0069a40a666a75cd47cb9d1', '2023-07-03 01:53:46', '2023-07-04 08:36:21', 'nacos', '0:0:0:0:0:0:0:1', '', '0298b122-a60d-47f5-9be3-9ea149f17185', NULL, NULL, NULL, 'text', NULL, '');
INSERT INTO `config_info` VALUES (4, 'load-balance-service', 'DEFAULT_GROUP', 'server:\n  port: 6400\n\nlogging:\n  level:\n    root: info\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: load-balance-service', 'c6474b927ed56467faa9f05213b8b49c', '2023-07-04 06:56:27', '2023-07-10 07:21:05', 'nacos', '0:0:0:0:0:0:0:1', '', '0298b122-a60d-47f5-9be3-9ea149f17185', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (5, 'openfeign-service', 'DEFAULT_GROUP', 'server:\n  port: 6500\n\nlogging:\n  level:\n    priv.cqq.openfeign.feign.*: debug\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: openfeign-service', '75bcf39ef4ae8464d46d58aed249997c', '2023-07-05 09:08:10', '2023-07-10 07:21:15', 'nacos', '0:0:0:0:0:0:0:1', '', '0298b122-a60d-47f5-9be3-9ea149f17185', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (6, 'sentinel-service', 'DEFAULT_GROUP', 'server:\n  port: 6600\n\nlogging:\n  level:\n    root: info\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n    \n    # sentinel:\n    #   transport:\n    #     # 控制台的地址\n    #     dashboard: 127.0.0.1:8400\n    #     # 与控制台通讯的端口，默认是8719，不可用会一直+1，只至找到一个可用的\n    #     port: 6601\n    #     # 和控制台保持心跳的ip地址\n    #     client-ip: 127.0.0.1\n    #     # 发送心跳的周期，默认是10s\n    #     heartbeat-interval-ms: 3000\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: sentinel-service', '459d0ef6ec70b264930ead70cae8a88d', '2023-07-10 03:15:15', '2023-07-10 08:36:08', 'nacos', '0:0:0:0:0:0:0:1', '', '0298b122-a60d-47f5-9be3-9ea149f17185', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (10, 'extension-config-0', 'DEFAULT_GROUP', 'test-key: extendsion0', '9d2ad2c4ec812cfe597bc04463c84b2c', '2023-07-03 02:56:45', '2023-07-03 08:13:07', 'nacos', '0:0:0:0:0:0:0:1', '', '0298b122-a60d-47f5-9be3-9ea149f17185', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (11, 'extension-config-1', 'DEFAULT_GROUP', 'test-key: extendsion1', '9903b3f8eeda52bb84fd11e1dba16433', '2023-06-30 08:30:02', '2023-07-03 03:57:30', 'nacos', '0:0:0:0:0:0:0:1', '', '0298b122-a60d-47f5-9be3-9ea149f17185', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (23, 'mysql-config', 'DEFAULT_GROUP', 'test-key: mysql', '84f28d4460bc32f901e57556356ec60c', '2023-07-03 03:07:31', '2023-07-03 03:49:53', 'nacos', '0:0:0:0:0:0:0:1', '', '0298b122-a60d-47f5-9be3-9ea149f17185', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (24, 'redis-config', 'DEFAULT_GROUP', 'test-key: redis', 'c73e18dba860501d7e42008453711c06', '2023-07-03 03:07:40', '2023-07-03 03:57:16', 'nacos', '0:0:0:0:0:0:0:1', '', '0298b122-a60d-47f5-9be3-9ea149f17185', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (30, 'gateway-service', 'DEFAULT_GROUP', 'server:\n  port: 5000\n\nlogging:\n  level:\n    root: info\n\nspring:\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: gateway-service\n  cloud:\n    # 关闭默认的负载均衡，切换 LocalRoundRobbinLoadBalancer\n    loadbalancer:\n      ribbon:\n        enabled: false\n\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n    \n    # 网关配置\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n      routes:\n        - id: order_route                    # 路由的唯一标识\n          uri: lb://nacos-order-service      # lb: load-balance 启用负载均衡，并根据服务名称自动转发\n          # uri: http://nacos-order-service      # lb: load-balance 启用负载均衡，并根据服务名称自动转发\n          predicates:                        # 断言规则，用于路由匹配\n            - Path=/route-order-service/**\n            - MyPredicate=key1,key2\n          filters:\n            - StripPrefix=1                  # 剔除 url 中的第一层路径: /order-service/\n            # - AddRequestHeader=my-header,mh\n            - MyFilter=my-header,mh\n      globalcors:           # 全局的跨域处理\n        add-to-simple-url-handler-mapping: true # 解决 options 请求被拦截问题\n        corsConfigurations:\n          \'[/**]\':\n            allowedOrigins: # 允许哪些网站的可以跨域请求, \'*\' 表示所有 \n              - \"*\"\n              # - \"https://localhost:8001\"\n              # - \"https://localhost:8002\"\n              # - \"https://localhost:8003\"\n            allowedMethods: # 允许的跨域的请求方式, \'*\' 表示所有\n              - \"GET\"\n              - \"POST\"\n              - \"DELETE\"\n              - \"PUT\"\n              - \"OPTIONS\"\n            allowedHeaders: \"*\"    # 允许在请求中携带的请求头, \'*\' 表示所有\n            allowCredentials: true # 是否允许携带 cookie\n            maxAge: 360000         # 跨域检测的有效期\n\n# 测试环境服务地址\ntest:\n  server:\n    ips: 124.70.69.96', '42824392fc7236654a4bda170b24674b', '2023-07-25 01:04:54', '2023-08-07 06:07:05', 'nacos', '0:0:0:0:0:0:0:1', '', '0298b122-a60d-47f5-9be3-9ea149f17185', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (59, 'gateway-service', 'DEFAULT_GROUP', 'server:\n  port: 5000\n\nlogging:\n  level:\n    root: info\n\nspring:\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: gateway-service\n  cloud:\n    # 关闭默认的负载均衡，切换 LocalRoundRobbinLoadBalancer\n    loadbalancer:\n      ribbon:\n        enabled: false\n\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n    \n    # 网关配置\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n      routes:\n        - id: order_route                    # 路由的唯一标识\n          uri: lb://nacos-order-service      # lb: load-balance 启用负载均衡，并根据服务名称自动转发\n          # uri: http://nacos-order-service      # lb: load-balance 启用负载均衡，并根据服务名称自动转发\n          predicates:                        # 断言规则，用于路由匹配\n            - Path=/route-order-service/**\n            - MyPredicate=key1,key2\n          filters:\n            - StripPrefix=1                  # 剔除 url 中的第一层路径: /order-service/\n            # - AddRequestHeader=my-header,mh\n            - MyFilter=my-header,mh\n      globalcors:           # 全局的跨域处理\n        add-to-simple-url-handler-mapping: true # 解决 options 请求被拦截问题\n        corsConfigurations:\n          \'[/**]\':\n            allowedOrigins: # 允许哪些网站的可以跨域请求, \'*\' 表示所有 \n              - \"*\"\n              # - \"https://localhost:8001\"\n              # - \"https://localhost:8002\"\n              # - \"https://localhost:8003\"\n            allowedMethods: # 允许的跨域的请求方式, \'*\' 表示所有\n              - \"GET\"\n              - \"POST\"\n              - \"DELETE\"\n              - \"PUT\"\n              - \"OPTIONS\"\n            allowedHeaders: \"*\"    # 允许在请求中携带的请求头, \'*\' 表示所有\n            allowCredentials: true # 是否允许携带 cookie\n            maxAge: 360000         # 跨域检测的有效期\n            \n# 测试环境服务地址\ntest:\n  server:\n    ips: 124.70.69.96', '7cd9878fc3705e090cb5e49725717ae7', '2023-08-07 05:35:00', '2023-08-07 06:28:06', 'nacos', '0:0:0:0:0:0:0:1', '', 'c8cc59da-dea3-44ef-9ff7-055879477406', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (60, 'skywalking-order-service', 'DEFAULT_GROUP', 'server:\n  port: 6700\n\nlogging:\n  level:\n    priv.cqq.openfeign.feign.*: debug\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: skywalking-order-service', '23569be58644c8bb06bb3d391bbcf64c', '2023-09-24 10:05:25', '2023-09-24 10:05:45', 'nacos', '0:0:0:0:0:0:0:1', '', '0298b122-a60d-47f5-9be3-9ea149f17185', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (61, 'skywalking-goods-service', 'DEFAULT_GROUP', 'server:\n  port: 6800\n\nlogging:\n  level:\n    priv.cqq.openfeign.feign.*: debug\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: skywalking-goods-service', 'a520e1040a67520f5fd5fcfe51fda014', '2023-09-24 10:08:46', '2023-09-24 10:09:15', 'nacos', '0:0:0:0:0:0:0:1', '', '0298b122-a60d-47f5-9be3-9ea149f17185', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (63, 'seata-tc-server', 'DEFAULT_GROUP', 'seata:\n  store:\n    mode: db\n    file:\n      dir: sessionStore\n      max-branch-session-size: 16384\n      max-global-session-size: 512\n      file-write-buffer-cache-size: 16384\n      session-reload-read-size: 100\n      flush-disk-mode: async\n    db:\n      datasource: druid\n      db-type: mysql\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      url: jdbc:mysql://127.0.0.1:3306/seata?rewriteBatchedStatements=true&useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n      user: root\n      password: root\n      min-conn: 10\n      max-conn: 100\n      global-table: global_table\n      branch-table: branch_table\n      lock-table: lock_table\n      distributed-lock-table: distributed_lock\n      query-limit: 1000\n      max-wait: 5000', 'a3766a78dbcc93415787717c831ce226', '2023-08-23 07:42:38', '2023-08-30 05:29:34', 'nacos', '0:0:0:0:0:0:0:1', '', '0298b122-a60d-47f5-9be3-9ea149f17185', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (66, 'seata-tc-server', 'DEFAULT_GROUP', 'seata:\n  store:\n    mode: db\n    file:\n      dir: sessionStore\n      max-branch-session-size: 16384\n      max-global-session-size: 512\n      file-write-buffer-cache-size: 16384\n      session-reload-read-size: 100\n      flush-disk-mode: async\n    db:\n      datasource: druid\n      db-type: mysql\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      url: jdbc:mysql://127.0.0.1:3306/seata?rewriteBatchedStatements=true&useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n      user: root\n      password: root\n      min-conn: 10\n      max-conn: 100\n      global-table: global_table\n      branch-table: branch_table\n      lock-table: lock_table\n      distributed-lock-table: distributed_lock\n      query-limit: 1000\n      max-wait: 5000', 'a3766a78dbcc93415787717c831ce226', '2023-08-30 05:24:33', '2023-08-30 05:24:44', 'nacos', '0:0:0:0:0:0:0:1', '', '510d8d6d-5898-4b70-b28a-2893c8145b11', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (78, 'service.vgroupMapping.seata-tx-test-group', 'DEFAULT_GROUP', 'SH', 'ec5704f0d56945d1e5b8f9a2384a2b4b', '2023-08-30 06:33:09', '2023-09-02 14:58:28', 'nacos', '0:0:0:0:0:0:0:1', '', '510d8d6d-5898-4b70-b28a-2893c8145b11', '', '', '', 'yaml', '', '');
COMMIT;

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='增加租户字段';

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text COLLATE utf8_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='config_info_beta';

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='config_info_tag';

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`) USING BTREE,
  KEY `idx_tenant_id` (`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='config_tag_relation';

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_group_id` (`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='集群、各Group容量信息表';

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info` (
  `id` bigint(20) unsigned NOT NULL,
  `nid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text COLLATE utf8_bin,
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `op_type` char(10) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text COLLATE utf8_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`nid`) USING BTREE,
  KEY `idx_gmt_create` (`gmt_create`) USING BTREE,
  KEY `idx_gmt_modified` (`gmt_modified`) USING BTREE,
  KEY `idx_did` (`data_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='多租户改造';

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
BEGIN;
INSERT INTO `his_config_info` VALUES (0, 192, 'seata-tc-server-common', 'DEFAULT_GROUP', '', '# server:\n#   port: 8600\n\n# spring:\n#   application:\n#     name: seata-server\n\n# logging:\n#   config: classpath:logback-spring.xml\n#   file:\n#     path: ${user.home}/logs/seata\n#   extend:\n#     logstash-appender:\n#       destination: 127.0.0.1:4560\n#     kafka-appender:\n#       bootstrap-servers: 127.0.0.1:9092\n#       topic: logback_to_logstash\n\n# console:\n#   user:\n#     username: seata\n#     password: seata\n\nseata:\n  store:\n    # support: file 、 db 、 redis\n    mode: db\n    #    session:\n    #      mode: file\n    #    lock:\n    #      mode: file\n    file:\n      dir: sessionStore\n      max-branch-session-size: 16384\n      max-global-session-size: 512\n      file-write-buffer-cache-size: 16384\n      session-reload-read-size: 100\n      flush-disk-mode: async\n    db:\n      datasource: druid\n      db-type: mysql\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      url: jdbc:mysql://127.0.0.1:3306/seata?rewriteBatchedStatements=true&useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n      user: root\n      password: root\n      min-conn: 10\n      max-conn: 100\n      global-table: global_table\n      branch-table: branch_table\n      lock-table: lock_table\n      distributed-lock-table: distributed_lock\n      query-limit: 1000\n      max-wait: 5000', '90f34cec978a33ad7e3e5df3f3daaed9', '2023-08-30 13:21:07', '2023-08-30 05:21:07', NULL, '0:0:0:0:0:0:0:1', 'I', '510d8d6d-5898-4b70-b28a-2893c8145b11', '');
INSERT INTO `his_config_info` VALUES (64, 193, 'seata-tc-server-common', 'DEFAULT_GROUP', '', '# server:\n#   port: 8600\n\n# spring:\n#   application:\n#     name: seata-server\n\n# logging:\n#   config: classpath:logback-spring.xml\n#   file:\n#     path: ${user.home}/logs/seata\n#   extend:\n#     logstash-appender:\n#       destination: 127.0.0.1:4560\n#     kafka-appender:\n#       bootstrap-servers: 127.0.0.1:9092\n#       topic: logback_to_logstash\n\n# console:\n#   user:\n#     username: seata\n#     password: seata\n\nseata:\n  store:\n    # support: file 、 db 、 redis\n    mode: db\n    #    session:\n    #      mode: file\n    #    lock:\n    #      mode: file\n    file:\n      dir: sessionStore\n      max-branch-session-size: 16384\n      max-global-session-size: 512\n      file-write-buffer-cache-size: 16384\n      session-reload-read-size: 100\n      flush-disk-mode: async\n    db:\n      datasource: druid\n      db-type: mysql\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      url: jdbc:mysql://127.0.0.1:3306/seata?rewriteBatchedStatements=true&useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n      user: root\n      password: root\n      min-conn: 10\n      max-conn: 100\n      global-table: global_table\n      branch-table: branch_table\n      lock-table: lock_table\n      distributed-lock-table: distributed_lock\n      query-limit: 1000\n      max-wait: 5000', '90f34cec978a33ad7e3e5df3f3daaed9', '2023-08-30 13:22:00', '2023-08-30 05:22:00', 'nacos', '0:0:0:0:0:0:0:1', 'U', '510d8d6d-5898-4b70-b28a-2893c8145b11', '');
INSERT INTO `his_config_info` VALUES (64, 194, 'seata-tc-server-common', 'DEFAULT_GROUP', '', 'seata:\n  store:\n    mode: db\n    file:\n      dir: sessionStore\n      max-branch-session-size: 16384\n      max-global-session-size: 512\n      file-write-buffer-cache-size: 16384\n      session-reload-read-size: 100\n      flush-disk-mode: async\n    db:\n      datasource: druid\n      db-type: mysql\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      url: jdbc:mysql://127.0.0.1:3306/seata?rewriteBatchedStatements=true&useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n      user: root\n      password: root\n      min-conn: 10\n      max-conn: 100\n      global-table: global_table\n      branch-table: branch_table\n      lock-table: lock_table\n      distributed-lock-table: distributed_lock\n      query-limit: 1000\n      max-wait: 5000', 'a3766a78dbcc93415787717c831ce226', '2023-08-30 13:24:15', '2023-08-30 05:24:16', 'nacos', '0:0:0:0:0:0:0:1', 'D', '510d8d6d-5898-4b70-b28a-2893c8145b11', '');
INSERT INTO `his_config_info` VALUES (0, 195, 'seata-tc-server', 'DEFAULT_GROUP', '', '# server:\n#   port: 8600\n\n# spring:\n#   application:\n#     name: seata-server\n\n# logging:\n#   config: classpath:logback-spring.xml\n#   file:\n#     path: ${user.home}/logs/seata\n#   extend:\n#     logstash-appender:\n#       destination: 127.0.0.1:4560\n#     kafka-appender:\n#       bootstrap-servers: 127.0.0.1:9092\n#       topic: logback_to_logstash\n\n# console:\n#   user:\n#     username: seata\n#     password: seata\n\nseata:\n  store:\n    # support: file 、 db 、 redis\n    mode: db\n    #    session:\n    #      mode: file\n    #    lock:\n    #      mode: file\n    file:\n      dir: sessionStore\n      max-branch-session-size: 16384\n      max-global-session-size: 512\n      file-write-buffer-cache-size: 16384\n      session-reload-read-size: 100\n      flush-disk-mode: async\n    db:\n      datasource: druid\n      db-type: mysql\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      url: jdbc:mysql://127.0.0.1:3306/seata?rewriteBatchedStatements=true&useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n      user: root\n      password: root\n      min-conn: 10\n      max-conn: 100\n      global-table: global_table\n      branch-table: branch_table\n      lock-table: lock_table\n      distributed-lock-table: distributed_lock\n      query-limit: 1000\n      max-wait: 5000', '90f34cec978a33ad7e3e5df3f3daaed9', '2023-08-30 13:24:32', '2023-08-30 05:24:33', NULL, '0:0:0:0:0:0:0:1', 'I', '510d8d6d-5898-4b70-b28a-2893c8145b11', '');
INSERT INTO `his_config_info` VALUES (66, 196, 'seata-tc-server', 'DEFAULT_GROUP', '', '# server:\n#   port: 8600\n\n# spring:\n#   application:\n#     name: seata-server\n\n# logging:\n#   config: classpath:logback-spring.xml\n#   file:\n#     path: ${user.home}/logs/seata\n#   extend:\n#     logstash-appender:\n#       destination: 127.0.0.1:4560\n#     kafka-appender:\n#       bootstrap-servers: 127.0.0.1:9092\n#       topic: logback_to_logstash\n\n# console:\n#   user:\n#     username: seata\n#     password: seata\n\nseata:\n  store:\n    # support: file 、 db 、 redis\n    mode: db\n    #    session:\n    #      mode: file\n    #    lock:\n    #      mode: file\n    file:\n      dir: sessionStore\n      max-branch-session-size: 16384\n      max-global-session-size: 512\n      file-write-buffer-cache-size: 16384\n      session-reload-read-size: 100\n      flush-disk-mode: async\n    db:\n      datasource: druid\n      db-type: mysql\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      url: jdbc:mysql://127.0.0.1:3306/seata?rewriteBatchedStatements=true&useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n      user: root\n      password: root\n      min-conn: 10\n      max-conn: 100\n      global-table: global_table\n      branch-table: branch_table\n      lock-table: lock_table\n      distributed-lock-table: distributed_lock\n      query-limit: 1000\n      max-wait: 5000', '90f34cec978a33ad7e3e5df3f3daaed9', '2023-08-30 13:24:44', '2023-08-30 05:24:44', 'nacos', '0:0:0:0:0:0:0:1', 'U', '510d8d6d-5898-4b70-b28a-2893c8145b11', '');
INSERT INTO `his_config_info` VALUES (63, 197, 'seata-tc-server', 'DEFAULT_GROUP', '', '# server:\n#   port: 8600\n\n# spring:\n#   application:\n#     name: seata-server\n\n# logging:\n#   config: classpath:logback-spring.xml\n#   file:\n#     path: ${user.home}/logs/seata\n#   extend:\n#     logstash-appender:\n#       destination: 127.0.0.1:4560\n#     kafka-appender:\n#       bootstrap-servers: 127.0.0.1:9092\n#       topic: logback_to_logstash\n\n# console:\n#   user:\n#     username: seata\n#     password: seata\n\nseata:\n  store:\n    # support: file 、 db 、 redis\n    mode: db\n    #    session:\n    #      mode: file\n    #    lock:\n    #      mode: file\n    file:\n      dir: sessionStore\n      max-branch-session-size: 16384\n      max-global-session-size: 512\n      file-write-buffer-cache-size: 16384\n      session-reload-read-size: 100\n      flush-disk-mode: async\n    db:\n      datasource: druid\n      db-type: mysql\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      url: jdbc:mysql://127.0.0.1:3306/seata?rewriteBatchedStatements=true&useSSL=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n      user: root\n      password: root\n      min-conn: 10\n      max-conn: 100\n      global-table: global_table\n      branch-table: branch_table\n      lock-table: lock_table\n      distributed-lock-table: distributed_lock\n      query-limit: 1000\n      max-wait: 5000', '90f34cec978a33ad7e3e5df3f3daaed9', '2023-08-30 13:29:33', '2023-08-30 05:29:34', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (0, 198, 'seata-tx-group1', 'DEFAULT_GROUP', '', 'service:\r\n  vgroup-mapping:\r\n    seata-tx-test-group: SH', '59f5ec328bf299a1e7ef39a2138033bc', '2023-08-30 13:46:10', '2023-08-30 05:46:10', 'nacos', '0:0:0:0:0:0:0:1', 'I', '510d8d6d-5898-4b70-b28a-2893c8145b11', '');
INSERT INTO `his_config_info` VALUES (69, 199, 'seata-tx-group1', 'DEFAULT_GROUP', '', 'service:\r\n  vgroup-mapping:\r\n    seata-tx-test-group: SH', '59f5ec328bf299a1e7ef39a2138033bc', '2023-08-30 13:46:42', '2023-08-30 05:46:42', 'nacos', '0:0:0:0:0:0:0:1', 'D', '510d8d6d-5898-4b70-b28a-2893c8145b11', '');
INSERT INTO `his_config_info` VALUES (0, 200, 'seata-tx-test-group', 'DEFAULT_GROUP', '', 'service:\r\n  vgroup-mapping:\r\n    seata-tx-test-group: SH', '59f5ec328bf299a1e7ef39a2138033bc', '2023-08-30 13:47:07', '2023-08-30 05:47:08', 'nacos', '0:0:0:0:0:0:0:1', 'I', '510d8d6d-5898-4b70-b28a-2893c8145b11', '');
INSERT INTO `his_config_info` VALUES (70, 201, 'seata-tx-test-group', 'DEFAULT_GROUP', '', 'service:\r\n  vgroup-mapping:\r\n    seata-tx-test-group: SH', '59f5ec328bf299a1e7ef39a2138033bc', '2023-08-30 14:00:00', '2023-08-30 06:00:01', 'nacos', '0:0:0:0:0:0:0:1', 'U', '510d8d6d-5898-4b70-b28a-2893c8145b11', '');
INSERT INTO `his_config_info` VALUES (70, 202, 'seata-tx-test-group', 'DEFAULT_GROUP', '', 'seata:\n  service:\n    vgroup-mapping:\n      seata-tx-test-group: SH', '545c74861192ffd8a17c9474494fb4e5', '2023-08-30 14:04:12', '2023-08-30 06:04:13', 'nacos', '0:0:0:0:0:0:0:1', 'U', '510d8d6d-5898-4b70-b28a-2893c8145b11', '');
INSERT INTO `his_config_info` VALUES (70, 203, 'seata-tx-test-group', 'DEFAULT_GROUP', '', 'service:\n  vgroup-mapping:\n    seata-tx-test-group: SH', '439cd24f47389dd153ac052b3efbbd0a', '2023-08-30 14:10:50', '2023-08-30 06:10:51', 'nacos', '0:0:0:0:0:0:0:1', 'U', '510d8d6d-5898-4b70-b28a-2893c8145b11', '');
INSERT INTO `his_config_info` VALUES (70, 204, 'seata-tx-test-group', 'DEFAULT_GROUP', '', 'service:\n  vgroupMapping:\n    seata-tx-test-group: SH', '0f4de932fa5f74f527c7d2e72311ec4e', '2023-08-30 14:11:57', '2023-08-30 06:11:57', 'nacos', '0:0:0:0:0:0:0:1', 'U', '510d8d6d-5898-4b70-b28a-2893c8145b11', '');
INSERT INTO `his_config_info` VALUES (70, 205, 'seata-tx-test-group', 'DEFAULT_GROUP', '', 'service:\n  vgroup-mapping:\n    seata-tx-test-group: SH', '439cd24f47389dd153ac052b3efbbd0a', '2023-08-30 14:17:39', '2023-08-30 06:17:40', 'nacos', '0:0:0:0:0:0:0:1', 'D', '510d8d6d-5898-4b70-b28a-2893c8145b11', '');
INSERT INTO `his_config_info` VALUES (0, 206, 'seata-tx-group', 'DEFAULT_GROUP', '', 'service:\r\n  vgroup-mapping:\r\n    seata-tx-test-group: SH', '59f5ec328bf299a1e7ef39a2138033bc', '2023-08-30 14:18:10', '2023-08-30 06:18:11', 'nacos', '0:0:0:0:0:0:0:1', 'I', '510d8d6d-5898-4b70-b28a-2893c8145b11', '');
INSERT INTO `his_config_info` VALUES (75, 207, 'seata-tx-group', 'DEFAULT_GROUP', '', 'service:\r\n  vgroup-mapping:\r\n    seata-tx-test-group: SH', '59f5ec328bf299a1e7ef39a2138033bc', '2023-08-30 14:26:46', '2023-08-30 06:26:46', 'nacos', '0:0:0:0:0:0:0:1', 'D', '510d8d6d-5898-4b70-b28a-2893c8145b11', '');
INSERT INTO `his_config_info` VALUES (0, 208, 'service.vgroupMapping.seata-tx-test-group', 'DEFAULT_GROUP', '', 'SH', 'ec5704f0d56945d1e5b8f9a2384a2b4b', '2023-08-30 14:27:04', '2023-08-30 06:27:04', 'nacos', '0:0:0:0:0:0:0:1', 'I', '510d8d6d-5898-4b70-b28a-2893c8145b11', '');
INSERT INTO `his_config_info` VALUES (76, 209, 'service.vgroupMapping.seata-tx-test-group', 'DEFAULT_GROUP', '', 'SH', 'ec5704f0d56945d1e5b8f9a2384a2b4b', '2023-08-30 14:32:07', '2023-08-30 06:32:08', 'nacos', '0:0:0:0:0:0:0:1', 'D', '510d8d6d-5898-4b70-b28a-2893c8145b11', '');
INSERT INTO `his_config_info` VALUES (0, 210, 'service.vgroupMapping.seata-tx-group', 'DEFAULT_GROUP', '', 'SH', 'ec5704f0d56945d1e5b8f9a2384a2b4b', '2023-08-30 14:32:18', '2023-08-30 06:32:18', 'nacos', '0:0:0:0:0:0:0:1', 'I', '510d8d6d-5898-4b70-b28a-2893c8145b11', '');
INSERT INTO `his_config_info` VALUES (77, 211, 'service.vgroupMapping.seata-tx-group', 'DEFAULT_GROUP', '', 'SH', 'ec5704f0d56945d1e5b8f9a2384a2b4b', '2023-08-30 14:32:59', '2023-08-30 06:32:59', 'nacos', '0:0:0:0:0:0:0:1', 'D', '510d8d6d-5898-4b70-b28a-2893c8145b11', '');
INSERT INTO `his_config_info` VALUES (0, 212, 'service.vgroupMapping.seata-tx-test-group', 'DEFAULT_GROUP', '', 'SH', 'ec5704f0d56945d1e5b8f9a2384a2b4b', '2023-08-30 14:33:09', '2023-08-30 06:33:09', 'nacos', '0:0:0:0:0:0:0:1', 'I', '510d8d6d-5898-4b70-b28a-2893c8145b11', '');
INSERT INTO `his_config_info` VALUES (78, 213, 'service.vgroupMapping.seata-tx-test-group', 'DEFAULT_GROUP', '', 'SH', 'ec5704f0d56945d1e5b8f9a2384a2b4b', '2023-08-30 14:43:51', '2023-08-30 06:43:51', 'nacos', '0:0:0:0:0:0:0:1', 'U', '510d8d6d-5898-4b70-b28a-2893c8145b11', '');
INSERT INTO `his_config_info` VALUES (78, 214, 'service.vgroupMapping.seata-tx-test-group', 'DEFAULT_GROUP', '', 'BJ', 'ddd70bbaf5be05e1e9caded444c03095', '2023-08-30 14:45:33', '2023-08-30 06:45:33', 'nacos', '0:0:0:0:0:0:0:1', 'U', '510d8d6d-5898-4b70-b28a-2893c8145b11', '');
INSERT INTO `his_config_info` VALUES (78, 215, 'service.vgroupMapping.seata-tx-test-group', 'DEFAULT_GROUP', '', 'SH', 'ec5704f0d56945d1e5b8f9a2384a2b4b', '2023-09-02 22:58:14', '2023-09-02 14:58:14', 'nacos', '0:0:0:0:0:0:0:1', 'U', '510d8d6d-5898-4b70-b28a-2893c8145b11', '');
INSERT INTO `his_config_info` VALUES (78, 216, 'service.vgroupMapping.seata-tx-test-group', 'DEFAULT_GROUP', '', 'BJ', 'ddd70bbaf5be05e1e9caded444c03095', '2023-09-02 22:58:27', '2023-09-02 14:58:28', 'nacos', '0:0:0:0:0:0:0:1', 'U', '510d8d6d-5898-4b70-b28a-2893c8145b11', '');
INSERT INTO `his_config_info` VALUES (0, 217, 'skywalking-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6500\n\nlogging:\n  level:\n    priv.cqq.openfeign.feign.*: debug\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: openfeign-service', '75bcf39ef4ae8464d46d58aed249997c', '2023-09-23 18:48:32', '2023-09-23 10:48:32', NULL, '0:0:0:0:0:0:0:1', 'I', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (60, 218, 'skywalking-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6500\n\nlogging:\n  level:\n    priv.cqq.openfeign.feign.*: debug\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: openfeign-service', '75bcf39ef4ae8464d46d58aed249997c', '2023-09-23 18:51:08', '2023-09-23 10:51:09', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (0, 219, 'skywalking-order-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6700\n\nlogging:\n  level:\n    priv.cqq.openfeign.feign.*: debug\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: skywalking-service', '2ae34005fa15cec8455afbcff272930a', '2023-09-24 18:05:25', '2023-09-24 10:05:25', NULL, '0:0:0:0:0:0:0:1', 'I', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (60, 220, 'skywalking-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6700\n\nlogging:\n  level:\n    priv.cqq.openfeign.feign.*: debug\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: skywalking-service', '2ae34005fa15cec8455afbcff272930a', '2023-09-24 18:05:30', '2023-09-24 10:05:31', 'nacos', '0:0:0:0:0:0:0:1', 'D', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (81, 221, 'skywalking-order-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6700\n\nlogging:\n  level:\n    priv.cqq.openfeign.feign.*: debug\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: skywalking-service', '2ae34005fa15cec8455afbcff272930a', '2023-09-24 18:05:44', '2023-09-24 10:05:45', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (0, 222, 'skywalking-goods-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6700\n\nlogging:\n  level:\n    priv.cqq.openfeign.feign.*: debug\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: skywalking-order-service', '23569be58644c8bb06bb3d391bbcf64c', '2023-09-24 18:08:46', '2023-09-24 10:08:46', NULL, '0:0:0:0:0:0:0:1', 'I', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
INSERT INTO `his_config_info` VALUES (83, 223, 'skywalking-goods-service', 'DEFAULT_GROUP', '', 'server:\n  port: 6700\n\nlogging:\n  level:\n    priv.cqq.openfeign.feign.*: debug\n\nspring:\n  cloud:\n    config:\n      override-none: true\n      allow-override: true\n      override-system-properties: false\n  mvc:\n    path-match:\n      matching-strategy: ANT_PATH_MATCHER\n  application:\n    name: skywalking-order-service', '23569be58644c8bb06bb3d391bbcf64c', '2023-09-24 18:09:14', '2023-09-24 10:09:15', 'nacos', '0:0:0:0:0:0:0:1', 'U', '0298b122-a60d-47f5-9be3-9ea149f17185', '');
COMMIT;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `role` varchar(50) NOT NULL,
  `resource` varchar(255) NOT NULL,
  `action` varchar(8) NOT NULL,
  UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of permissions
-- ----------------------------
BEGIN;
INSERT INTO `permissions` VALUES ('ROLE_PROD', '8c346cfe-9333-448d-b72d-c957d9cc1a80:*:*', 'rw');
INSERT INTO `permissions` VALUES ('ROLE_TEST', '0298b122-a60d-47f5-9be3-9ea149f17185:*:*', 'rw');
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `username` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  UNIQUE KEY `idx_user_role` (`username`,`role`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');
INSERT INTO `roles` VALUES ('prod', 'ROLE_PROD');
INSERT INTO `roles` VALUES ('test', 'ROLE_TEST');
COMMIT;

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_tenant_id` (`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='租户容量信息表';

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`) USING BTREE,
  KEY `idx_tenant_id` (`tenant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='tenant_info';

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
BEGIN;
INSERT INTO `tenant_info` VALUES (1, '1', '0298b122-a60d-47f5-9be3-9ea149f17185', 'test', '测试环境', 'nacos', 1687867984413, 1687867984413);
INSERT INTO `tenant_info` VALUES (3, '1', 'c8cc59da-dea3-44ef-9ff7-055879477406', 'dev', '本地开发环境', 'nacos', 1691386477463, 1691386477463);
INSERT INTO `tenant_info` VALUES (4, '1', '510d8d6d-5898-4b70-b28a-2893c8145b11', 'seata', 'seata 集群空间', 'nacos', 1693372035618, 1693372057805);
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('nacos', '$2a$10$e6yrFvt1CBARjo8sCP26bOhU29WGHZ1Fo9IksnDlNSyTkjyWbq12u', 1);
INSERT INTO `users` VALUES ('prod', '$2a$10$6xTvaoX7HQ5x4ZOENJjtTeiwt3uqpkoRMJq4Ryi/J8Yz/ywx8o.LO', 1);
INSERT INTO `users` VALUES ('test', '$2a$10$brMbWrvcn9RPhtLZXvclnOjWgQrhWzoe4xT7HVXgeslCCLN/T4Mlu', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
