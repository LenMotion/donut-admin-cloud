/*
 Navicat Premium Data Transfer

 Source Server         : donut-cloud
 Source Server Type    : MySQL
 Source Server Version : 80029 (8.0.29)
 Source Host           : localhost:13360
 Source Schema         : nacos

 Target Server Type    : MySQL
 Target Server Version : 80029 (8.0.29)
 File Encoding         : 65001

 Date: 07/06/2024 17:55:21
*/
create database nacos;
use `nacos`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`
(
    `id`                 bigint                                           NOT NULL AUTO_INCREMENT COMMENT 'id',
    `data_id`            varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
    `group_id`           varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT 'group_id',
    `content`            longtext CHARACTER SET utf8 COLLATE utf8_bin     NOT NULL COMMENT 'content',
    `md5`                varchar(32) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL COMMENT 'md5',
    `gmt_create`         datetime                                         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'åˆ›å»ºæ—¶é—´',
    `gmt_modified`       datetime                                         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ä¿®æ”¹æ—¶é—´',
    `src_user`           text CHARACTER SET utf8 COLLATE utf8_bin         NULL COMMENT 'source user',
    `src_ip`             varchar(50) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL COMMENT 'source ip',
    `app_name`           varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT 'app_name',
    `tenant_id`          varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT '' COMMENT 'ç§Ÿæˆ·å­—æ®µ',
    `c_desc`             varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT 'configuration description',
    `c_use`              varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL COMMENT 'configuration usage',
    `effect`             varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL COMMENT 'é…ç½®ç”Ÿæ•ˆçš„æè¿°',
    `type`               varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL COMMENT 'é…ç½®çš„ç±»åž‹',
    `c_schema`           text CHARACTER SET utf8 COLLATE utf8_bin         NULL COMMENT 'é…ç½®çš„æ¨¡å¼',
    `encrypted_data_key` text CHARACTER SET utf8 COLLATE utf8_bin         NOT NULL COMMENT 'å¯†é’¥',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_configinfo_datagrouptenant` (`data_id` ASC, `group_id` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 58
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = 'config_info'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO config_info (id, data_id, group_id, content, md5, gmt_create, gmt_modified, src_user, src_ip,
                               app_name, tenant_id, c_desc, c_use, effect, type, c_schema, encrypted_data_key)
VALUES (2, 'seataServer.properties', 'SEATA_GROUP', 'store.mode=db
#-----db-----
store.db.datasource=druid
store.db.dbType=mysql
# 需要根据mysql的版本调整driverClassName
# mysql8及以上版本对应的driver：com.mysql.cj.jdbc.Driver
# mysql8以下版本的driver：com.mysql.jdbc.Driver
store.db.driverClassName=com.mysql.cj.jdbc.Driver
store.db.url=jdbc:mysql://donut-cloud-mysql8:3306/seata-server?useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&useSSL=false
store.db.user=root
store.db.password=root@123,./
# 数据库初始连接数
store.db.minConn=1
# 数据库最大连接数
store.db.maxConn=20
# 获取连接时最大等待时间 默认5000，单位毫秒
store.db.maxWait=5000
# 全局事务表名 默认global_table
store.db.globalTable=global_table
# 分支事务表名 默认branch_table
store.db.branchTable=branch_table
# 全局锁表名 默认lock_table
store.db.lockTable=lock_table
# 查询全局事务一次的最大条数 默认100
store.db.queryLimit=100


# undo保留天数 默认7天,log_status=1（附录3）和未正常清理的undo
server.undo.logSaveDays=7
# undo清理线程间隔时间 默认86400000，单位毫秒
server.undo.logDeletePeriod=86400000
# 二阶段提交重试超时时长 单位ms,s,m,h,d,对应毫秒,秒,分,小时,天,默认毫秒。默认值-1表示无限重试
# 公式: timeout>=now-globalTransactionBeginTime,true表示超时则不再重试
# 注: 达到超时时间后将不会做任何重试,有数据不一致风险,除非业务自行可校准数据,否者慎用
server.maxCommitRetryTimeout=-1
# 二阶段回滚重试超时时长
server.maxRollbackRetryTimeout=-1
# 二阶段提交未完成状态全局事务重试提交线程间隔时间 默认1000，单位毫秒
server.recovery.committingRetryPeriod=1000
# 二阶段异步提交状态重试提交线程间隔时间 默认1000，单位毫秒
server.recovery.asynCommittingRetryPeriod=1000
# 二阶段回滚状态重试回滚线程间隔时间  默认1000，单位毫秒
server.recovery.rollbackingRetryPeriod=1000
# 超时状态检测重试线程间隔时间 默认1000，单位毫秒，检测出超时将全局事务置入回滚会话管理器
server.recovery.timeoutRetryPeriod=1000', '752f574628ce16ff456c5939367c5be5', '2024-02-20 16:44:38',
        '2024-03-04 09:00:46', null, '172.25.0.1', '', '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', null, null, null,
        'properties', null, '');
INSERT INTO config_info (id, data_id, group_id, content, md5, gmt_create, gmt_modified, src_user, src_ip,
                               app_name, tenant_id, c_desc, c_use, effect, type, c_schema, encrypted_data_key)
VALUES (4, 'base-datasource.yml', 'BASE_GROUP', 'spring:
  datasource:
    type: com.alibaba.druid.pool.DruidDataSource
    driver-class-name: com.p6spy.engine.spy.P6SpyDriver
    druid:
      initial-size: 5
      min-idle: 5
      max-active: 20
      max-wait: 60000
      test-while-idle: true
      time-between-eviction-runs-millis: 60000
      min-evictable-idle-time-millis: 30000
      validation-query: select \'x\'
      test-on-borrow: false
      test-on-return: false
      pool-prepared-statements: false
      max-pool-prepared-statement-per-connection-size: -1
      use-global-data-source-stat: true
      web-stat-filter:
        enabled: true
        url-pattern: /*
        exclusions: /druid/*,*.js,*.gif,*.jpg,*.png,*.css,*.ico
      stat-view-servlet:
        enabled: true
        url-pattern: /druid/*
        reset-enable: false
        login-username: druid
        login-password: druid
        allow: 127.0.0.1

# MyBatis Plus配置
mybatis-plus:
  # 搜索指定包别名
  typeAliasesPackage: cn.lenmotion.donut.**.po
  # 配置mapper的扫描，找到所有的mapper.xml映射文件
  mapperLocations: classpath*:mappers/**/*Mapper.xml
  # 加载全局的配置文件
  #  configLocation: classpath:mybatis/mybatis-config.xml
  global-config:
    db-config:
      logic-delete-field: deleted
    banner: false
', '17403705f2ca0b82670a10b5941fe967', '2024-02-27 15:54:01', '2024-03-04 09:00:47', null, '172.25.0.1', '',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '', null, null, 'yaml', null, '');
INSERT INTO config_info (id, data_id, group_id, content, md5, gmt_create, gmt_modified, src_user, src_ip,
                               app_name, tenant_id, c_desc, c_use, effect, type, c_schema, encrypted_data_key)
VALUES (5, 'system-server.yml', 'DEFAULT_GROUP', 'spring:
  datasource:
    url: jdbc:p6spy:mysql://localhost:13360/donut-system?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8
    username: root
    password: root@123,./

project:
  tenant-ignore-tables:
    - sys_tenant
    - sys_menu
    - sys_job
    - sys_job_log
    - sys_dict_type
    - sys_dict_data', '3fdd8586b2e337060ed829c1597daf4d', '2024-02-27 15:54:33', '2024-06-13 13:18:28', 'nacos',
        '172.29.0.1', '', '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '', '', '', 'yaml', '', '');
INSERT INTO config_info (id, data_id, group_id, content, md5, gmt_create, gmt_modified, src_user, src_ip,
                               app_name, tenant_id, c_desc, c_use, effect, type, c_schema, encrypted_data_key)
VALUES (6, 'base-redis.yml', 'BASE_GROUP', 'spring:
  data:
    # redis 配置
    redis:
      # 地址
      host: localhost
      # 端口，默认为6379
      port: 16397
      # 数据库索引
      database: 5
      # 密码
      password: donut@123,./
      # 连接超时时间
      timeout: 15000
      lettuce:
        pool:
          # 连接池中的最小空闲连接
          min-idle: 0
          # 连接池中的最大空闲连接
          max-idle: 10
          # 连接池的最大数据库连接数
          max-active: 20
          # #连接池最大阻塞等待时间（使用负值表示没有限制）
          max-wait: -1ms', '4e743bf20ecec260901e531e28bca919', '2024-02-27 15:55:31', '2024-06-07 17:39:30', 'nacos',
        '172.29.0.1', '', '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '', '', '', 'yaml', '', '');
INSERT INTO config_info (id, data_id, group_id, content, md5, gmt_create, gmt_modified, src_user, src_ip,
                               app_name, tenant_id, c_desc, c_use, effect, type, c_schema, encrypted_data_key)
VALUES (8, 'base-config.yml', 'BASE_GROUP', '
project:
  rsaPrivateKey: MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBALH81v/GpK1KW4zQotxHwI2BVOQ+g9VcVQxnDb6Zs+t+rlS18slqjGcINYBCWvkpEyqz3jI4evmXYQn64FNR7lY1QALDwetTyi5t70vC1aSmmk2ZO3DB3PP9l+ygbkDmYy1pjP+JunkT1cbogcXL6nUNRHFSR/upwdmA/+1OeMplAgMBAAECgYAqje4Fh0PWHsIWv8dAbXNPIc3fKEcy2vmGlpkFqhAHTOl3XW0n1O6ur5rDCJphmf14JzsHvNNCG3xa+31ozlzyHvjXN2kGUW5UDW7gJm/yh8HDtyl4IK/BFv9bFbpvMkSMkThiUI1zucafmQe8e7rMMJFzM2XfFuq1ilkBzqjlAQJBAOy4cgx+SbxjtU40xxOzLAC7K1qHzas4Ocv8BsMG4iCZs2Yrh/sCQs3nYx9EEbN2PgqZpY7uFUoulisDvieiHyUCQQDAe9Tfto6dlPJjbzT7dtMqTXTeCwpkGpOwbvvBoxY4b1OGUG8gzScbmAE1U+YAH0I2WaHwuHj6RELpAHIklrpBAkEAzKN6vIAkID8WCmCnxMj8fjlP9jg2PREjLctW0RxPOZ2FsApryDuhIr0oPGws3TaX1bQTomcBcpqpaNAYf8ywHQJAJHpTSWJLfMmxde6pV86ZDjdHopztBzOSMamWxIenumI+rgGoTcsTUkNoVzbjK7rAzZQHAJu1MZimJYoUF6MJAQJBAI3q0IOgbZkDSVXlLxzNIO9QrlgDqoVjQKnlM8LL/3yXZOKTDbPSpenlJpgy5/sbrexA3S50B5gPoDMhPxiSyJY=
  rsaPublicKey: MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCx/Nb/xqStSluM0KLcR8CNgVTkPoPVXFUMZw2+mbPrfq5UtfLJaoxnCDWAQlr5KRMqs94yOHr5l2EJ+uBTUe5WNUACw8HrU8oube9LwtWkpppNmTtwwdzz/ZfsoG5A5mMtaYz/ibp5E9XG6IHFy+p1DURxUkf7qcHZgP/tTnjKZQIDAQAB

############## Sa-Token 配置 (文档: https://sa-token.cc) ##############
sa-token:
  # token 名称（同时也是 cookie 名称）
  token-name: Authorization
  # token 有效期（单位：秒） 默认1天，-1 代表永久有效
  timeout: 43200
  # token 最低活跃频率（单位：秒），如果 token 超过此时间没有访问系统就会被冻结，默认1小时 代表不限制，永不冻结
  active-timeout: 3600
  # 是否允许同一账号多地同时登录 （为 true 时允许一起登录, 为 false 时新登录挤掉旧登录）
  is-concurrent: true
  # 在多人登录同一账号时，是否共用一个 token （为 true 时所有登录共用一个 token, 为 false 时每次登录新建一个 token）
  is-share: false
  # token 风格（默认可取值：uuid、simple-uuid、random-32、random-64、random-128、tik）
  token-style: random-64
  # 是否输出操作日志
  is-log: true
  # 不从cookie读取token
  is-read-cookie: false
  # token的前缀
  token-prefix: Bearer
  # 不打印sa-token的图标
  is-print: false

easy-trans:
   #启用redis缓存 如果不用redis请设置为false
   is-enable-redis: true
   #启用全局翻译(拦截所有responseBody进行自动翻译)，如果关闭需要手动调用翻译方法或者方法加注解，具体看文档
   is-enable-global: true 
   #启用平铺模式
   is-enable-tile: false
   #字典缓存放到redis 微服务模式请开启
   dict-use-redis: true 
   # MP为 3.5.3.2版本以上的3.x 版本请设置为true，否则可能会出现找不到对应方法的问题
   mp-new: true

spring:
  boot:
    admin:
      client:
        instance:
          service-url: http://127.0.0.1:${server.port}${server.servlet.context-path}/
        url: http://127.0.0.1:13102
 
management:
  endpoints:
    web:
      exposure:
        include: \'*\'
  endpoint:
    health:
      show-details: ALWAYS
      
# springdoc-openapi项目配置
springdoc:
  # 默认是false，需要设置为true
  default-flat-param-object: true
  swagger-ui:
    path: /swagger-ui.html
    tags-sorter: alpha
    operations-sorter: alpha
  api-docs:
    path: /v3/api-docs
# knife4j的增强配置，不需要增强可以不配
knife4j:
  enable: true
  setting:
    language: zh_cn

dromara:
  x-file-storage: #文件存储配置
    default-platform: minio-1 #默认使用的存储平台
    minio:
      - platform: minio-1 # 存储平台标识
        enable-storage: true  # 启用存储
        access-key: admin
        secret-key: 123456qwe
        end-point: http://127.0.0.1:9100
        bucket-name: donut
        domain: http://localhost:9100/ # 访问域名，注意“/”结尾，例如：http://minio.abc.com/abc/

', 'ca59a8d7081c80b632b8178cca2943dd', '2024-02-27 16:03:53', '2024-06-14 17:24:59', 'nacos', '172.29.0.1', '',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '', '', '', 'yaml', '', '');
INSERT INTO config_info (id, data_id, group_id, content, md5, gmt_create, gmt_modified, src_user, src_ip,
                               app_name, tenant_id, c_desc, c_use, effect, type, c_schema, encrypted_data_key)
VALUES (44, 'auth-server.yml', 'DEFAULT_GROUP', 'project:
  rsaPrivateKey: MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBALH81v/GpK1KW4zQotxHwI2BVOQ+g9VcVQxnDb6Zs+t+rlS18slqjGcINYBCWvkpEyqz3jI4evmXYQn64FNR7lY1QALDwetTyi5t70vC1aSmmk2ZO3DB3PP9l+ygbkDmYy1pjP+JunkT1cbogcXL6nUNRHFSR/upwdmA/+1OeMplAgMBAAECgYAqje4Fh0PWHsIWv8dAbXNPIc3fKEcy2vmGlpkFqhAHTOl3XW0n1O6ur5rDCJphmf14JzsHvNNCG3xa+31ozlzyHvjXN2kGUW5UDW7gJm/yh8HDtyl4IK/BFv9bFbpvMkSMkThiUI1zucafmQe8e7rMMJFzM2XfFuq1ilkBzqjlAQJBAOy4cgx+SbxjtU40xxOzLAC7K1qHzas4Ocv8BsMG4iCZs2Yrh/sCQs3nYx9EEbN2PgqZpY7uFUoulisDvieiHyUCQQDAe9Tfto6dlPJjbzT7dtMqTXTeCwpkGpOwbvvBoxY4b1OGUG8gzScbmAE1U+YAH0I2WaHwuHj6RELpAHIklrpBAkEAzKN6vIAkID8WCmCnxMj8fjlP9jg2PREjLctW0RxPOZ2FsApryDuhIr0oPGws3TaX1bQTomcBcpqpaNAYf8ywHQJAJHpTSWJLfMmxde6pV86ZDjdHopztBzOSMamWxIenumI+rgGoTcsTUkNoVzbjK7rAzZQHAJu1MZimJYoUF6MJAQJBAI3q0IOgbZkDSVXlLxzNIO9QrlgDqoVjQKnlM8LL/3yXZOKTDbPSpenlJpgy5/sbrexA3S50B5gPoDMhPxiSyJY=
  rsaPublicKey: MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCx/Nb/xqStSluM0KLcR8CNgVTkPoPVXFUMZw2+mbPrfq5UtfLJaoxnCDWAQlr5KRMqs94yOHr5l2EJ+uBTUe5WNUACw8HrU8oube9LwtWkpppNmTtwwdzz/ZfsoG5A5mMtaYz/ibp5E9XG6IHFy+p1DURxUkf7qcHZgP/tTnjKZQIDAQAB',
        '8905c811766e315a089a8cb80b484bdc', '2024-03-05 13:28:05', '2024-03-05 13:28:05', null, '172.25.0.1', '',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', null, null, null, 'yaml', null, '');
INSERT INTO config_info (id, data_id, group_id, content, md5, gmt_create, gmt_modified, src_user, src_ip,
                               app_name, tenant_id, c_desc, c_use, effect, type, c_schema, encrypted_data_key)
VALUES (48, 'basic-gateway-server.yml', 'DEFAULT_GROUP', '
# knife4j的增强配置，不需要增强可以不配
knife4j:
  # 聚合swagger文档
  gateway:
    enabled: true
    # 排序规则(tag/operation排序自4.2.0版本新增)
    # 取值：alpha-默认排序规则，官方swagger-ui默认实现,order-Knife4j提供的增强排序规则，开发者可扩展x-order，根据数值来自定义排序
    tags-sorter: order
    operations-sorter: order
    # 指定手动配置的模式(默认为该模式)
    strategy: discover
spring:
  cloud:
    gateway:
      routes: # 网关路由配置
        - id: system-server 
          uri: lb://system-server 
          predicates: 
            - Path=/system/**
        - id: websocket-server 
          uri: lb:ws://system-server
          predicates:
            - Path=/ws/** 
          filters:
            - RewritePath=/ws(?<segment>/?.*), /system/ws${segment}
        - id: auth-server 
          uri: lb://auth-server
          predicates:
            - Path=/auth/**
        - id: generator-server
          uri: lb://generator-server
          predicates:
            - Path=/generator/**
        - id: monitor-server
          uri: lb://monitor-server
          predicates:
            - Path=/monitor/**

', 'f91c326ccbf5191a2dc0a7ba4c56787f', '2024-03-06 11:11:23', '2024-06-28 11:06:08', 'nacos', '172.29.0.1', '',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '', '', '', 'yaml', '', '');
INSERT INTO config_info (id, data_id, group_id, content, md5, gmt_create, gmt_modified, src_user, src_ip,
                               app_name, tenant_id, c_desc, c_use, effect, type, c_schema, encrypted_data_key)
VALUES (53, 'generator-server.yml', 'DEFAULT_GROUP', 'spring:
  datasource:
    url: jdbc:p6spy:mysql://localhost:13360/donut-generator?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8
    username: root
    password: root@123,./

project:
  tenant-ignore-tables:
    - gen_table
    - gen_table_column
    - gen_datasource', 'cbef3d9b2f9b263250706824f3a6b908', '2024-06-07 16:36:50', '2024-06-13 13:18:57', 'nacos',
        '172.29.0.1', '', '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '', '', '', 'yaml', '', '');

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`
(
    `id`           bigint                                           NOT NULL AUTO_INCREMENT COMMENT 'id',
    `data_id`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
    `group_id`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
    `datum_id`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
    `content`      longtext CHARACTER SET utf8 COLLATE utf8_bin     NOT NULL COMMENT 'å†…å®¹',
    `gmt_modified` datetime                                         NOT NULL COMMENT 'ä¿®æ”¹æ—¶é—´',
    `app_name`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
    `tenant_id`    varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'ç§Ÿæˆ·å­—æ®µ',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum` (`data_id` ASC, `group_id` ASC, `tenant_id` ASC, `datum_id` ASC) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = 'å¢žåŠ ç§Ÿæˆ·å­—æ®µ'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`
(
    `id`                 bigint                                            NOT NULL AUTO_INCREMENT COMMENT 'id',
    `data_id`            varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL COMMENT 'data_id',
    `group_id`           varchar(128) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL COMMENT 'group_id',
    `app_name`           varchar(128) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL COMMENT 'app_name',
    `content`            longtext CHARACTER SET utf8 COLLATE utf8_bin      NOT NULL COMMENT 'content',
    `beta_ips`           varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT 'betaIps',
    `md5`                varchar(32) CHARACTER SET utf8 COLLATE utf8_bin   NULL     DEFAULT NULL COMMENT 'md5',
    `gmt_create`         datetime                                          NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'åˆ›å»ºæ—¶é—´',
    `gmt_modified`       datetime                                          NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ä¿®æ”¹æ—¶é—´',
    `src_user`           text CHARACTER SET utf8 COLLATE utf8_bin          NULL COMMENT 'source user',
    `src_ip`             varchar(50) CHARACTER SET utf8 COLLATE utf8_bin   NULL     DEFAULT NULL COMMENT 'source ip',
    `tenant_id`          varchar(128) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT '' COMMENT 'ç§Ÿæˆ·å­—æ®µ',
    `encrypted_data_key` text CHARACTER SET utf8 COLLATE utf8_bin          NOT NULL COMMENT 'å¯†é’¥',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_configinfobeta_datagrouptenant` (`data_id` ASC, `group_id` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = 'config_info_beta'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`
(
    `id`           bigint                                           NOT NULL AUTO_INCREMENT COMMENT 'id',
    `data_id`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
    `group_id`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
    `tenant_id`    varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT '' COMMENT 'tenant_id',
    `tag_id`       varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
    `app_name`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT 'app_name',
    `content`      longtext CHARACTER SET utf8 COLLATE utf8_bin     NOT NULL COMMENT 'content',
    `md5`          varchar(32) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL COMMENT 'md5',
    `gmt_create`   datetime                                         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'åˆ›å»ºæ—¶é—´',
    `gmt_modified` datetime                                         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ä¿®æ”¹æ—¶é—´',
    `src_user`     text CHARACTER SET utf8 COLLATE utf8_bin         NULL COMMENT 'source user',
    `src_ip`       varchar(50) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL COMMENT 'source ip',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_configinfotag_datagrouptenanttag` (`data_id` ASC, `group_id` ASC, `tenant_id` ASC, `tag_id` ASC) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = 'config_info_tag'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`
(
    `id`        bigint                                           NOT NULL COMMENT 'id',
    `tag_name`  varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
    `tag_type`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL COMMENT 'tag_type',
    `data_id`   varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
    `group_id`  varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
    `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
    `nid`       bigint                                           NOT NULL AUTO_INCREMENT COMMENT 'nid, è‡ªå¢žé•¿æ ‡è¯†',
    PRIMARY KEY (`nid`) USING BTREE,
    UNIQUE INDEX `uk_configtagrelation_configidtag` (`id` ASC, `tag_name` ASC, `tag_type` ASC) USING BTREE,
    INDEX `idx_tenant_id` (`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = 'config_tag_relation'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`
(
    `id`                bigint UNSIGNED                                  NOT NULL AUTO_INCREMENT COMMENT 'ä¸»é”®ID',
    `group_id`          varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group IDï¼Œç©ºå­—ç¬¦è¡¨ç¤ºæ•´ä¸ªé›†ç¾¤',
    `quota`             int UNSIGNED                                     NOT NULL DEFAULT 0 COMMENT 'é…é¢ï¼Œ0è¡¨ç¤ºä½¿ç”¨é»˜è®¤å€¼',
    `usage`             int UNSIGNED                                     NOT NULL DEFAULT 0 COMMENT 'ä½¿ç”¨é‡',
    `max_size`          int UNSIGNED                                     NOT NULL DEFAULT 0 COMMENT 'å•ä¸ªé…ç½®å¤§å°ä¸Šé™ï¼Œå•ä½ä¸ºå­—èŠ‚ï¼Œ0è¡¨ç¤ºä½¿ç”¨é»˜è®¤å€¼',
    `max_aggr_count`    int UNSIGNED                                     NOT NULL DEFAULT 0 COMMENT 'èšåˆå­é…ç½®æœ€å¤§ä¸ªæ•°ï¼Œï¼Œ0è¡¨ç¤ºä½¿ç”¨é»˜è®¤å€¼',
    `max_aggr_size`     int UNSIGNED                                     NOT NULL DEFAULT 0 COMMENT 'å•ä¸ªèšåˆæ•°æ®çš„å­é…ç½®å¤§å°ä¸Šé™ï¼Œå•ä½ä¸ºå­—èŠ‚ï¼Œ0è¡¨ç¤ºä½¿ç”¨é»˜è®¤å€¼',
    `max_history_count` int UNSIGNED                                     NOT NULL DEFAULT 0 COMMENT 'æœ€å¤§å˜æ›´åŽ†å²æ•°é‡',
    `gmt_create`        datetime                                         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'åˆ›å»ºæ—¶é—´',
    `gmt_modified`      datetime                                         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ä¿®æ”¹æ—¶é—´',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_group_id` (`group_id` ASC) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = 'é›†ç¾¤ã€å„Groupå®¹é‡ä¿¡æ¯è¡¨'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`
(
    `id`                 bigint UNSIGNED                                  NOT NULL COMMENT 'id',
    `nid`                bigint UNSIGNED                                  NOT NULL AUTO_INCREMENT COMMENT 'nid, è‡ªå¢žæ ‡è¯†',
    `data_id`            varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
    `group_id`           varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
    `app_name`           varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT 'app_name',
    `content`            longtext CHARACTER SET utf8 COLLATE utf8_bin     NOT NULL COMMENT 'content',
    `md5`                varchar(32) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL COMMENT 'md5',
    `gmt_create`         datetime                                         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'åˆ›å»ºæ—¶é—´',
    `gmt_modified`       datetime                                         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ä¿®æ”¹æ—¶é—´',
    `src_user`           text CHARACTER SET utf8 COLLATE utf8_bin         NULL COMMENT 'source user',
    `src_ip`             varchar(50) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL COMMENT 'source ip',
    `op_type`            char(10) CHARACTER SET utf8 COLLATE utf8_bin     NULL     DEFAULT NULL COMMENT 'operation type',
    `tenant_id`          varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT '' COMMENT 'ç§Ÿæˆ·å­—æ®µ',
    `encrypted_data_key` text CHARACTER SET utf8 COLLATE utf8_bin         NOT NULL COMMENT 'å¯†é’¥',
    PRIMARY KEY (`nid`) USING BTREE,
    INDEX `idx_gmt_create` (`gmt_create` ASC) USING BTREE,
    INDEX `idx_gmt_modified` (`gmt_modified` ASC) USING BTREE,
    INDEX `idx_did` (`data_id` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 63
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = 'å¤šç§Ÿæˆ·æ”¹é€ '
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info`
VALUES (0, 1, 'seataServer.properties', 'DEFAULT_GROUP', '',
        'store.mode=db\r\n#-----db-----\r\nstore.db.datasource=druid\r\nstore.db.dbType=mysql\r\n# 需要根据mysql的版本调整driverClassName\r\n# mysql8及以上版本对应的driver：com.mysql.cj.jdbc.Driver\r\n# mysql8以下版本的driver：com.mysql.jdbc.Driver\r\nstore.db.driverClassName=com.mysql.cj.jdbc.Driver\r\nstore.db.url=jdbc:mysql://donut-cloud-mysql8:3306/seata-server?useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&useSSL=false\r\nstore.db.user=root\r\nstore.db.password=root@123,./\r\n# 数据库初始连接数\r\nstore.db.minConn=1\r\n# 数据库最大连接数\r\nstore.db.maxConn=20\r\n# 获取连接时最大等待时间 默认5000，单位毫秒\r\nstore.db.maxWait=5000\r\n# 全局事务表名 默认global_table\r\nstore.db.globalTable=global_table\r\n# 分支事务表名 默认branch_table\r\nstore.db.branchTable=branch_table\r\n# 全局锁表名 默认lock_table\r\nstore.db.lockTable=lock_table\r\n# 查询全局事务一次的最大条数 默认100\r\nstore.db.queryLimit=100\r\n\r\n\r\n# undo保留天数 默认7天,log_status=1（附录3）和未正常清理的undo\r\nserver.undo.logSaveDays=7\r\n# undo清理线程间隔时间 默认86400000，单位毫秒\r\nserver.undo.logDeletePeriod=86400000\r\n# 二阶段提交重试超时时长 单位ms,s,m,h,d,对应毫秒,秒,分,小时,天,默认毫秒。默认值-1表示无限重试\r\n# 公式: timeout>=now-globalTransactionBeginTime,true表示超时则不再重试\r\n# 注: 达到超时时间后将不会做任何重试,有数据不一致风险,除非业务自行可校准数据,否者慎用\r\nserver.maxCommitRetryTimeout=-1\r\n# 二阶段回滚重试超时时长\r\nserver.maxRollbackRetryTimeout=-1\r\n# 二阶段提交未完成状态全局事务重试提交线程间隔时间 默认1000，单位毫秒\r\nserver.recovery.committingRetryPeriod=1000\r\n# 二阶段异步提交状态重试提交线程间隔时间 默认1000，单位毫秒\r\nserver.recovery.asynCommittingRetryPeriod=1000\r\n# 二阶段回滚状态重试回滚线程间隔时间  默认1000，单位毫秒\r\nserver.recovery.rollbackingRetryPeriod=1000\r\n# 超时状态检测重试线程间隔时间 默认1000，单位毫秒，检测出超时将全局事务置入回滚会话管理器\r\nserver.recovery.timeoutRetryPeriod=1000',
        '752f574628ce16ff456c5939367c5be5', '2024-02-20 16:43:13', '2024-02-20 16:43:14', NULL, '172.25.0.1', 'I',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (0, 2, 'seataServer.properties', 'SEATA_GROUP', '',
        'store.mode=db\r\n#-----db-----\r\nstore.db.datasource=druid\r\nstore.db.dbType=mysql\r\n# 需要根据mysql的版本调整driverClassName\r\n# mysql8及以上版本对应的driver：com.mysql.cj.jdbc.Driver\r\n# mysql8以下版本的driver：com.mysql.jdbc.Driver\r\nstore.db.driverClassName=com.mysql.cj.jdbc.Driver\r\nstore.db.url=jdbc:mysql://donut-cloud-mysql8:3306/seata-server?useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&useSSL=false\r\nstore.db.user=root\r\nstore.db.password=root@123,./\r\n# 数据库初始连接数\r\nstore.db.minConn=1\r\n# 数据库最大连接数\r\nstore.db.maxConn=20\r\n# 获取连接时最大等待时间 默认5000，单位毫秒\r\nstore.db.maxWait=5000\r\n# 全局事务表名 默认global_table\r\nstore.db.globalTable=global_table\r\n# 分支事务表名 默认branch_table\r\nstore.db.branchTable=branch_table\r\n# 全局锁表名 默认lock_table\r\nstore.db.lockTable=lock_table\r\n# 查询全局事务一次的最大条数 默认100\r\nstore.db.queryLimit=100\r\n\r\n\r\n# undo保留天数 默认7天,log_status=1（附录3）和未正常清理的undo\r\nserver.undo.logSaveDays=7\r\n# undo清理线程间隔时间 默认86400000，单位毫秒\r\nserver.undo.logDeletePeriod=86400000\r\n# 二阶段提交重试超时时长 单位ms,s,m,h,d,对应毫秒,秒,分,小时,天,默认毫秒。默认值-1表示无限重试\r\n# 公式: timeout>=now-globalTransactionBeginTime,true表示超时则不再重试\r\n# 注: 达到超时时间后将不会做任何重试,有数据不一致风险,除非业务自行可校准数据,否者慎用\r\nserver.maxCommitRetryTimeout=-1\r\n# 二阶段回滚重试超时时长\r\nserver.maxRollbackRetryTimeout=-1\r\n# 二阶段提交未完成状态全局事务重试提交线程间隔时间 默认1000，单位毫秒\r\nserver.recovery.committingRetryPeriod=1000\r\n# 二阶段异步提交状态重试提交线程间隔时间 默认1000，单位毫秒\r\nserver.recovery.asynCommittingRetryPeriod=1000\r\n# 二阶段回滚状态重试回滚线程间隔时间  默认1000，单位毫秒\r\nserver.recovery.rollbackingRetryPeriod=1000\r\n# 超时状态检测重试线程间隔时间 默认1000，单位毫秒，检测出超时将全局事务置入回滚会话管理器\r\nserver.recovery.timeoutRetryPeriod=1000',
        '752f574628ce16ff456c5939367c5be5', '2024-02-20 16:44:37', '2024-02-20 16:44:38', NULL, '172.25.0.1', 'I',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (1, 3, 'seataServer.properties', 'DEFAULT_GROUP', '',
        'store.mode=db\r\n#-----db-----\r\nstore.db.datasource=druid\r\nstore.db.dbType=mysql\r\n# 需要根据mysql的版本调整driverClassName\r\n# mysql8及以上版本对应的driver：com.mysql.cj.jdbc.Driver\r\n# mysql8以下版本的driver：com.mysql.jdbc.Driver\r\nstore.db.driverClassName=com.mysql.cj.jdbc.Driver\r\nstore.db.url=jdbc:mysql://donut-cloud-mysql8:3306/seata-server?useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&useSSL=false\r\nstore.db.user=root\r\nstore.db.password=root@123,./\r\n# 数据库初始连接数\r\nstore.db.minConn=1\r\n# 数据库最大连接数\r\nstore.db.maxConn=20\r\n# 获取连接时最大等待时间 默认5000，单位毫秒\r\nstore.db.maxWait=5000\r\n# 全局事务表名 默认global_table\r\nstore.db.globalTable=global_table\r\n# 分支事务表名 默认branch_table\r\nstore.db.branchTable=branch_table\r\n# 全局锁表名 默认lock_table\r\nstore.db.lockTable=lock_table\r\n# 查询全局事务一次的最大条数 默认100\r\nstore.db.queryLimit=100\r\n\r\n\r\n# undo保留天数 默认7天,log_status=1（附录3）和未正常清理的undo\r\nserver.undo.logSaveDays=7\r\n# undo清理线程间隔时间 默认86400000，单位毫秒\r\nserver.undo.logDeletePeriod=86400000\r\n# 二阶段提交重试超时时长 单位ms,s,m,h,d,对应毫秒,秒,分,小时,天,默认毫秒。默认值-1表示无限重试\r\n# 公式: timeout>=now-globalTransactionBeginTime,true表示超时则不再重试\r\n# 注: 达到超时时间后将不会做任何重试,有数据不一致风险,除非业务自行可校准数据,否者慎用\r\nserver.maxCommitRetryTimeout=-1\r\n# 二阶段回滚重试超时时长\r\nserver.maxRollbackRetryTimeout=-1\r\n# 二阶段提交未完成状态全局事务重试提交线程间隔时间 默认1000，单位毫秒\r\nserver.recovery.committingRetryPeriod=1000\r\n# 二阶段异步提交状态重试提交线程间隔时间 默认1000，单位毫秒\r\nserver.recovery.asynCommittingRetryPeriod=1000\r\n# 二阶段回滚状态重试回滚线程间隔时间  默认1000，单位毫秒\r\nserver.recovery.rollbackingRetryPeriod=1000\r\n# 超时状态检测重试线程间隔时间 默认1000，单位毫秒，检测出超时将全局事务置入回滚会话管理器\r\nserver.recovery.timeoutRetryPeriod=1000',
        '752f574628ce16ff456c5939367c5be5', '2024-02-20 16:44:41', '2024-02-20 16:44:42', NULL, '172.25.0.1', 'D',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (0, 4, 'p6spy.properties', 'DEFAULT_GROUP', '',
        '# 自定义日志打印\r\nmodulelist=com.baomidou.mybatisplus.extension.p6spy.MybatisPlusLogFactory,com.p6spy.engine.outage.P6OutageFactory\r\n# 自定义日志打印\r\nlogMessageFormat=cn.lenmotion.donut.common.starter.config.P6spySqlFormatConfig\r\n# 使用日志系统记录sql\r\nappender=com.p6spy.engine.spy.appender.Slf4JLogger\r\n# 设置使用p6spy driver来做代理\r\nderegisterdrivers=true\r\n# 取消JDBC URL前缀\r\nuseprefix=true\r\n# 显示指定过滤 Log 时排队的分类列表，取值: error,info,batch,debug,statement,commit,rollback,result,resultset.\r\nexcludecategories=info,debug,result,commit,resultset\r\n# 日期格式\r\ndateformat=yyyy-MM-dd HH:mm:ss\r\n# 是否开启慢SQL记录\r\noutagedetection=true\r\n# 慢SQL记录标准 秒\r\noutagedetectioninterval=2\r\n\r\n',
        '6488961b213809cf8f849aa8526fdcb1', '2024-02-27 15:51:46', '2024-02-27 15:51:46', NULL, '172.25.0.1', 'I',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (0, 5, 'base-datasource.yml', 'DEFAULT_GROUP', '',
        'spring:\r\n  datasource:\r\n    type: com.alibaba.druid.pool.DruidDataSource\r\n    driver-class-name: com.p6spy.engine.spy.P6SpyDriver\r\n    druid:\r\n      initial-size: 5\r\n      min-idle: 5\r\n      max-active: 20\r\n      max-wait: 60000\r\n      test-while-idle: true\r\n      time-between-eviction-runs-millis: 60000\r\n      min-evictable-idle-time-millis: 30000\r\n      validation-query: select \'x\'\r\n      test-on-borrow: false\r\n      test-on-return: false\r\n      pool-prepared-statements: false\r\n      max-pool-prepared-statement-per-connection-size: -1\r\n      use-global-data-source-stat: true\r\n      web-stat-filter:\r\n        enabled: true\r\n        url-pattern: /*\r\n        exclusions: /druid/*,*.js,*.gif,*.jpg,*.png,*.css,*.ico\r\n      stat-view-servlet:\r\n        enabled: true\r\n        url-pattern: /druid/*\r\n        reset-enable: false\r\n        login-username: druid\r\n        login-password: druid\r\n        allow: 127.0.0.1',
        'c16021e245a550ccc8c09baa59134ab4', '2024-02-27 15:54:01', '2024-02-27 15:54:01', NULL, '172.25.0.1', 'I',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (0, 6, 'system-server.yml', 'DEFAULT_GROUP', '',
        'spring:\r\n  datasource:\r\n    url: jdbc:p6spy:mysql://localhost:13360/donut-system?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n    username: root\r\n    password: root@123,./',
        '37a9bf5b6eeb9054457daee5a105c7f2', '2024-02-27 15:54:32', '2024-02-27 15:54:33', NULL, '172.25.0.1', 'I',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (0, 7, 'base-redis.yml', 'DEFAULT_GROUP', '',
        'spring:\r\n  data:\r\n    # redis 配置\r\n    redis:\r\n      # 地址\r\n      host: localhost\r\n      # 端口，默认为6379\r\n      port: 6379\r\n      # 数据库索引\r\n      database: 1\r\n      # 密码\r\n      password: 123456\r\n      # 连接超时时间\r\n      timeout: 15000\r\n      lettuce:\r\n        pool:\r\n          # 连接池中的最小空闲连接\r\n          min-idle: 0\r\n          # 连接池中的最大空闲连接\r\n          max-idle: 10\r\n          # 连接池的最大数据库连接数\r\n          max-active: 20\r\n          # #连接池最大阻塞等待时间（使用负值表示没有限制）\r\n          max-wait: -1ms',
        'c271a0225791236652a226efa74d2ad0', '2024-02-27 15:55:31', '2024-02-27 15:55:31', NULL, '172.25.0.1', 'I',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (6, 8, 'base-redis.yml', 'DEFAULT_GROUP', '',
        'spring:\r\n  data:\r\n    # redis 配置\r\n    redis:\r\n      # 地址\r\n      host: localhost\r\n      # 端口，默认为6379\r\n      port: 6379\r\n      # 数据库索引\r\n      database: 1\r\n      # 密码\r\n      password: 123456\r\n      # 连接超时时间\r\n      timeout: 15000\r\n      lettuce:\r\n        pool:\r\n          # 连接池中的最小空闲连接\r\n          min-idle: 0\r\n          # 连接池中的最大空闲连接\r\n          max-idle: 10\r\n          # 连接池的最大数据库连接数\r\n          max-active: 20\r\n          # #连接池最大阻塞等待时间（使用负值表示没有限制）\r\n          max-wait: -1ms',
        'c271a0225791236652a226efa74d2ad0', '2024-02-27 15:55:40', '2024-02-27 15:55:40', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (0, 9, 'base-config.yml', 'DEFAULT_GROUP', '',
        'spring:\r\n  boot:\r\n    admin:\r\n      client:\r\n        url: http://localhost:8401\r\n \r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n  endpoint:\r\n    health:\r\n      show-details: ALWAYS',
        '1829c27001e163eede7e8ab41221903c', '2024-02-27 16:03:53', '2024-02-27 16:03:53', NULL, '172.25.0.1', 'I',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (8, 10, 'base-config.yml', 'DEFAULT_GROUP', '',
        'spring:\r\n  boot:\r\n    admin:\r\n      client:\r\n        url: http://localhost:8401\r\n \r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n  endpoint:\r\n    health:\r\n      show-details: ALWAYS',
        '1829c27001e163eede7e8ab41221903c', '2024-02-27 16:04:41', '2024-02-27 16:04:42', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (8, 11, 'base-config.yml', 'DEFAULT_GROUP', '',
        'spring:\n  boot:\n    admin:\n      client:\n        url: http://system-server:13102\n \nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: ALWAYS',
        'c210f2bcba60b58f895ff89061d81278', '2024-02-27 16:06:00', '2024-02-27 16:06:00', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (8, 12, 'base-config.yml', 'DEFAULT_GROUP', '',
        'spring:\n  boot:\n    admin:\n      client:\n        url: http://127.0.0.1:13102\n \nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: ALWAYS',
        '2436047e6821dd9eed734748f311ebfd', '2024-02-27 16:24:26', '2024-02-27 16:24:26', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (8, 13, 'base-config.yml', 'DEFAULT_GROUP', '',
        'spring:\n  boot:\n    admin:\n      client:\n        url: http://127.0.0.1:13102\n \nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: ALWAYS\n      \n# MyBatis Plus配置\nmybatis-plus:\n  # 搜索指定包别名\n  typeAliasesPackage: cn.lenmotion.donut.**.po\n  # 配置mapper的扫描，找到所有的mapper.xml映射文件\n  mapperLocations: classpath*:mappers/**/*Mapper.xml\n  # 加载全局的配置文件\n  #  configLocation: classpath:mybatis/mybatis-config.xml\n  global-config:\n    db-config:\n      logic-delete-field: deleted\n    banner: false',
        'd344c6e5128df1b7977050f3ec4d4657', '2024-02-27 16:29:10', '2024-02-27 16:29:10', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (0, 14, 'gateway-server.yml', 'DEFAULT_GROUP', '',
        '# springdoc-openapi项目配置\r\nspringdoc:\r\n  # 默认是false，需要设置为true\r\n  default-flat-param-object: true\r\n  swagger-ui:\r\n    path: /swagger-ui.html\r\n    tags-sorter: alpha\r\n    operations-sorter: alpha\r\n  api-docs:\r\n    path: /v3/api-docs\r\n# knife4j的增强配置，不需要增强可以不配\r\nknife4j:\r\n  enable: true\r\n  setting:\r\n    language: zh_cn',
        '0895488027758025c20b1103b36c14f5', '2024-02-27 16:41:10', '2024-02-27 16:41:10', NULL, '172.25.0.1', 'I',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (0, 15, 'banner.txt', 'DEFAULT_GROUP', '',
        '        __               __\r\n    ___/ /__  ___  __ __/ /_\r\n   / _  / _ \\/ _ \\/ // / __/\r\n   \\_,_/\\___/_//_/\\_,_/\\__/\r\n\r\n   甜甜圈通用管理系统 (Author: LenMotion)\r\n\r\n   JDK Version: ${java.version}\r\n   Application Version: ${project.version}\r\n   Spring Boot Version: ${spring-boot.version}\r\n',
        '13822df1103b730dc38db2f71d9bbf8a', '2024-02-27 16:43:01', '2024-02-27 16:43:01', NULL, '172.25.0.1', 'I',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (8, 16, 'base-config.yml', 'DEFAULT_GROUP', '',
        'spring:\n  boot:\n    admin:\n      client:\n        instance:\n          service-url: http://127.0.0.1:${server.port}/\n        url: http://127.0.0.1:13102\n \nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: ALWAYS\n      \n# MyBatis Plus配置\nmybatis-plus:\n  # 搜索指定包别名\n  typeAliasesPackage: cn.lenmotion.donut.**.po\n  # 配置mapper的扫描，找到所有的mapper.xml映射文件\n  mapperLocations: classpath*:mappers/**/*Mapper.xml\n  # 加载全局的配置文件\n  #  configLocation: classpath:mybatis/mybatis-config.xml\n  global-config:\n    db-config:\n      logic-delete-field: deleted\n    banner: false',
        'a9b708cd7aa9af6b615c28bfcd97a13a', '2024-02-28 09:37:29', '2024-02-28 09:37:29', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (13, 17, 'gateway-server.yml', 'DEFAULT_GROUP', '',
        '# springdoc-openapi项目配置\r\nspringdoc:\r\n  # 默认是false，需要设置为true\r\n  default-flat-param-object: true\r\n  swagger-ui:\r\n    path: /swagger-ui.html\r\n    tags-sorter: alpha\r\n    operations-sorter: alpha\r\n  api-docs:\r\n    path: /v3/api-docs\r\n# knife4j的增强配置，不需要增强可以不配\r\nknife4j:\r\n  enable: true\r\n  setting:\r\n    language: zh_cn',
        '0895488027758025c20b1103b36c14f5', '2024-02-28 17:28:45', '2024-02-28 17:28:45', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (13, 18, 'gateway-server.yml', 'DEFAULT_GROUP', '',
        '\n# knife4j的增强配置，不需要增强可以不配\nknife4j:\n  # 聚合swagger文档\n  gateway:\n    enabled: true\n    # 排序规则(tag/operation排序自4.2.0版本新增)\n    # 取值：alpha-默认排序规则，官方swagger-ui默认实现,order-Knife4j提供的增强排序规则，开发者可扩展x-order，根据数值来自定义排序\n    tags-sorter: order\n    operations-sorter: order\n     # 指定手动配置的模式(默认为该模式)\n    strategy: manual\n    routes:\n      - name: 用户服务\n        # 真实子服务访问url地址-提供OpenAPI的文档\n        url: /user-service/v2/api-docs?group=default\n        service-name: user-service\n        # 路由前缀\n        # 兼容OpenAPI3规范在聚合时丢失contextPath属性的异常情况，由开发者自己配置contextPath,Knife4j的前端Ui做兼容处理,与url属性独立不冲突，仅OpenAPI3规范聚合需要，OpenAPI2规范不需要设置此属性,默认为(apiPathPrefix)\n        context-path: /\n        order: 2\n      - name: 订单服务\n        url: /order-service/v2/api-docs?group=default\n        service-name: order-service\n        # 路由前缀\n        context-path: /\n        order: 3\n',
        '90bd4ff145bd05bf10ea0bcc84920791', '2024-02-29 11:34:45', '2024-02-29 11:34:45', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (13, 19, 'gateway-server.yml', 'DEFAULT_GROUP', '',
        '\n# knife4j的增强配置，不需要增强可以不配\nknife4j:\n  # 聚合swagger文档\n  gateway:\n    enabled: true\n    # 排序规则(tag/operation排序自4.2.0版本新增)\n    # 取值：alpha-默认排序规则，官方swagger-ui默认实现,order-Knife4j提供的增强排序规则，开发者可扩展x-order，根据数值来自定义排序\n    tags-sorter: order\n    operations-sorter: order\n     # 指定手动配置的模式(默认为该模式)\n    strategy: manual\n    routes:\n      - name: 用户服务\n        # 真实子服务访问url地址-提供OpenAPI的文档\n        url: /system-server/v3/api-docs?group=default\n        service-name: system-server\n        # 路由前缀\n        # 兼容OpenAPI3规范在聚合时丢失contextPath属性的异常情况，由开发者自己配置contextPath,Knife4j的前端Ui做兼容处理,与url属性独立不冲突，仅OpenAPI3规范聚合需要，OpenAPI2规范不需要设置此属性,默认为(apiPathPrefix)\n        context-path: /\n        order: 2\nspring:\n  cloud:\n    gateway:\n      routes:         # 网关路由配置\n        - id: system-server      # 路由id，自定义，只要唯一即可\n          uri: lb://system-server    # 路由的目标地址 lb是负载均衡，后面跟服务名称(推荐)\n          predicates:       # 路由断言，判断请求是否符合路由规则的条件\n            - Path=/system/**      # 按照路径匹配，以/user/开头的请求就符合要求\n',
        '8ef475c3f12712b46c8d0a3abba1cb37', '2024-02-29 11:37:49', '2024-02-29 11:37:49', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (2, 20, 'seataServer.properties', 'SEATA_GROUP', '',
        'store.mode=db\r\n#-----db-----\r\nstore.db.datasource=druid\r\nstore.db.dbType=mysql\r\n# 需要根据mysql的版本调整driverClassName\r\n# mysql8及以上版本对应的driver：com.mysql.cj.jdbc.Driver\r\n# mysql8以下版本的driver：com.mysql.jdbc.Driver\r\nstore.db.driverClassName=com.mysql.cj.jdbc.Driver\r\nstore.db.url=jdbc:mysql://donut-cloud-mysql8:3306/seata-server?useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&useSSL=false\r\nstore.db.user=root\r\nstore.db.password=root@123,./\r\n# 数据库初始连接数\r\nstore.db.minConn=1\r\n# 数据库最大连接数\r\nstore.db.maxConn=20\r\n# 获取连接时最大等待时间 默认5000，单位毫秒\r\nstore.db.maxWait=5000\r\n# 全局事务表名 默认global_table\r\nstore.db.globalTable=global_table\r\n# 分支事务表名 默认branch_table\r\nstore.db.branchTable=branch_table\r\n# 全局锁表名 默认lock_table\r\nstore.db.lockTable=lock_table\r\n# 查询全局事务一次的最大条数 默认100\r\nstore.db.queryLimit=100\r\n\r\n\r\n# undo保留天数 默认7天,log_status=1（附录3）和未正常清理的undo\r\nserver.undo.logSaveDays=7\r\n# undo清理线程间隔时间 默认86400000，单位毫秒\r\nserver.undo.logDeletePeriod=86400000\r\n# 二阶段提交重试超时时长 单位ms,s,m,h,d,对应毫秒,秒,分,小时,天,默认毫秒。默认值-1表示无限重试\r\n# 公式: timeout>=now-globalTransactionBeginTime,true表示超时则不再重试\r\n# 注: 达到超时时间后将不会做任何重试,有数据不一致风险,除非业务自行可校准数据,否者慎用\r\nserver.maxCommitRetryTimeout=-1\r\n# 二阶段回滚重试超时时长\r\nserver.maxRollbackRetryTimeout=-1\r\n# 二阶段提交未完成状态全局事务重试提交线程间隔时间 默认1000，单位毫秒\r\nserver.recovery.committingRetryPeriod=1000\r\n# 二阶段异步提交状态重试提交线程间隔时间 默认1000，单位毫秒\r\nserver.recovery.asynCommittingRetryPeriod=1000\r\n# 二阶段回滚状态重试回滚线程间隔时间  默认1000，单位毫秒\r\nserver.recovery.rollbackingRetryPeriod=1000\r\n# 超时状态检测重试线程间隔时间 默认1000，单位毫秒，检测出超时将全局事务置入回滚会话管理器\r\nserver.recovery.timeoutRetryPeriod=1000',
        '752f574628ce16ff456c5939367c5be5', '2024-03-04 09:00:46', '2024-03-04 09:00:46', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (3, 21, 'p6spy.properties', 'DEFAULT_GROUP', '',
        '# 自定义日志打印\r\nmodulelist=com.baomidou.mybatisplus.extension.p6spy.MybatisPlusLogFactory,com.p6spy.engine.outage.P6OutageFactory\r\n# 自定义日志打印\r\nlogMessageFormat=cn.lenmotion.donut.common.starter.config.P6spySqlFormatConfig\r\n# 使用日志系统记录sql\r\nappender=com.p6spy.engine.spy.appender.Slf4JLogger\r\n# 设置使用p6spy driver来做代理\r\nderegisterdrivers=true\r\n# 取消JDBC URL前缀\r\nuseprefix=true\r\n# 显示指定过滤 Log 时排队的分类列表，取值: error,info,batch,debug,statement,commit,rollback,result,resultset.\r\nexcludecategories=info,debug,result,commit,resultset\r\n# 日期格式\r\ndateformat=yyyy-MM-dd HH:mm:ss\r\n# 是否开启慢SQL记录\r\noutagedetection=true\r\n# 慢SQL记录标准 秒\r\noutagedetectioninterval=2\r\n\r\n',
        '6488961b213809cf8f849aa8526fdcb1', '2024-03-04 09:00:46', '2024-03-04 09:00:46', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (4, 22, 'base-datasource.yml', 'DEFAULT_GROUP', '',
        'spring:\r\n  datasource:\r\n    type: com.alibaba.druid.pool.DruidDataSource\r\n    driver-class-name: com.p6spy.engine.spy.P6SpyDriver\r\n    druid:\r\n      initial-size: 5\r\n      min-idle: 5\r\n      max-active: 20\r\n      max-wait: 60000\r\n      test-while-idle: true\r\n      time-between-eviction-runs-millis: 60000\r\n      min-evictable-idle-time-millis: 30000\r\n      validation-query: select \'x\'\r\n      test-on-borrow: false\r\n      test-on-return: false\r\n      pool-prepared-statements: false\r\n      max-pool-prepared-statement-per-connection-size: -1\r\n      use-global-data-source-stat: true\r\n      web-stat-filter:\r\n        enabled: true\r\n        url-pattern: /*\r\n        exclusions: /druid/*,*.js,*.gif,*.jpg,*.png,*.css,*.ico\r\n      stat-view-servlet:\r\n        enabled: true\r\n        url-pattern: /druid/*\r\n        reset-enable: false\r\n        login-username: druid\r\n        login-password: druid\r\n        allow: 127.0.0.1',
        'c16021e245a550ccc8c09baa59134ab4', '2024-03-04 09:00:46', '2024-03-04 09:00:47', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (5, 23, 'system-server.yml', 'DEFAULT_GROUP', '',
        'spring:\r\n  datasource:\r\n    url: jdbc:p6spy:mysql://localhost:13360/donut-system?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n    username: root\r\n    password: root@123,./',
        '37a9bf5b6eeb9054457daee5a105c7f2', '2024-03-04 09:00:46', '2024-03-04 09:00:47', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (6, 24, 'base-redis.yml', 'DEFAULT_GROUP', '',
        'spring:\n  data:\n    # redis 配置\n    redis:\n      # 地址\n      host: localhost\n      # 端口，默认为6379\n      port: 6379\n      # 数据库索引\n      database: 5\n      # 密码\n      password: 123456\n      # 连接超时时间\n      timeout: 15000\n      lettuce:\n        pool:\n          # 连接池中的最小空闲连接\n          min-idle: 0\n          # 连接池中的最大空闲连接\n          max-idle: 10\n          # 连接池的最大数据库连接数\n          max-active: 20\n          # #连接池最大阻塞等待时间（使用负值表示没有限制）\n          max-wait: -1ms',
        '4946062846c2d8be9f6d63da89f20dbc', '2024-03-04 09:00:46', '2024-03-04 09:00:47', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (8, 25, 'base-config.yml', 'DEFAULT_GROUP', '',
        'spring:\n  boot:\n    admin:\n      client:\n        instance:\n          service-url: http://127.0.0.1:${server.port}/\n        url: http://127.0.0.1:13102\n \nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: ALWAYS\n      \n# MyBatis Plus配置\nmybatis-plus:\n  # 搜索指定包别名\n  typeAliasesPackage: cn.lenmotion.donut.**.po\n  # 配置mapper的扫描，找到所有的mapper.xml映射文件\n  mapperLocations: classpath*:mappers/**/*Mapper.xml\n  # 加载全局的配置文件\n  #  configLocation: classpath:mybatis/mybatis-config.xml\n  global-config:\n    db-config:\n      logic-delete-field: deleted\n    banner: false\n\nlogging:\n  pattern:\n    console: \'%clr(%d{yyyy-MM-dd HH:mm:ss.SSS}){faint} %clr(${LOG_LEVEL_PATTERN:-%5p}) %clr(${PID:- }){magenta} %clr(-){faint} %clr([%t]){faint} %clr(%logger{39}){cyan} %clr([%L]){magenta} %clr(:){faint} %m%n\'\n  file:\n    path: ./logs',
        'ce61bdd22587d254c3d8c04f9810b1bc', '2024-03-04 09:00:47', '2024-03-04 09:00:47', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (13, 26, 'gateway-server.yml', 'DEFAULT_GROUP', '',
        '\n# knife4j的增强配置，不需要增强可以不配\nknife4j:\n  # 聚合swagger文档\n  gateway:\n    enabled: true\n    # 排序规则(tag/operation排序自4.2.0版本新增)\n    # 取值：alpha-默认排序规则，官方swagger-ui默认实现,order-Knife4j提供的增强排序规则，开发者可扩展x-order，根据数值来自定义排序\n    tags-sorter: order\n    operations-sorter: order\n     # 指定手动配置的模式(默认为该模式)\n    strategy: manual\n    routes:\n      - name: 用户服务\n        # 真实子服务访问url地址-提供OpenAPI的文档\n        url: /system/v3/api-docs?group=default\n        service-name: system-server\n        # 路由前缀\n        # 兼容OpenAPI3规范在聚合时丢失contextPath属性的异常情况，由开发者自己配置contextPath,Knife4j的前端Ui做兼容处理,与url属性独立不冲突，仅OpenAPI3规范聚合需要，OpenAPI2规范不需要设置此属性,默认为(apiPathPrefix)\n        context-path: /\n        order: 2\nspring:\n  cloud:\n    gateway:\n      routes:         # 网关路由配置\n        - id: system-server      # 路由id，自定义，只要唯一即可\n          uri: lb://system-server    # 路由的目标地址 lb是负载均衡，后面跟服务名称(推荐)\n          predicates:       # 路由断言，判断请求是否符合路由规则的条件\n            - Path=/system/**      # 按照路径匹配，以/user/开头的请求就符合要求\n',
        '85c61bb9323b0ea9b39e76aa6e644eda', '2024-03-04 09:00:47', '2024-03-04 09:00:48', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (0, 27, 'base-easy-trans.yml', 'DEFAULT_GROUP', '',
        'easy-trans:\n   #启用redis缓存 如果不用redis请设置为false\n   is-enable-redis: true\n   #启用全局翻译(拦截所有responseBody进行自动翻译)，如果关闭需要手动调用翻译方法或者方法加注解，具体看文档\n   is-enable-global: true \n   #启用平铺模式\n   is-enable-tile: true\n   #字典缓存放到redis 微服务模式请开启\n   dict-use-redis: true \n   # MP为 3.5.3.2版本以上的3.x 版本请设置为true，否则可能会出现找不到对应方法的问题\n   mp-new: true',
        '13c1bc1713018c1301574bb4fd55e8ed', '2024-03-04 09:00:47', '2024-03-04 09:00:48', NULL, '172.25.0.1', 'I',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (0, 28, 'base-sa-token.yml', 'DEFAULT_GROUP', '',
        '############## Sa-Token 配置 (文档: https://sa-token.cc) ##############\nsa-token:\n  # token 名称（同时也是 cookie 名称）\n  token-name: Authorization\n  # token 有效期（单位：秒） 默认1天，-1 代表永久有效\n  timeout: 43200\n  # token 最低活跃频率（单位：秒），如果 token 超过此时间没有访问系统就会被冻结，默认1小时 代表不限制，永不冻结\n  active-timeout: 3600\n  # 是否允许同一账号多地同时登录 （为 true 时允许一起登录, 为 false 时新登录挤掉旧登录）\n  is-concurrent: true\n  # 在多人登录同一账号时，是否共用一个 token （为 true 时所有登录共用一个 token, 为 false 时每次登录新建一个 token）\n  is-share: false\n  # token 风格（默认可取值：uuid、simple-uuid、random-32、random-64、random-128、tik）\n  token-style: random-64\n  # 是否输出操作日志\n  is-log: true\n  # 不从cookie读取token\n  is-read-cookie: false\n  # token的前缀\n  token-prefix: Bearer\n  # 不打印sa-token的图标\n  is-print: false',
        'a9262b45e456bc825d1c7033a4a8af56', '2024-03-04 09:00:47', '2024-03-04 09:00:48', NULL, '172.25.0.1', 'I',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (0, 29, 'nacos-logback.xml', 'DEFAULT_GROUP', '',
        '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<configuration scan=\"true\" scanPeriod=\"60 seconds\" debug=\"false\">\n    <!-- 定义彩色输出 -->\n    <conversionRule conversionWord=\"clr\" converterClass=\"org.springframework.boot.logging.logback.ColorConverter\" />\n    <!-- 引入 Spring Boot 配置属性 -->\n    <springProperty scope=\"context\" name=\"LOG_CONTEXT_NAME\" source=\"spring.application.name\"/>\n    <!--定义日志文件的存储地址 勿在LogBack的配置中使用相对路径-->\n    <property name=\"LOG_HOME\" value=\"logs/${LOG_CONTEXT_NAME}\"/>\n    <!-- 定义日志上下文的名称 -->\n<!--    <contextName>${LOG_CONTEXT_NAME}</contextName>-->\n\n    <!-- 日志的显式格式 -->\n    <property name=\"log.pattern\" value=\"%clr(%d{yyyy-MM-dd HH:mm:ss.SSS}){faint} %clr(${LOG_LEVEL_PATTERN:-%5p}) %clr(${PID:- }){magenta} %clr(-){faint} %clr([%t]){faint} %clr(%logger{39}){cyan} %clr([%L]){magenta} %clr(:){faint} %m%n\" />\n\n    <!-- 控制台输出 -->\n    <appender name=\"console\" class=\"ch.qos.logback.core.ConsoleAppender\">\n        <encoder class=\"ch.qos.logback.classic.encoder.PatternLayoutEncoder\">\n            <!--格式化输出：%d表示日期，%thread表示线程名，%-5level：级别从左显示5个字符宽度%msg：日志消息，%n是换行符-->\n            <pattern>${log.pattern}</pattern>\n            <charset>utf-8</charset>\n        </encoder>\n        <filter class=\"ch.qos.logback.classic.filter.ThresholdFilter\">\n            <level>INFO</level>\n        </filter>\n    </appender>\n\n    <!--info日志统一输出-->\n    <appender name=\"file.info\" class=\"ch.qos.logback.core.rolling.RollingFileAppender\">\n        <Prudent>true</Prudent>\n        <rollingPolicy class=\"ch.qos.logback.core.rolling.TimeBasedRollingPolicy\">\n            <!--日志文件输出的文件名，按小时生成-->\n            <FileNamePattern>${LOG_HOME}/%d{yyyy-MM-dd}/info/info.%d{yyyy-MM-dd-HH}.%i.log</FileNamePattern>\n            <!--日志文件输出的文件名，按天生成-->\n            <!--<FileNamePattern>${LOG_HOME}/%d{yyyy-MM-dd}/error/error.%d{yyyy-MM-dd}.%i.log</FileNamePattern>-->\n            <!--日志文件保留天数-->\n            <MaxHistory>30</MaxHistory>\n            <timeBasedFileNamingAndTriggeringPolicy class=\"ch.qos.logback.core.rolling.SizeAndTimeBasedFNATP\">\n                <!-- 除按日志记录之外，还配置了日志文件不能超过10M(默认)，若超过10M，日志文件会以索引0开始 -->\n                <maxFileSize>10MB</maxFileSize>\n            </timeBasedFileNamingAndTriggeringPolicy>\n        </rollingPolicy>\n        <encoder class=\"ch.qos.logback.classic.encoder.PatternLayoutEncoder\">\n            <!--格式化输出：%d表示日期，%thread表示线程名，%-5level：级别从左显示5个字符宽度 %method 方法名  %L 行数 %msg：日志消息，%n是换行符-->\n            <pattern>${log.pattern}</pattern>\n            <charset>utf-8</charset>\n        </encoder>\n        <!-- 此日志文件只记录info级别的 -->\n        <filter class=\"ch.qos.logback.classic.filter.LevelFilter\">\n            <level>INFO</level>\n            <onMatch>ACCEPT</onMatch>\n            <onMismatch>DENY</onMismatch>\n        </filter>\n    </appender>\n\n\n    <!--错误日志统一输出-->\n    <appender name=\"file.error\" class=\"ch.qos.logback.core.rolling.RollingFileAppender\">\n        <!--省略,参考file.info appender-->\n        <filter class=\"ch.qos.logback.classic.filter.LevelFilter\">\n            <level>ERROR</level>\n            <onMatch>ACCEPT</onMatch>\n            <onMismatch>DENY</onMismatch>\n        </filter>\n    </appender>\n\n    <!--warn日志统一输出-->\n    <appender name=\"file.warn\" class=\"ch.qos.logback.core.rolling.RollingFileAppender\">\n        <!--省略,参考file.info appender-->\n        <filter class=\"ch.qos.logback.classic.filter.LevelFilter\">\n            <level>WARN</level>\n            <onMatch>ACCEPT</onMatch>\n            <onMismatch>DENY</onMismatch>\n        </filter>\n    </appender>\n\n    <!--  日志输出级别 -->\n    <root level=\"debug\">\n        <appender-ref ref=\"console\"/>\n        <appender-ref ref=\"file.error\"/>\n        <appender-ref ref=\"file.info\"/>\n        <appender-ref ref=\"file.warn\"/>\n    </root>\n</configuration>\n',
        '1bcd18d53c29ef81edf6485b8916411e', '2024-03-04 09:00:47', '2024-03-04 09:00:48', NULL, '172.25.0.1', 'I',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (13, 30, 'gateway-server.yml', 'DEFAULT_GROUP', '',
        '\n# knife4j的增强配置，不需要增强可以不配\nknife4j:\n  # 聚合swagger文档\n  gateway:\n    enabled: true\n    # 排序规则(tag/operation排序自4.2.0版本新增)\n    # 取值：alpha-默认排序规则，官方swagger-ui默认实现,order-Knife4j提供的增强排序规则，开发者可扩展x-order，根据数值来自定义排序\n    tags-sorter: order\n    operations-sorter: order\n     # 指定手动配置的模式(默认为该模式)\n    strategy: manual\n    routes:\n      - name: 用户服务\n        # 真实子服务访问url地址-提供OpenAPI的文档\n        url: /user-service/v2/api-docs?group=default\n        service-name: user-service\n        # 路由前缀\n        # 兼容OpenAPI3规范在聚合时丢失contextPath属性的异常情况，由开发者自己配置contextPath,Knife4j的前端Ui做兼容处理,与url属性独立不冲突，仅OpenAPI3规范聚合需要，OpenAPI2规范不需要设置此属性,默认为(apiPathPrefix)\n        context-path: /\n        order: 2\n      - name: 订单服务\n        url: /order-service/v2/api-docs?group=default\n        service-name: order-service\n        # 路由前缀\n        context-path: /\n        order: 3\n',
        '90bd4ff145bd05bf10ea0bcc84920791', '2024-03-04 09:02:10', '2024-03-04 09:02:10', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (13, 31, 'gateway-server.yml', 'DEFAULT_GROUP', '',
        '\n# knife4j的增强配置，不需要增强可以不配\nknife4j:\n  # 聚合swagger文档\n  gateway:\n    enabled: true\n  # 排序规则(tag/operation排序自4.2.0版本新增)\n  # 取值：alpha-默认排序规则，官方swagger-ui默认实现,order-Knife4j提供的增强排序规则，开发者可扩展x-order，根据数值来自定义排序\n  tags-sorter: order\n  operations-sorter: order\n  # 指定手动配置的模式(默认为该模式)\n  strategy: manual\n  routes:\n    - name: 用户服务\n      # 真实子服务访问url地址-提供OpenAPI的文档\n      url: /system/v3/api-docs?group=default\n      service-name: system-server\n      # 路由前缀\n      # 兼容OpenAPI3规范在聚合时丢失contextPath属性的异常情况，由开发者自己配置contextPath,Knife4j的前端Ui做兼容处理,与url属性独立不冲突，仅OpenAPI3规范聚合需要，OpenAPI2规范不需要设置此属性,默认为(apiPathPrefix)\n      context-path: /\n      order: 2\nspring:\n  cloud:\n    gateway:\n    routes: # 网关路由配置\n      - id: system-server # 路由id，自定义，只要唯一即可\n        uri: lb://system-server # 路由的目标地址 lb是负载均衡，后面跟服务名称(推荐)\n        predicates: # 路由断言，判断请求是否符合路由规则的条件\n          - Path=/system/** # 按照路径匹配，以/user/开头的请求就符合要求\n\n',
        '8a322c9674f614c966facdc98256c1e1', '2024-03-04 09:03:35', '2024-03-04 09:03:36', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (13, 32, 'gateway-server.yml', 'DEFAULT_GROUP', '',
        '\n# knife4j的增强配置，不需要增强可以不配\nknife4j:\n  # 聚合swagger文档\n  gateway:\n    enabled: true\n    # 排序规则(tag/operation排序自4.2.0版本新增)\n    # 取值：alpha-默认排序规则，官方swagger-ui默认实现,order-Knife4j提供的增强排序规则，开发者可扩展x-order，根据数值来自定义排序\n    tags-sorter: order\n    operations-sorter: order\n    # 指定手动配置的模式(默认为该模式)\n    strategy: manual\n    routes:\n      - name: 用户服务\n        # 真实子服务访问url地址-提供OpenAPI的文档\n        url: /system/v3/api-docs?group=default\n        service-name: system-server\n        # 路由前缀\n        # 兼容OpenAPI3规范在聚合时丢失contextPath属性的异常情况，由开发者自己配置contextPath,Knife4j的前端Ui做兼容处理,与url属性独立不冲突，仅OpenAPI3规范聚合需要，OpenAPI2规范不需要设置此属性,默认为(apiPathPrefix)\n        context-path: /\n        order: 2\nspring:\n  cloud:\n    gateway:\n      routes: # 网关路由配置\n        - id: system-server # 路由id，自定义，只要唯一即可\n          uri: lb://system-server # 路由的目标地址 lb是负载均衡，后面跟服务名称(推荐)\n          predicates: # 路由断言，判断请求是否符合路由规则的条件\n            - Path=/system/** # 按照路径匹配，以/user/开头的请求就符合要求\n\n',
        '52272789b4310761441aa73e3b875fcc', '2024-03-04 09:05:23', '2024-03-04 09:05:24', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (13, 33, 'gateway-server.yml', 'DEFAULT_GROUP', '',
        '\n# knife4j的增强配置，不需要增强可以不配\nknife4j:\n  # 聚合swagger文档\n  gateway:\n    enabled: true\n    # 排序规则(tag/operation排序自4.2.0版本新增)\n    # 取值：alpha-默认排序规则，官方swagger-ui默认实现,order-Knife4j提供的增强排序规则，开发者可扩展x-order，根据数值来自定义排序\n    tags-sorter: order\n    operations-sorter: order\n    # 指定手动配置的模式(默认为该模式)\n    strategy: manual\n    routes:\n      - name: 授权服务\n        # 真实子服务访问url地址-提供OpenAPI的文档\n        url: /auth/v3/api-docs?group=default\n        service-name: auth-server\n        # 路由前缀\n        # 兼容OpenAPI3规范在聚合时丢失contextPath属性的异常情况，由开发者自己配置contextPath,Knife4j的前端Ui做兼容处理,与url属性独立不冲突，仅OpenAPI3规范聚合需要，OpenAPI2规范不需要设置此属性,默认为(apiPathPrefix)\n        context-path: /\n        order: 1\n      - name: 用户服务\n        # 真实子服务访问url地址-提供OpenAPI的文档\n        url: /system/v3/api-docs?group=default\n        service-name: system-server\n        # 路由前缀\n        # 兼容OpenAPI3规范在聚合时丢失contextPath属性的异常情况，由开发者自己配置contextPath,Knife4j的前端Ui做兼容处理,与url属性独立不冲突，仅OpenAPI3规范聚合需要，OpenAPI2规范不需要设置此属性,默认为(apiPathPrefix)\n        context-path: /\n        order: 2\nspring:\n  cloud:\n    gateway:\n      routes: # 网关路由配置\n        - id: system-server # 路由id，自定义，只要唯一即可\n          uri: lb://system-server # 路由的目标地址 lb是负载均衡，后面跟服务名称(推荐)\n          predicates: # 路由断言，判断请求是否符合路由规则的条件\n            - Path=/system/** # 按照路径匹配，以/user/开头的请求就符合要求\n        - id: auth-server # 路由id，自定义，只要唯一即可\n          uri: lb://auth-server # 路由的目标地址 lb是负载均衡，后面跟服务名称(推荐)\n          predicates: # 路由断言，判断请求是否符合路由规则的条件\n            - Path=/auth/** # 按照路径匹配，以/user/开头的请求就符合要求\n\n',
        '9b58afcba74301460cdee447c19dd60c', '2024-03-04 09:07:07', '2024-03-04 09:07:07', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (13, 34, 'gateway-server.yml', 'DEFAULT_GROUP', '',
        '\n# knife4j的增强配置，不需要增强可以不配\nknife4j:\n  # 聚合swagger文档\n  gateway:\n    enabled: true\n    # 排序规则(tag/operation排序自4.2.0版本新增)\n    # 取值：alpha-默认排序规则，官方swagger-ui默认实现,order-Knife4j提供的增强排序规则，开发者可扩展x-order，根据数值来自定义排序\n    tags-sorter: order\n    operations-sorter: order\n    # 指定手动配置的模式(默认为该模式)\n    strategy: manual\n    routes:\n      - name: 授权服务\n        # 真实子服务访问url地址-提供OpenAPI的文档\n        url: /auth/v3/api-docs?group=default\n        service-name: auth-server\n        # 路由前缀\n        # 兼容OpenAPI3规范在聚合时丢失contextPath属性的异常情况，由开发者自己配置contextPath,Knife4j的前端Ui做兼容处理,与url属性独立不冲突，仅OpenAPI3规范聚合需要，OpenAPI2规范不需要设置此属性,默认为(apiPathPrefix)\n        context-path: /\n        order: 1\n      - name: 用户服务\n        # 真实子服务访问url地址-提供OpenAPI的文档\n        url: /system/v3/api-docs?group=default\n        service-name: system-server\n        # 路由前缀\n        # 兼容OpenAPI3规范在聚合时丢失contextPath属性的异常情况，由开发者自己配置contextPath,Knife4j的前端Ui做兼容处理,与url属性独立不冲突，仅OpenAPI3规范聚合需要，OpenAPI2规范不需要设置此属性,默认为(apiPathPrefix)\n        context-path: /\n        order: 2\nspring:\n  cloud:\n    gateway:\n      routes: # 网关路由配置\n        - id: system-server # 路由id，自定义，只要唯一即可\n          uri: lb://system-server # 路由的目标地址 lb是负载均衡，后面跟服务名称(推荐)\n          predicates: # 路由断言，判断请求是否符合路由规则的条件\n            - Path=/system/** # 按照路径匹配，以/user/开头的请求就符合要求\n        - id: auth-server # 路由id，自定义，只要唯一即可\n          uri: lb://auth-server # 路由的目标地址 lb是负载均衡，后面跟服务名称(推荐)\n          predicates: # 路由断言，判断请求是否符合路由规则的条件\n            - Path=/auth/** # 按照路径匹配，以/user/开头的请求就符合要求\n            - Path=/auth/** # 按照路径匹配，以/user/开头的请求就符合要求\n\n',
        'd61b9fefc0d9874226411b3101a0281b', '2024-03-04 09:19:21', '2024-03-04 09:19:21', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (13, 35, 'gateway-server.yml', 'DEFAULT_GROUP', '',
        '\n# knife4j的增强配置，不需要增强可以不配\nknife4j:\n  # 聚合swagger文档\n  gateway:\n    enabled: true\n    # 排序规则(tag/operation排序自4.2.0版本新增)\n    # 取值：alpha-默认排序规则，官方swagger-ui默认实现,order-Knife4j提供的增强排序规则，开发者可扩展x-order，根据数值来自定义排序\n    tags-sorter: order\n    operations-sorter: order\n    # 指定手动配置的模式(默认为该模式)\n    strategy: manual\n    routes:\n      - name: 授权服务\n        # 真实子服务访问url地址-提供OpenAPI的文档\n        url: /auth/v3/api-docs?group=default\n        service-name: auth-server\n        # 路由前缀\n        # 兼容OpenAPI3规范在聚合时丢失contextPath属性的异常情况，由开发者自己配置contextPath,Knife4j的前端Ui做兼容处理,与url属性独立不冲突，仅OpenAPI3规范聚合需要，OpenAPI2规范不需要设置此属性,默认为(apiPathPrefix)\n        context-path: /auth\n        order: 1\n      - name: 用户服务\n        # 真实子服务访问url地址-提供OpenAPI的文档\n        url: /system/v3/api-docs?group=default\n        service-name: system-server\n        # 路由前缀\n        # 兼容OpenAPI3规范在聚合时丢失contextPath属性的异常情况，由开发者自己配置contextPath,Knife4j的前端Ui做兼容处理,与url属性独立不冲突，仅OpenAPI3规范聚合需要，OpenAPI2规范不需要设置此属性,默认为(apiPathPrefix)\n        context-path: /\n        order: 2\nspring:\n  cloud:\n    gateway:\n      routes: # 网关路由配置\n        - id: system-server # 路由id，自定义，只要唯一即可\n          uri: lb://system-server # 路由的目标地址 lb是负载均衡，后面跟服务名称(推荐)\n          predicates: # 路由断言，判断请求是否符合路由规则的条件\n            - Path=/system/** # 按照路径匹配，以/user/开头的请求就符合要求\n        - id: auth-server # 路由id，自定义，只要唯一即可\n          uri: lb://auth-server # 路由的目标地址 lb是负载均衡，后面跟服务名称(推荐)\n          predicates: # 路由断言，判断请求是否符合路由规则的条件\n            - Path=/auth/** # 按照路径匹配，以/user/开头的请求就符合要求\n            - Path=/auth/** # 按照路径匹配，以/user/开头的请求就符合要求\n\n',
        '49ba06b77bf34d3f28a5297a662ae6ea', '2024-03-04 13:20:50', '2024-03-04 13:20:50', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (13, 36, 'gateway-server.yml', 'DEFAULT_GROUP', '',
        '\n# knife4j的增强配置，不需要增强可以不配\nknife4j:\n  # 聚合swagger文档\n  gateway:\n    enabled: true\n    # 排序规则(tag/operation排序自4.2.0版本新增)\n    # 取值：alpha-默认排序规则，官方swagger-ui默认实现,order-Knife4j提供的增强排序规则，开发者可扩展x-order，根据数值来自定义排序\n    tags-sorter: order\n    operations-sorter: order\n    # 指定手动配置的模式(默认为该模式)\n    strategy: manual\n    routes:\n      - name: 授权服务\n        # 真实子服务访问url地址-提供OpenAPI的文档\n        url: /auth/v3/api-docs?group=default\n        service-name: auth-server\n        # 路由前缀\n        # 兼容OpenAPI3规范在聚合时丢失contextPath属性的异常情况，由开发者自己配置contextPath,Knife4j的前端Ui做兼容处理,与url属性独立不冲突，仅OpenAPI3规范聚合需要，OpenAPI2规范不需要设置此属性,默认为(apiPathPrefix)\n        context-path: /auth\n        order: 1\n      - name: 用户服务\n        # 真实子服务访问url地址-提供OpenAPI的文档\n        url: /system/v3/api-docs?group=default\n        service-name: system-server\n        # 路由前缀\n        # 兼容OpenAPI3规范在聚合时丢失contextPath属性的异常情况，由开发者自己配置contextPath,Knife4j的前端Ui做兼容处理,与url属性独立不冲突，仅OpenAPI3规范聚合需要，OpenAPI2规范不需要设置此属性,默认为(apiPathPrefix)\n        context-path: /\n        order: 2\nspring:\n  cloud:\n    gateway:\n      routes: # 网关路由配置\n        - id: system-server # 路由id，自定义，只要唯一即可\n          uri: lb://system-server # 路由的目标地址 lb是负载均衡，后面跟服务名称(推荐)\n          predicates: # 路由断言，判断请求是否符合路由规则的条件\n            - Path=/system/** # 按照路径匹配，以/user/开头的请求就符合要求\n        - id: auth-server # 路由id，自定义，只要唯一即可\n          uri: lb://auth-server # 路由的目标地址 lb是负载均衡，后面跟服务名称(推荐)\n          predicates: # 路由断言，判断请求是否符合路由规则的条件\n            - Path=/auth/** # 按照路径匹配，以/user/开头的请求就符合要求\n            - Path=/auth/** # 按照路径匹配，以/user/开头的请求就符合要求\n          filters:\n            - ExceptionHandlingFilter\n\n',
        'd985e84863d1bf4d857e4ad0d25e3fbb', '2024-03-04 13:22:40', '2024-03-04 13:22:41', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (28, 37, 'nacos-logback.xml', 'DEFAULT_GROUP', '',
        '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<configuration scan=\"true\" scanPeriod=\"60 seconds\" debug=\"false\">\n    <!-- 定义彩色输出 -->\n    <conversionRule conversionWord=\"clr\" converterClass=\"org.springframework.boot.logging.logback.ColorConverter\" />\n    <!-- 引入 Spring Boot 配置属性 -->\n    <springProperty scope=\"context\" name=\"LOG_CONTEXT_NAME\" source=\"spring.application.name\"/>\n    <!--定义日志文件的存储地址 勿在LogBack的配置中使用相对路径-->\n    <property name=\"LOG_HOME\" value=\"logs/${LOG_CONTEXT_NAME}\"/>\n    <!-- 定义日志上下文的名称 -->\n<!--    <contextName>${LOG_CONTEXT_NAME}</contextName>-->\n\n    <!-- 日志的显式格式 -->\n    <property name=\"log.pattern\" value=\"%clr(%d{yyyy-MM-dd HH:mm:ss.SSS}){faint} %clr(${LOG_LEVEL_PATTERN:-%5p}) %clr(${PID:- }){magenta} %clr(-){faint} %clr([%t]){faint} %clr(%logger{39}){cyan} %clr([%L]){magenta} %clr(:){faint} %m%n\" />\n\n    <!-- 控制台输出 -->\n    <appender name=\"console\" class=\"ch.qos.logback.core.ConsoleAppender\">\n        <encoder class=\"ch.qos.logback.classic.encoder.PatternLayoutEncoder\">\n            <!--格式化输出：%d表示日期，%thread表示线程名，%-5level：级别从左显示5个字符宽度%msg：日志消息，%n是换行符-->\n            <pattern>${log.pattern}</pattern>\n            <charset>utf-8</charset>\n        </encoder>\n        <filter class=\"ch.qos.logback.classic.filter.ThresholdFilter\">\n            <level>INFO</level>\n        </filter>\n    </appender>\n\n    <!--info日志统一输出-->\n    <appender name=\"file.info\" class=\"ch.qos.logback.core.rolling.RollingFileAppender\">\n        <Prudent>true</Prudent>\n        <rollingPolicy class=\"ch.qos.logback.core.rolling.TimeBasedRollingPolicy\">\n            <!--日志文件输出的文件名，按小时生成-->\n            <FileNamePattern>${LOG_HOME}/%d{yyyy-MM-dd}/info/info.%d{yyyy-MM-dd-HH}.%i.log</FileNamePattern>\n            <!--日志文件输出的文件名，按天生成-->\n            <!--<FileNamePattern>${LOG_HOME}/%d{yyyy-MM-dd}/error/error.%d{yyyy-MM-dd}.%i.log</FileNamePattern>-->\n            <!--日志文件保留天数-->\n            <MaxHistory>30</MaxHistory>\n            <timeBasedFileNamingAndTriggeringPolicy class=\"ch.qos.logback.core.rolling.SizeAndTimeBasedFNATP\">\n                <!-- 除按日志记录之外，还配置了日志文件不能超过10M(默认)，若超过10M，日志文件会以索引0开始 -->\n                <maxFileSize>10MB</maxFileSize>\n            </timeBasedFileNamingAndTriggeringPolicy>\n        </rollingPolicy>\n        <encoder class=\"ch.qos.logback.classic.encoder.PatternLayoutEncoder\">\n            <!--格式化输出：%d表示日期，%thread表示线程名，%-5level：级别从左显示5个字符宽度 %method 方法名  %L 行数 %msg：日志消息，%n是换行符-->\n            <pattern>${log.pattern}</pattern>\n            <charset>utf-8</charset>\n        </encoder>\n        <!-- 此日志文件只记录info级别的 -->\n        <filter class=\"ch.qos.logback.classic.filter.LevelFilter\">\n            <level>INFO</level>\n            <onMatch>ACCEPT</onMatch>\n            <onMismatch>DENY</onMismatch>\n        </filter>\n    </appender>\n\n\n    <!--错误日志统一输出-->\n    <appender name=\"file.error\" class=\"ch.qos.logback.core.rolling.RollingFileAppender\">\n        <!--省略,参考file.info appender-->\n        <filter class=\"ch.qos.logback.classic.filter.LevelFilter\">\n            <level>ERROR</level>\n            <onMatch>ACCEPT</onMatch>\n            <onMismatch>DENY</onMismatch>\n        </filter>\n    </appender>\n\n    <!--warn日志统一输出-->\n    <appender name=\"file.warn\" class=\"ch.qos.logback.core.rolling.RollingFileAppender\">\n        <!--省略,参考file.info appender-->\n        <filter class=\"ch.qos.logback.classic.filter.LevelFilter\">\n            <level>WARN</level>\n            <onMatch>ACCEPT</onMatch>\n            <onMismatch>DENY</onMismatch>\n        </filter>\n    </appender>\n\n    <!--  日志输出级别 -->\n    <root level=\"debug\">\n        <appender-ref ref=\"console\"/>\n        <appender-ref ref=\"file.error\"/>\n        <appender-ref ref=\"file.info\"/>\n        <appender-ref ref=\"file.warn\"/>\n    </root>\n</configuration>\n',
        '1bcd18d53c29ef81edf6485b8916411e', '2024-03-04 16:21:54', '2024-03-04 16:21:54', NULL, '172.25.0.1', 'D',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (0, 38, 'file-storage-server.yml', 'DEFAULT_GROUP', '',
        'dromara:\r\n  x-file-storage: #文件存储配置\r\n    default-platform: minio-1 #默认使用的存储平台\r\n    local-plus:\r\n      - platform: local-plus-1 # 存储平台标识\r\n        enable-storage: true  #启用存储\r\n        enable-access: true #启用访问（线上请使用 Nginx 配置，效率更高）\r\n        domain: http://localhost:8080/upload/file/ # 访问域名，例如：“http://127.0.0.1:8030/local-plus/”，注意后面要和 path-patterns 保持一致，“/”结尾，本地存储建议使用相对路径，方便后期更换域名\r\n        base-path: local-plus/ # 基础路径\r\n        path-patterns: /upload/file/** # 访问路径\r\n        storage-path: upload/ # 存储路径\r\n    minio:\r\n      - platform: minio-1 # 存储平台标识\r\n        enable-storage: true  # 启用存储\r\n        access-key: admin\r\n        secret-key: 123456qwe\r\n        end-point: http://127.0.0.1:9000\r\n        bucket-name: donut\r\n        domain: http://localhost:9000/ # 访问域名，注意“/”结尾，例如：http://minio.abc.com/abc/\r\n        attr:\r\n          expire: 30',
        '6a74ab355dd1af1baa55d9a572180e10', '2024-03-04 16:22:10', '2024-03-04 16:22:11', NULL, '172.25.0.1', 'I',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (13, 39, 'gateway-server.yml', 'DEFAULT_GROUP', '',
        '\n# knife4j的增强配置，不需要增强可以不配\nknife4j:\n  # 聚合swagger文档\n  gateway:\n    enabled: true\n    # 排序规则(tag/operation排序自4.2.0版本新增)\n    # 取值：alpha-默认排序规则，官方swagger-ui默认实现,order-Knife4j提供的增强排序规则，开发者可扩展x-order，根据数值来自定义排序\n    tags-sorter: order\n    operations-sorter: order\n    # 指定手动配置的模式(默认为该模式)\n    strategy: manual\n    routes:\n      - name: 授权服务\n        # 真实子服务访问url地址-提供OpenAPI的文档\n        url: /auth/v3/api-docs?group=default\n        service-name: auth-server\n        # 路由前缀\n        # 兼容OpenAPI3规范在聚合时丢失contextPath属性的异常情况，由开发者自己配置contextPath,Knife4j的前端Ui做兼容处理,与url属性独立不冲突，仅OpenAPI3规范聚合需要，OpenAPI2规范不需要设置此属性,默认为(apiPathPrefix)\n        context-path: /auth\n        order: 1\n      - name: 用户服务\n        # 真实子服务访问url地址-提供OpenAPI的文档\n        url: /system/v3/api-docs?group=default\n        service-name: system-server\n        # 路由前缀\n        # 兼容OpenAPI3规范在聚合时丢失contextPath属性的异常情况，由开发者自己配置contextPath,Knife4j的前端Ui做兼容处理,与url属性独立不冲突，仅OpenAPI3规范聚合需要，OpenAPI2规范不需要设置此属性,默认为(apiPathPrefix)\n        context-path: /\n        order: 2\nspring:\n  cloud:\n    gateway:\n      routes: # 网关路由配置\n        - id: system-server # 路由id，自定义，只要唯一即可\n          uri: lb://system-server # 路由的目标地址 lb是负载均衡，后面跟服务名称(推荐)\n          predicates: # 路由断言，判断请求是否符合路由规则的条件\n            - Path=/system/** # 按照路径匹配，以/user/开头的请求就符合要求\n        - id: auth-server # 路由id，自定义，只要唯一即可\n          uri: lb://auth-server # 路由的目标地址 lb是负载均衡，后面跟服务名称(推荐)\n          predicates: # 路由断言，判断请求是否符合路由规则的条件\n            - Path=/auth/** # 按照路径匹配，以/user/开头的请求就符合要求\n\n',
        'bc135f34952ca8d64a12a3c49d2d96b7', '2024-03-04 17:58:58', '2024-03-04 17:58:58', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (5, 40, 'system-server.yml', 'DEFAULT_GROUP', '',
        'spring:\r\n  datasource:\r\n    url: jdbc:p6spy:mysql://localhost:13360/donut-system?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n    username: root\r\n    password: root@123,./',
        '37a9bf5b6eeb9054457daee5a105c7f2', '2024-03-05 09:28:53', '2024-03-05 09:28:54', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (36, 41, 'file-storage-server.yml', 'DEFAULT_GROUP', '',
        'dromara:\r\n  x-file-storage: #文件存储配置\r\n    default-platform: minio-1 #默认使用的存储平台\r\n    local-plus:\r\n      - platform: local-plus-1 # 存储平台标识\r\n        enable-storage: true  #启用存储\r\n        enable-access: true #启用访问（线上请使用 Nginx 配置，效率更高）\r\n        domain: http://localhost:8080/upload/file/ # 访问域名，例如：“http://127.0.0.1:8030/local-plus/”，注意后面要和 path-patterns 保持一致，“/”结尾，本地存储建议使用相对路径，方便后期更换域名\r\n        base-path: local-plus/ # 基础路径\r\n        path-patterns: /upload/file/** # 访问路径\r\n        storage-path: upload/ # 存储路径\r\n    minio:\r\n      - platform: minio-1 # 存储平台标识\r\n        enable-storage: true  # 启用存储\r\n        access-key: admin\r\n        secret-key: 123456qwe\r\n        end-point: http://127.0.0.1:9000\r\n        bucket-name: donut\r\n        domain: http://localhost:9000/ # 访问域名，注意“/”结尾，例如：http://minio.abc.com/abc/\r\n        attr:\r\n          expire: 30',
        '6a74ab355dd1af1baa55d9a572180e10', '2024-03-05 10:04:46', '2024-03-05 10:04:46', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (8, 42, 'base-config.yml', 'DEFAULT_GROUP', '',
        'spring:\n  boot:\n    admin:\n      client:\n        instance:\n          service-url: http://127.0.0.1:${server.port}/\n        url: http://127.0.0.1:13102\n \nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: ALWAYS\n\n#logging:\n#  pattern:\n#    console: \'%clr(%d{yyyy-MM-dd HH:mm:ss.SSS}){faint} %clr(${LOG_LEVEL_PATTERN:-%5p}) %clr(${PID:- }){magenta} %clr(-){faint} %clr([%t]){faint} %clr(%logger{39}){cyan} %clr([%L]){magenta} %clr(:){faint} %m%n\'\n#  file:\n#    path: ./logs',
        'db06c462c71cf1ca4e1cc5f15c7e286a', '2024-03-05 11:03:32', '2024-03-05 11:03:33', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (8, 43, 'base-config.yml', 'DEFAULT_GROUP', '',
        'spring:\n  boot:\n    admin:\n      client:\n        instance:\n          service-url: http://127.0.0.1:${server.port}/\n        url: http://127.0.0.1:13102\n \nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: ALWAYS\n      \n# springdoc-openapi项目配置\nspringdoc:\n  # 默认是false，需要设置为true\n  default-flat-param-object: true\n  swagger-ui:\n    path: /swagger-ui.html\n    tags-sorter: alpha\n    operations-sorter: alpha\n  api-docs:\n    path: /v3/api-docs\n#logging:\n#  pattern:\n#    console: \'%clr(%d{yyyy-MM-dd HH:mm:ss.SSS}){faint} %clr(${LOG_LEVEL_PATTERN:-%5p}) %clr(${PID:- }){magenta} %clr(-){faint} %clr([%t]){faint} %clr(%logger{39}){cyan} %clr([%L]){magenta} %clr(:){faint} %m%n\'\n#  file:\n#    path: ./logs',
        '709f6da22c59eb1aa82e06702b40cafd', '2024-03-05 11:03:44', '2024-03-05 11:03:45', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (13, 44, 'gateway-server.yml', 'DEFAULT_GROUP', '',
        '\n# knife4j的增强配置，不需要增强可以不配\nknife4j:\n  # 聚合swagger文档\n  gateway:\n    enabled: true\n    # 排序规则(tag/operation排序自4.2.0版本新增)\n    # 取值：alpha-默认排序规则，官方swagger-ui默认实现,order-Knife4j提供的增强排序规则，开发者可扩展x-order，根据数值来自定义排序\n    tags-sorter: order\n    operations-sorter: order\n    # 指定手动配置的模式(默认为该模式)\n    strategy: manual\n    routes:\n      - name: 授权服务\n        # 真实子服务访问url地址-提供OpenAPI的文档\n        url: /auth/v3/api-docs?group=default\n        service-name: auth-server\n        # 路由前缀\n        # 兼容OpenAPI3规范在聚合时丢失contextPath属性的异常情况，由开发者自己配置contextPath,Knife4j的前端Ui做兼容处理,与url属性独立不冲突，仅OpenAPI3规范聚合需要，OpenAPI2规范不需要设置此属性,默认为(apiPathPrefix)\n        context-path: /auth\n        order: 1\n      - name: 用户服务\n        # 真实子服务访问url地址-提供OpenAPI的文档\n        url: /system/v3/api-docs?group=default\n        service-name: system-server\n        # 路由前缀\n        # 兼容OpenAPI3规范在聚合时丢失contextPath属性的异常情况，由开发者自己配置contextPath,Knife4j的前端Ui做兼容处理,与url属性独立不冲突，仅OpenAPI3规范聚合需要，OpenAPI2规范不需要设置此属性,默认为(apiPathPrefix)\n        context-path: /system\n        order: 2\n      - name: 文件服务\n        # 真实子服务访问url地址-提供OpenAPI的文档\n        url: /file-storage/v3/api-docs?group=default\n        service-name: file-storage-server\n        # 路由前缀\n        # 兼容OpenAPI3规范在聚合时丢失contextPath属性的异常情况，由开发者自己配置contextPath,Knife4j的前端Ui做兼容处理,与url属性独立不冲突，仅OpenAPI3规范聚合需要，OpenAPI2规范不需要设置此属性,默认为(apiPathPrefix)\n        context-path: /file-storage\n        order: 3\nspring:\n  cloud:\n    gateway:\n      routes: # 网关路由配置\n        - id: system-server # 路由id，自定义，只要唯一即可\n          uri: lb://system-server # 路由的目标地址 lb是负载均衡，后面跟服务名称(推荐)\n          predicates: # 路由断言，判断请求是否符合路由规则的条件\n            - Path=/system/** # 按照路径匹配\n        - id: auth-server # 路由id，自定义，只要唯一即可\n          uri: lb://auth-server # 路由的目标地址 lb是负载均衡，后面跟服务名称(推荐)\n          predicates: # 路由断言，判断请求是否符合路由规则的条件\n            - Path=/auth/** # 按照路径匹配\n        - id: file-storage-server # 路由id，自定义，只要唯一即可\n          uri: lb://file-storage-server # 路由的目标地址 lb是负载均衡，后面跟服务名称(推荐)\n          predicates: # 路由断言，判断请求是否符合路由规则的条件\n            - Path=/file-storage/** # 按照路径匹配\n\n',
        '87189bb8a6dab02fdbfe26f28fdbddfc', '2024-03-05 11:10:24', '2024-03-05 11:10:25', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (0, 45, 'auth-server-yml', 'DEFAULT_GROUP', '',
        'project:\r\n  rsaPrivateKey: MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBALH81v/GpK1KW4zQotxHwI2BVOQ+g9VcVQxnDb6Zs+t+rlS18slqjGcINYBCWvkpEyqz3jI4evmXYQn64FNR7lY1QALDwetTyi5t70vC1aSmmk2ZO3DB3PP9l+ygbkDmYy1pjP+JunkT1cbogcXL6nUNRHFSR/upwdmA/+1OeMplAgMBAAECgYAqje4Fh0PWHsIWv8dAbXNPIc3fKEcy2vmGlpkFqhAHTOl3XW0n1O6ur5rDCJphmf14JzsHvNNCG3xa+31ozlzyHvjXN2kGUW5UDW7gJm/yh8HDtyl4IK/BFv9bFbpvMkSMkThiUI1zucafmQe8e7rMMJFzM2XfFuq1ilkBzqjlAQJBAOy4cgx+SbxjtU40xxOzLAC7K1qHzas4Ocv8BsMG4iCZs2Yrh/sCQs3nYx9EEbN2PgqZpY7uFUoulisDvieiHyUCQQDAe9Tfto6dlPJjbzT7dtMqTXTeCwpkGpOwbvvBoxY4b1OGUG8gzScbmAE1U+YAH0I2WaHwuHj6RELpAHIklrpBAkEAzKN6vIAkID8WCmCnxMj8fjlP9jg2PREjLctW0RxPOZ2FsApryDuhIr0oPGws3TaX1bQTomcBcpqpaNAYf8ywHQJAJHpTSWJLfMmxde6pV86ZDjdHopztBzOSMamWxIenumI+rgGoTcsTUkNoVzbjK7rAzZQHAJu1MZimJYoUF6MJAQJBAI3q0IOgbZkDSVXlLxzNIO9QrlgDqoVjQKnlM8LL/3yXZOKTDbPSpenlJpgy5/sbrexA3S50B5gPoDMhPxiSyJY=\r\n  rsaPublicKey: MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCx/Nb/xqStSluM0KLcR8CNgVTkPoPVXFUMZw2+mbPrfq5UtfLJaoxnCDWAQlr5KRMqs94yOHr5l2EJ+uBTUe5WNUACw8HrU8oube9LwtWkpppNmTtwwdzz/ZfsoG5A5mMtaYz/ibp5E9XG6IHFy+p1DURxUkf7qcHZgP/tTnjKZQIDAQAB',
        '8905c811766e315a089a8cb80b484bdc', '2024-03-05 13:25:44', '2024-03-05 13:25:45', NULL, '172.25.0.1', 'I',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (43, 46, 'auth-server-yml', 'DEFAULT_GROUP', '',
        'project:\r\n  rsaPrivateKey: MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBALH81v/GpK1KW4zQotxHwI2BVOQ+g9VcVQxnDb6Zs+t+rlS18slqjGcINYBCWvkpEyqz3jI4evmXYQn64FNR7lY1QALDwetTyi5t70vC1aSmmk2ZO3DB3PP9l+ygbkDmYy1pjP+JunkT1cbogcXL6nUNRHFSR/upwdmA/+1OeMplAgMBAAECgYAqje4Fh0PWHsIWv8dAbXNPIc3fKEcy2vmGlpkFqhAHTOl3XW0n1O6ur5rDCJphmf14JzsHvNNCG3xa+31ozlzyHvjXN2kGUW5UDW7gJm/yh8HDtyl4IK/BFv9bFbpvMkSMkThiUI1zucafmQe8e7rMMJFzM2XfFuq1ilkBzqjlAQJBAOy4cgx+SbxjtU40xxOzLAC7K1qHzas4Ocv8BsMG4iCZs2Yrh/sCQs3nYx9EEbN2PgqZpY7uFUoulisDvieiHyUCQQDAe9Tfto6dlPJjbzT7dtMqTXTeCwpkGpOwbvvBoxY4b1OGUG8gzScbmAE1U+YAH0I2WaHwuHj6RELpAHIklrpBAkEAzKN6vIAkID8WCmCnxMj8fjlP9jg2PREjLctW0RxPOZ2FsApryDuhIr0oPGws3TaX1bQTomcBcpqpaNAYf8ywHQJAJHpTSWJLfMmxde6pV86ZDjdHopztBzOSMamWxIenumI+rgGoTcsTUkNoVzbjK7rAzZQHAJu1MZimJYoUF6MJAQJBAI3q0IOgbZkDSVXlLxzNIO9QrlgDqoVjQKnlM8LL/3yXZOKTDbPSpenlJpgy5/sbrexA3S50B5gPoDMhPxiSyJY=\r\n  rsaPublicKey: MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCx/Nb/xqStSluM0KLcR8CNgVTkPoPVXFUMZw2+mbPrfq5UtfLJaoxnCDWAQlr5KRMqs94yOHr5l2EJ+uBTUe5WNUACw8HrU8oube9LwtWkpppNmTtwwdzz/ZfsoG5A5mMtaYz/ibp5E9XG6IHFy+p1DURxUkf7qcHZgP/tTnjKZQIDAQAB',
        '8905c811766e315a089a8cb80b484bdc', '2024-03-05 13:27:53', '2024-03-05 13:27:53', NULL, '172.25.0.1', 'D',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (0, 47, 'auth-server.yml', 'DEFAULT_GROUP', '',
        'project:\r\n  rsaPrivateKey: MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBALH81v/GpK1KW4zQotxHwI2BVOQ+g9VcVQxnDb6Zs+t+rlS18slqjGcINYBCWvkpEyqz3jI4evmXYQn64FNR7lY1QALDwetTyi5t70vC1aSmmk2ZO3DB3PP9l+ygbkDmYy1pjP+JunkT1cbogcXL6nUNRHFSR/upwdmA/+1OeMplAgMBAAECgYAqje4Fh0PWHsIWv8dAbXNPIc3fKEcy2vmGlpkFqhAHTOl3XW0n1O6ur5rDCJphmf14JzsHvNNCG3xa+31ozlzyHvjXN2kGUW5UDW7gJm/yh8HDtyl4IK/BFv9bFbpvMkSMkThiUI1zucafmQe8e7rMMJFzM2XfFuq1ilkBzqjlAQJBAOy4cgx+SbxjtU40xxOzLAC7K1qHzas4Ocv8BsMG4iCZs2Yrh/sCQs3nYx9EEbN2PgqZpY7uFUoulisDvieiHyUCQQDAe9Tfto6dlPJjbzT7dtMqTXTeCwpkGpOwbvvBoxY4b1OGUG8gzScbmAE1U+YAH0I2WaHwuHj6RELpAHIklrpBAkEAzKN6vIAkID8WCmCnxMj8fjlP9jg2PREjLctW0RxPOZ2FsApryDuhIr0oPGws3TaX1bQTomcBcpqpaNAYf8ywHQJAJHpTSWJLfMmxde6pV86ZDjdHopztBzOSMamWxIenumI+rgGoTcsTUkNoVzbjK7rAzZQHAJu1MZimJYoUF6MJAQJBAI3q0IOgbZkDSVXlLxzNIO9QrlgDqoVjQKnlM8LL/3yXZOKTDbPSpenlJpgy5/sbrexA3S50B5gPoDMhPxiSyJY=\r\n  rsaPublicKey: MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCx/Nb/xqStSluM0KLcR8CNgVTkPoPVXFUMZw2+mbPrfq5UtfLJaoxnCDWAQlr5KRMqs94yOHr5l2EJ+uBTUe5WNUACw8HrU8oube9LwtWkpppNmTtwwdzz/ZfsoG5A5mMtaYz/ibp5E9XG6IHFy+p1DURxUkf7qcHZgP/tTnjKZQIDAQAB',
        '8905c811766e315a089a8cb80b484bdc', '2024-03-05 13:28:04', '2024-03-05 13:28:05', NULL, '172.25.0.1', 'I',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (36, 48, 'file-storage-server.yml', 'DEFAULT_GROUP', '',
        'spring:\n  datasource:\n    url: jdbc:p6spy:mysql://localhost:13360/donut-system?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n    username: root\n    password: root@123,./\n    \ndromara:\n  x-file-storage: #文件存储配置\n    default-platform: minio-1 #默认使用的存储平台\n    local-plus:\n      - platform: local-plus-1 # 存储平台标识\n        enable-storage: true  #启用存储\n        enable-access: true #启用访问（线上请使用 Nginx 配置，效率更高）\n        domain: http://localhost:8080/upload/file/ # 访问域名，例如：“http://127.0.0.1:8030/local-plus/”，注意后面要和 path-patterns 保持一致，“/”结尾，本地存储建议使用相对路径，方便后期更换域名\n        base-path: local-plus/ # 基础路径\n        path-patterns: /upload/file/** # 访问路径\n        storage-path: upload/ # 存储路径\n    minio:\n      - platform: minio-1 # 存储平台标识\n        enable-storage: true  # 启用存储\n        access-key: admin\n        secret-key: 123456qwe\n        end-point: http://127.0.0.1:9000\n        bucket-name: donut\n        domain: http://localhost:9000/ # 访问域名，注意“/”结尾，例如：http://minio.abc.com/abc/\n        attr:\n          expire: 30',
        '95705ff34b8561c2d3062294301443b0', '2024-03-05 17:46:24', '2024-03-05 17:46:25', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (8, 49, 'base-config.yml', 'DEFAULT_GROUP', '',
        'spring:\n  boot:\n    admin:\n      client:\n        instance:\n          service-url: http://127.0.0.1:${server.port}/\n        url: http://127.0.0.1:13102\n \nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: ALWAYS\n      \n# springdoc-openapi项目配置\nspringdoc:\n  # 默认是false，需要设置为true\n  default-flat-param-object: true\n  swagger-ui:\n    path: /swagger-ui.html\n    tags-sorter: alpha\n    operations-sorter: alpha\n  api-docs:\n    path: /v3/api-docs\n# knife4j的增强配置，不需要增强可以不配\nknife4j:\n  enable: true\n  setting:\n    language: zh_cn\n#logging:\n#  pattern:\n#    console: \'%clr(%d{yyyy-MM-dd HH:mm:ss.SSS}){faint} %clr(${LOG_LEVEL_PATTERN:-%5p}) %clr(${PID:- }){magenta} %clr(-){faint} %clr([%t]){faint} %clr(%logger{39}){cyan} %clr([%L]){magenta} %clr(:){faint} %m%n\'\n#  file:\n#    path: ./logs',
        '380bb5120d80cfc7800adbbf61cc8f91', '2024-03-06 10:13:30', '2024-03-06 10:13:30', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (8, 50, 'base-config.yml', 'DEFAULT_GROUP', '',
        'spring:\n  boot:\n    admin:\n      client:\n        instance:\n          service-url: http://127.0.0.1:${server.port}/\n        url: http://127.0.0.1:13102\n \nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: ALWAYS\n      \n# springdoc-openapi项目配置\nspringdoc:\n  # 默认是false，需要设置为true\n  default-flat-param-object: true\n  swagger-ui:\n    path: /swagger-ui.html\n    tags-sorter: alpha\n    operations-sorter: alpha\n  api-docs:\n    path: /v3/api-docs\n# knife4j的增强配置，不需要增强可以不配\nknife4j:\n  enable: true\n  setting:\n    language: zh_cn\n',
        '2283d90ed81416442a5e3141efe5ad55', '2024-03-06 10:15:12', '2024-03-06 10:15:13', NULL, '172.25.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (0, 51, 'basic-gateway-server.yml', 'DEFAULT_GROUP', '',
        '\r\n# knife4j的增强配置，不需要增强可以不配\r\nknife4j:\r\n  # 聚合swagger文档\r\n  gateway:\r\n    enabled: true\r\n    # 排序规则(tag/operation排序自4.2.0版本新增)\r\n    # 取值：alpha-默认排序规则，官方swagger-ui默认实现,order-Knife4j提供的增强排序规则，开发者可扩展x-order，根据数值来自定义排序\r\n    tags-sorter: order\r\n    operations-sorter: order\r\n    # 指定手动配置的模式(默认为该模式)\r\n    strategy: discover\r\nspring:\r\n  cloud:\r\n    gateway:\r\n      routes: # 网关路由配置\r\n        - id: system-server # 路由id，自定义，只要唯一即可\r\n          uri: lb://system-server # 路由的目标地址 lb是负载均衡，后面跟服务名称(推荐)\r\n          predicates: # 路由断言，判断请求是否符合路由规则的条件\r\n            - Path=/system/** # 按照路径匹配\r\n        - id: auth-server # 路由id，自定义，只要唯一即可\r\n          uri: lb://auth-server # 路由的目标地址 lb是负载均衡，后面跟服务名称(推荐)\r\n          predicates: # 路由断言，判断请求是否符合路由规则的条件\r\n            - Path=/auth/** # 按照路径匹配\r\n        - id: file-storage-server # 路由id，自定义，只要唯一即可\r\n          uri: lb://file-storage-server # 路由的目标地址 lb是负载均衡，后面跟服务名称(推荐)\r\n          predicates: # 路由断言，判断请求是否符合路由规则的条件\r\n            - Path=/file-storage/** # 按照路径匹配\r\n\r\n',
        '582cb2b7b495a1b2e7834dba503ee627', '2024-03-06 11:11:23', '2024-03-06 11:11:23', NULL, '172.25.0.1', 'I',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (13, 52, 'gateway-server.yml', 'DEFAULT_GROUP', '',
        '\n# knife4j的增强配置，不需要增强可以不配\nknife4j:\n  # 聚合swagger文档\n  gateway:\n    enabled: true\n    # 排序规则(tag/operation排序自4.2.0版本新增)\n    # 取值：alpha-默认排序规则，官方swagger-ui默认实现,order-Knife4j提供的增强排序规则，开发者可扩展x-order，根据数值来自定义排序\n    tags-sorter: order\n    operations-sorter: order\n    # 指定手动配置的模式(默认为该模式)\n    strategy: discover\nspring:\n  cloud:\n    gateway:\n      routes: # 网关路由配置\n        - id: system-server # 路由id，自定义，只要唯一即可\n          uri: lb://system-server # 路由的目标地址 lb是负载均衡，后面跟服务名称(推荐)\n          predicates: # 路由断言，判断请求是否符合路由规则的条件\n            - Path=/system/** # 按照路径匹配\n        - id: auth-server # 路由id，自定义，只要唯一即可\n          uri: lb://auth-server # 路由的目标地址 lb是负载均衡，后面跟服务名称(推荐)\n          predicates: # 路由断言，判断请求是否符合路由规则的条件\n            - Path=/auth/** # 按照路径匹配\n        - id: file-storage-server # 路由id，自定义，只要唯一即可\n          uri: lb://file-storage-server # 路由的目标地址 lb是负载均衡，后面跟服务名称(推荐)\n          predicates: # 路由断言，判断请求是否符合路由规则的条件\n            - Path=/file-storage/** # 按照路径匹配\n\n',
        'd1e45935dfe0b4cc95c46172811940b5', '2024-03-06 11:11:27', '2024-03-06 11:11:27', NULL, '172.25.0.1', 'D',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (5, 53, 'system-server.yml', 'DEFAULT_GROUP', '',
        'spring:\n  datasource:\n    url: jdbc:p6spy:mysql://localhost:13360/donut-system?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n    username: root\n    password: root@123,./\n\nproject:\n  templatePath: D:/data/templatesFile/',
        'bf2cc6d8d57590c3670be1487d1b607d', '2024-06-07 13:22:38', '2024-06-07 13:22:39', 'nacos', '172.29.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (5, 54, 'system-server.yml', 'DEFAULT_GROUP', '',
        'spring:\n  datasource:\n    url: jdbc:p6spy:mysql://localhost:13360/donut-system?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n    username: root\n    password: root@123,./\n\nproject:\n  templatePath: D:/data/templatesFile/\n\ndromara:\n  x-file-storage: #文件存储配置\n    default-platform: minio-1 #默认使用的存储平台\n    local-plus:\n      - platform: local-plus-1 # 存储平台标识\n        enable-storage: true  #启用存储\n        enable-access: true #启用访问（线上请使用 Nginx 配置，效率更高）\n        domain: http://localhost:8080/upload/file/ # 访问域名，例如：“http://127.0.0.1:8030/local-plus/”，注意后面要和 path-patterns 保持一致，“/”结尾，本地存储建议使用相对路径，方便后期更换域名\n        base-path: local-plus/ # 基础路径\n        path-patterns: /upload/file/** # 访问路径\n        storage-path: upload/ # 存储路径\n    minio:\n      - platform: minio-1 # 存储平台标识\n        enable-storage: true  # 启用存储\n        access-key: admin\n        secret-key: 123456qwe\n        end-point: http://127.0.0.1:9000\n        bucket-name: donut\n        domain: http://localhost:9000/ # 访问域名，注意“/”结尾，例如：http://minio.abc.com/abc/\n\n# 常用的文件扩展名，用于文件上传过滤\nproject:\n  fileExt:\n    # 图片\n    - jpeg\n    - jpg\n    - png\n    - gif\n    - bmp\n    - tiff\n    - webp\n    - svg\n    - ico\n    - heic\n    - heif\n    - psd\n    - raw\n    # 视频\n    - mp4\n    - avi\n    - mkv\n    - mov\n    - flv\n    - wmv\n    - webm\n    - mpeg\n    - 3gp\n    - ogg\n    # 音频\n    - mp3\n    - wav\n    - flac\n    - aac\n    - wma\n    - ogg\n    - m4a\n    # 文档\n    - pdf\n    - doc\n    - docx\n    - xls\n    - xlsx\n    - ppt\n    - pptx\n    - txt\n    - rtf\n    - csv',
        'b636558f6e24ace1b88a0ff5be8a6b69', '2024-06-07 13:23:22', '2024-06-07 13:23:23', 'nacos', '172.29.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (36, 55, 'file-storage-server.yml', 'DEFAULT_GROUP', '',
        'spring:\n  datasource:\n    url: jdbc:p6spy:mysql://localhost:13360/donut-system?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n    username: root\n    password: root@123,./\n    \ndromara:\n  x-file-storage: #文件存储配置\n    default-platform: minio-1 #默认使用的存储平台\n    local-plus:\n      - platform: local-plus-1 # 存储平台标识\n        enable-storage: true  #启用存储\n        enable-access: true #启用访问（线上请使用 Nginx 配置，效率更高）\n        domain: http://localhost:8080/upload/file/ # 访问域名，例如：“http://127.0.0.1:8030/local-plus/”，注意后面要和 path-patterns 保持一致，“/”结尾，本地存储建议使用相对路径，方便后期更换域名\n        base-path: local-plus/ # 基础路径\n        path-patterns: /upload/file/** # 访问路径\n        storage-path: upload/ # 存储路径\n    minio:\n      - platform: minio-1 # 存储平台标识\n        enable-storage: true  # 启用存储\n        access-key: admin\n        secret-key: 123456qwe\n        end-point: http://127.0.0.1:9000\n        bucket-name: donut\n        domain: http://localhost:9000/ # 访问域名，注意“/”结尾，例如：http://minio.abc.com/abc/\n\n# 常用的文件扩展名，用于文件上传过滤\nproject:\n  fileExt:\n    # 图片\n    - jpeg\n    - jpg\n    - png\n    - gif\n    - bmp\n    - tiff\n    - webp\n    - svg\n    - ico\n    - heic\n    - heif\n    - psd\n    - raw\n    # 视频\n    - mp4\n    - avi\n    - mkv\n    - mov\n    - flv\n    - wmv\n    - webm\n    - mpeg\n    - 3gp\n    - ogg\n    # 音频\n    - mp3\n    - wav\n    - flac\n    - aac\n    - wma\n    - ogg\n    - m4a\n    # 文档\n    - pdf\n    - doc\n    - docx\n    - xls\n    - xlsx\n    - ppt\n    - pptx\n    - txt\n    - rtf\n    - csv',
        '374955f541899046f129d131750e4544', '2024-06-07 13:23:29', '2024-06-07 13:23:30', 'nacos', '172.29.0.1', 'D',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (5, 56, 'system-server.yml', 'DEFAULT_GROUP', '',
        'spring:\n  datasource:\n    url: jdbc:p6spy:mysql://localhost:13360/donut-system?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n    username: root\n    password: root@123,./\n\ndromara:\n  x-file-storage: #文件存储配置\n    default-platform: minio-1 #默认使用的存储平台\n    local-plus:\n      - platform: local-plus-1 # 存储平台标识\n        enable-storage: true  #启用存储\n        enable-access: true #启用访问（线上请使用 Nginx 配置，效率更高）\n        domain: http://localhost:8080/upload/file/ # 访问域名，例如：“http://127.0.0.1:8030/local-plus/”，注意后面要和 path-patterns 保持一致，“/”结尾，本地存储建议使用相对路径，方便后期更换域名\n        base-path: local-plus/ # 基础路径\n        path-patterns: /upload/file/** # 访问路径\n        storage-path: upload/ # 存储路径\n    minio:\n      - platform: minio-1 # 存储平台标识\n        enable-storage: true  # 启用存储\n        access-key: admin\n        secret-key: 123456qwe\n        end-point: http://127.0.0.1:9000\n        bucket-name: donut\n        domain: http://localhost:9000/ # 访问域名，注意“/”结尾，例如：http://minio.abc.com/abc/\n\n# 常用的文件扩展名，用于文件上传过滤\nproject:\n  fileExt:\n    # 图片\n    - jpeg\n    - jpg\n    - png\n    - gif\n    - bmp\n    - tiff\n    - webp\n    - svg\n    - ico\n    - heic\n    - heif\n    - psd\n    - raw\n    # 视频\n    - mp4\n    - avi\n    - mkv\n    - mov\n    - flv\n    - wmv\n    - webm\n    - mpeg\n    - 3gp\n    - ogg\n    # 音频\n    - mp3\n    - wav\n    - flac\n    - aac\n    - wma\n    - ogg\n    - m4a\n    # 文档\n    - pdf\n    - doc\n    - docx\n    - xls\n    - xlsx\n    - ppt\n    - pptx\n    - txt\n    - rtf\n    - csv',
        '78cb12944fccea78763365f71859c689', '2024-06-07 15:45:33', '2024-06-07 15:45:33', 'nacos', '172.29.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (0, 57, 'base-file-storage.yml', 'DEFAULT_GROUP', '',
        'dromara:\r\n  x-file-storage: #文件存储配置\r\n    default-platform: minio-1 #默认使用的存储平台\r\n    local-plus:\r\n      - platform: local-plus-1 # 存储平台标识\r\n        enable-storage: true  #启用存储\r\n        enable-access: true #启用访问（线上请使用 Nginx 配置，效率更高）\r\n        domain: http://localhost:8080/upload/file/ # 访问域名，例如：“http://127.0.0.1:8030/local-plus/”，注意后面要和 path-patterns 保持一致，“/”结尾，本地存储建议使用相对路径，方便后期更换域名\r\n        base-path: local-plus/ # 基础路径\r\n        path-patterns: /upload/file/** # 访问路径\r\n        storage-path: upload/ # 存储路径\r\n    minio:\r\n      - platform: minio-1 # 存储平台标识\r\n        enable-storage: true  # 启用存储\r\n        access-key: admin\r\n        secret-key: 123456qwe\r\n        end-point: http://127.0.0.1:9000\r\n        bucket-name: donut\r\n        domain: http://localhost:9000/ # 访问域名，注意“/”结尾，例如：http://minio.abc.com/abc/\r\n\r\n# 常用的文件扩展名，用于文件上传过滤\r\nproject:\r\n  fileExt:\r\n    # 图片\r\n    - jpeg\r\n    - jpg\r\n    - png\r\n    - gif\r\n    - bmp\r\n    - tiff\r\n    - webp\r\n    - svg\r\n    - ico\r\n    - heic\r\n    - heif\r\n    - psd\r\n    - raw\r\n    # 视频\r\n    - mp4\r\n    - avi\r\n    - mkv\r\n    - mov\r\n    - flv\r\n    - wmv\r\n    - webm\r\n    - mpeg\r\n    - 3gp\r\n    - ogg\r\n    # 音频\r\n    - mp3\r\n    - wav\r\n    - flac\r\n    - aac\r\n    - wma\r\n    - ogg\r\n    - m4a\r\n    # 文档\r\n    - pdf\r\n    - doc\r\n    - docx\r\n    - xls\r\n    - xlsx\r\n    - ppt\r\n    - pptx\r\n    - txt\r\n    - rtf\r\n    - csv',
        '3cf7dfe537b71980e9978390b78ea6b1', '2024-06-07 15:46:00', '2024-06-07 15:46:00', 'nacos', '172.29.0.1', 'I',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (0, 58, 'generator-server.yml', 'DEFAULT_GROUP', '',
        'spring:\r\n  datasource:\r\n    url: jdbc:p6spy:mysql://localhost:13360/donut-generator?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n    username: root\r\n    password: root@123,./',
        '23a9acd9992681151457bb0ddee5cda4', '2024-06-07 16:36:49', '2024-06-07 16:36:50', 'nacos', '172.29.0.1', 'I',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (0, 59, 'base-crypto.yml', 'DEFAULT_GROUP', '',
        'project:\r\n  rsaPrivateKey: MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBALH81v/GpK1KW4zQotxHwI2BVOQ+g9VcVQxnDb6Zs+t+rlS18slqjGcINYBCWvkpEyqz3jI4evmXYQn64FNR7lY1QALDwetTyi5t70vC1aSmmk2ZO3DB3PP9l+ygbkDmYy1pjP+JunkT1cbogcXL6nUNRHFSR/upwdmA/+1OeMplAgMBAAECgYAqje4Fh0PWHsIWv8dAbXNPIc3fKEcy2vmGlpkFqhAHTOl3XW0n1O6ur5rDCJphmf14JzsHvNNCG3xa+31ozlzyHvjXN2kGUW5UDW7gJm/yh8HDtyl4IK/BFv9bFbpvMkSMkThiUI1zucafmQe8e7rMMJFzM2XfFuq1ilkBzqjlAQJBAOy4cgx+SbxjtU40xxOzLAC7K1qHzas4Ocv8BsMG4iCZs2Yrh/sCQs3nYx9EEbN2PgqZpY7uFUoulisDvieiHyUCQQDAe9Tfto6dlPJjbzT7dtMqTXTeCwpkGpOwbvvBoxY4b1OGUG8gzScbmAE1U+YAH0I2WaHwuHj6RELpAHIklrpBAkEAzKN6vIAkID8WCmCnxMj8fjlP9jg2PREjLctW0RxPOZ2FsApryDuhIr0oPGws3TaX1bQTomcBcpqpaNAYf8ywHQJAJHpTSWJLfMmxde6pV86ZDjdHopztBzOSMamWxIenumI+rgGoTcsTUkNoVzbjK7rAzZQHAJu1MZimJYoUF6MJAQJBAI3q0IOgbZkDSVXlLxzNIO9QrlgDqoVjQKnlM8LL/3yXZOKTDbPSpenlJpgy5/sbrexA3S50B5gPoDMhPxiSyJY=\r\n  rsaPublicKey: MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCx/Nb/xqStSluM0KLcR8CNgVTkPoPVXFUMZw2+mbPrfq5UtfLJaoxnCDWAQlr5KRMqs94yOHr5l2EJ+uBTUe5WNUACw8HrU8oube9LwtWkpppNmTtwwdzz/ZfsoG5A5mMtaYz/ibp5E9XG6IHFy+p1DURxUkf7qcHZgP/tTnjKZQIDAQAB',
        '8905c811766e315a089a8cb80b484bdc', '2024-06-07 17:29:42', '2024-06-07 17:29:43', 'nacos', '172.29.0.1', 'I',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (6, 60, 'base-redis.yml', 'DEFAULT_GROUP', '',
        'spring:\n  data:\n    # redis 配置\n    redis:\n      # 地址\n      host: localhost\n      # 端口，默认为6379\n      port: 6379\n      # 数据库索引\n      database: 5\n      # 密码\n      password: 123456\n      # 连接超时时间\n      timeout: 15000\n      lettuce:\n        pool:\n          # 连接池中的最小空闲连接\n          min-idle: 0\n          # 连接池中的最大空闲连接\n          max-idle: 10\n          # 连接池的最大数据库连接数\n          max-active: 20\n          # #连接池最大阻塞等待时间（使用负值表示没有限制）\n          max-wait: -1ms',
        '4946062846c2d8be9f6d63da89f20dbc', '2024-06-07 17:39:30', '2024-06-07 17:39:30', 'nacos', '172.29.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (48, 61, 'basic-gateway-server.yml', 'DEFAULT_GROUP', '',
        '\r\n# knife4j的增强配置，不需要增强可以不配\r\nknife4j:\r\n  # 聚合swagger文档\r\n  gateway:\r\n    enabled: true\r\n    # 排序规则(tag/operation排序自4.2.0版本新增)\r\n    # 取值：alpha-默认排序规则，官方swagger-ui默认实现,order-Knife4j提供的增强排序规则，开发者可扩展x-order，根据数值来自定义排序\r\n    tags-sorter: order\r\n    operations-sorter: order\r\n    # 指定手动配置的模式(默认为该模式)\r\n    strategy: discover\r\nspring:\r\n  cloud:\r\n    gateway:\r\n      routes: # 网关路由配置\r\n        - id: system-server # 路由id，自定义，只要唯一即可\r\n          uri: lb://system-server # 路由的目标地址 lb是负载均衡，后面跟服务名称(推荐)\r\n          predicates: # 路由断言，判断请求是否符合路由规则的条件\r\n            - Path=/system/** # 按照路径匹配\r\n        - id: auth-server # 路由id，自定义，只要唯一即可\r\n          uri: lb://auth-server # 路由的目标地址 lb是负载均衡，后面跟服务名称(推荐)\r\n          predicates: # 路由断言，判断请求是否符合路由规则的条件\r\n            - Path=/auth/** # 按照路径匹配\r\n        - id: file-storage-server # 路由id，自定义，只要唯一即可\r\n          uri: lb://file-storage-server # 路由的目标地址 lb是负载均衡，后面跟服务名称(推荐)\r\n          predicates: # 路由断言，判断请求是否符合路由规则的条件\r\n            - Path=/file-storage/** # 按照路径匹配\r\n\r\n',
        '582cb2b7b495a1b2e7834dba503ee627', '2024-06-07 17:41:52', '2024-06-07 17:41:53', 'nacos', '172.29.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');
INSERT INTO `his_config_info`
VALUES (48, 62, 'basic-gateway-server.yml', 'DEFAULT_GROUP', '',
        '\n# knife4j的增强配置，不需要增强可以不配\nknife4j:\n  # 聚合swagger文档\n  gateway:\n    enabled: true\n    # 排序规则(tag/operation排序自4.2.0版本新增)\n    # 取值：alpha-默认排序规则，官方swagger-ui默认实现,order-Knife4j提供的增强排序规则，开发者可扩展x-order，根据数值来自定义排序\n    tags-sorter: order\n    operations-sorter: order\n    # 指定手动配置的模式(默认为该模式)\n    strategy: discover\nspring:\n  cloud:\n    gateway:\n      routes: # 网关路由配置\n        - id: system-server # 路由id，自定义，只要唯一即可\n          uri: lb://system-server # 路由的目标地址 lb是负载均衡，后面跟服务名称(推荐)\n          predicates: # 路由断言，判断请求是否符合路由规则的条件\n            - Path=/system/** # 按照路径匹配\n        - id: auth-server # 路由id，自定义，只要唯一即可\n          uri: lb://auth-server # 路由的目标地址 lb是负载均衡，后面跟服务名称(推荐)\n          predicates: # 路由断言，判断请求是否符合路由规则的条件\n            - Path=/auth/** # 按照路径匹配\n        - id: genertor-server # 路由id，自定义，只要唯一即可\n          uri: lb://genertor-server # 路由的目标地址 lb是负载均衡，后面跟服务名称(推荐)\n          predicates: # 路由断言，判断请求是否符合路由规则的条件\n            - Path=/genertor/** # 按照路径匹配\n\n',
        'fcc15e026ad6a207466c9f089948e77f', '2024-06-07 17:42:39', '2024-06-07 17:42:40', 'nacos', '172.29.0.1', 'U',
        '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', '');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`
(
    `role`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT 'role',
    `resource` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'resource',
    `action`   varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NOT NULL COMMENT 'action',
    UNIQUE INDEX `uk_role_permission` (`role` ASC, `resource` ASC, `action` ASC) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`
(
    `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'username',
    `role`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'role',
    UNIQUE INDEX `idx_user_role` (`username` ASC, `role` ASC) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles`
VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`
(
    `id`                bigint UNSIGNED                                  NOT NULL AUTO_INCREMENT COMMENT 'ä¸»é”®ID',
    `tenant_id`         varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
    `quota`             int UNSIGNED                                     NOT NULL DEFAULT 0 COMMENT 'é…é¢ï¼Œ0è¡¨ç¤ºä½¿ç”¨é»˜è®¤å€¼',
    `usage`             int UNSIGNED                                     NOT NULL DEFAULT 0 COMMENT 'ä½¿ç”¨é‡',
    `max_size`          int UNSIGNED                                     NOT NULL DEFAULT 0 COMMENT 'å•ä¸ªé…ç½®å¤§å°ä¸Šé™ï¼Œå•ä½ä¸ºå­—èŠ‚ï¼Œ0è¡¨ç¤ºä½¿ç”¨é»˜è®¤å€¼',
    `max_aggr_count`    int UNSIGNED                                     NOT NULL DEFAULT 0 COMMENT 'èšåˆå­é…ç½®æœ€å¤§ä¸ªæ•°',
    `max_aggr_size`     int UNSIGNED                                     NOT NULL DEFAULT 0 COMMENT 'å•ä¸ªèšåˆæ•°æ®çš„å­é…ç½®å¤§å°ä¸Šé™ï¼Œå•ä½ä¸ºå­—èŠ‚ï¼Œ0è¡¨ç¤ºä½¿ç”¨é»˜è®¤å€¼',
    `max_history_count` int UNSIGNED                                     NOT NULL DEFAULT 0 COMMENT 'æœ€å¤§å˜æ›´åŽ†å²æ•°é‡',
    `gmt_create`        datetime                                         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'åˆ›å»ºæ—¶é—´',
    `gmt_modified`      datetime                                         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ä¿®æ”¹æ—¶é—´',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_tenant_id` (`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = 'ç§Ÿæˆ·å®¹é‡ä¿¡æ¯è¡¨'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`
(
    `id`            bigint                                           NOT NULL AUTO_INCREMENT COMMENT 'id',
    `kp`            varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
    `tenant_id`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
    `tenant_name`   varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_name',
    `tenant_desc`   varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
    `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL COMMENT 'create_source',
    `gmt_create`    bigint                                           NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
    `gmt_modified`  bigint                                           NOT NULL COMMENT 'ä¿®æ”¹æ—¶é—´',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_tenant_info_kptenantid` (`kp` ASC, `tenant_id` ASC) USING BTREE,
    INDEX `idx_tenant_id` (`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = 'tenant_info'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
INSERT INTO `tenant_info`
VALUES (1, '1', '39b37a31-62f8-4ed7-8b77-43c1aa9937b1', 'donut-cloud-dev', 'donut-cloud-dev', 'nacos', 1708409170648,
        1708409170648);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`
(
    `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT 'username',
    `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'password',
    `enabled`  tinyint(1)                                                    NOT NULL COMMENT 'enabled',
    PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users`
VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

SET FOREIGN_KEY_CHECKS = 1;
