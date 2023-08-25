CREATE TABLE `goods_stock_freeze` (
  `xid` varchar(128) NOT NULL,
  `freeze_stock` int(11) NOT NULL,
  `state` int(1) NOT NULL COMMENT '事务状态，0:try，1:confirm，2:cancel',
  PRIMARY KEY (`xid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;