CREATE TABLE `goods_stock_freeze` (
      `xid` varchar(128) NOT NULL,
      `freeze_stock` int(11) NOT NULL,
      `state` int(1) NOT NULL COMMENT '事务状态，0:try，1:confirm，2:cancel',
      PRIMARY KEY (`xid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `goods` (
     `id` bigint(11) NOT NULL AUTO_INCREMENT,
     `name` varchar(50) NOT NULL,
     `price` decimal(10,2) NOT NULL,
     `stock` int(11) NOT NULL,
     PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `order` (
     `id` bigint(11) NOT NULL AUTO_INCREMENT,
     `goods_id` bigint(11) NOT NULL,
     `total` int(11) NOT NULL,
     `create_time` datetime DEFAULT NULL COMMENT '创建时间',
     PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;