/*+ mycat:resetConfig{} */

添加dw0数据源
/*+ mycat:createDataSource{
  "name":"dw0",
  "password":"123456",  "url":"jdbc:mysql://127.0.0.1:3312?useUnicode=true&serverTimezone=UTC&characterEncoding=UTF-8",
  "user":"root",} */;
添加dr0数据源
/*+ mycat:createDataSource{
  "name":"dr0",
  "password":"123456",  "url":"jdbc:mysql://127.0.0.1:3313?useUnicode=true&serverTimezone=UTC&characterEncoding=UTF-8",
  "user":"root",} */;
添加dw1数据源
/*+ mycat:createDataSource{
  "name":"dw1",
  "password":"123456",  "url":"jdbc:mysql://127.0.0.1:3314?useUnicode=true&serverTimezone=UTC&characterEncoding=UTF-8",
  "user":"root",} */;
添加dr1数据源
/*+ mycat:createDataSource{
  "name":"dr1",
  "password":"123456",  "url":"jdbc:mysql://127.0.0.1:3315?useUnicode=true&serverTimezone=UTC&characterEncoding=UTF-8",
  "user":"root",} */;
  
 # 配置集群
 /*! mycat:createCluster{
  "name":"c0",
  "masters":[
    "dw0"
  ],
  "replicas":[
    "dr0"
  ]
} */;
/*! mycat:createCluster{
  "name":"c1",
  "masters":[
    "dw1"
  ],
  "replicas":[
    "dr1"
  ]
} */;

#全局表的配置
CREATE DATABASE db1 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE db1;
CREATE TABLE `sys_dict` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `dict_type` INT  ,
  `dict_name` VARCHAR(100) DEFAULT NULL,
  `dict_value` INT ,
  PRIMARY KEY (`id`)
) ENGINE=INNODB  DEFAULT CHARSET=utf8mb4 BROADCAST;
#向全局表里面添加数据测试
INSERT INTO sys_dict(dict_type,dict_name,dict_value) VALUES(1,"男",1);
INSERT INTO sys_dict(dict_type,dict_name,dict_value) VALUES(1,"女",0);

#查询数据
SELECT * FROM sys_dict;



#创建订单表
CREATE TABLE orders(
   ID BIGINT NOT NULL AUTO_INCREMENT,
   ORDER_TYPE INT,
   CUSTOMER_ID INT,
   AMOUNT DECIMAL(10,2),
   PRIMARY KEY(ID)
) ENGINE=INNODB  DEFAULT CHARSET=utf8mb4
dbpartition BY mod_hash(CUSTOMER_ID) tbpartition BY mod_hash(CUSTOMER_ID) 
tbpartitions 1 dbpartitions 2

#向订单表里面添加数据
INSERT INTO ORDERS(ID,ORDER_TYPE,CUSTOMER_ID,AMOUNT) VALUES(1,101,100,100101);
INSERT INTO ORDERS(ID,ORDER_TYPE,CUSTOMER_ID,AMOUNT) VALUES(2,101,100,100101);
INSERT INTO ORDERS(ID,ORDER_TYPE,CUSTOMER_ID,AMOUNT) VALUES(3,101,100,100101);
INSERT INTO ORDERS(ID,ORDER_TYPE,CUSTOMER_ID,AMOUNT) VALUES(4,102,101,101102);
INSERT INTO ORDERS(ID,ORDER_TYPE,CUSTOMER_ID,AMOUNT) VALUES(5,102,101,101102);
INSERT INTO ORDERS(ID,ORDER_TYPE,CUSTOMER_ID,AMOUNT) VALUES(6,102,101,101102);

INSERT INTO ORDERS(ID,ORDER_TYPE,CUSTOMER_ID,AMOUNT) VALUES(7,102,102,101102);
INSERT INTO ORDERS(ID,ORDER_TYPE,CUSTOMER_ID,AMOUNT) VALUES(8,102,102,101102);
INSERT INTO ORDERS(ID,ORDER_TYPE,CUSTOMER_ID,AMOUNT) VALUES(9,102,102,101102);


INSERT INTO ORDERS(ORDER_TYPE,CUSTOMER_ID,AMOUNT) VALUES(102,102,101102);

#查询
SELECT * FROM orders;

#创建订单详情表

CREATE TABLE orders_detail(
  ID BIGINT AUTO_INCREMENT,
  detail VARCHAR(2000),
  order_id BIGINT,
  PRIMARY KEY(ID)
) ENGINE=INNODB  DEFAULT CHARSET=utf8mb4
dbpartition BY mod_hash(order_id) tbpartition BY mod_hash(order_id) 
tbpartitions 1 dbpartitions 2

# 添加详情
INSERT INTO orders_detail VALUES(1,"详情1",1);
INSERT INTO orders_detail VALUES(2,"详情2",2);
INSERT INTO orders_detail VALUES(3,"详情3",3);
INSERT INTO orders_detail VALUES(4,"详情4",4);
INSERT INTO orders_detail VALUES(5,"详情5",5);
INSERT INTO orders_detail VALUES(6,"详情6",6);


SELECT * FROM ORDERS O INNER JOIN orders_detail OD ON(O.ID=OD.order_id)


/*+ mycat:showErGroup{}*/
