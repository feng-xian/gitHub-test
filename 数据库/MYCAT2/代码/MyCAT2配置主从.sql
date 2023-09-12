添加读写的数据源
/*+ mycat:createDataSource{
  "dbType":"mysql",
  "idleTimeout":60000,
  "initSqls":[],
  "initSqlsGetConnection":true,
  "instanceType":"READ_WRITE",
  "maxCon":1000,
  "maxConnectTimeout":3000,
  "maxRetryCount":5,
  "minCon":1,
  "name":"m1",
  "password":"123456",
  "type":"JDBC",
  "url":"jdbc:mysql://127.0.0.1:3307?useUnicode=true&serverTimezone=UTC&characterEncoding=UTF-8",
  "user":"root",
  "weight":0
} */;
添加读的数据源
/*+ mycat:createDataSource{
  "dbType":"mysql",
  "idleTimeout":60000,
  "initSqls":[],
  "initSqlsGetConnection":true,
  "instanceType":"READ",
  "maxCon":1000,
  "maxConnectTimeout":3000,
  "maxRetryCount":5,
  "minCon":1,
  "name":"m1s1",
  "password":"123456",
  "type":"JDBC",
  "url":"jdbc:mysql://127.0.0.1:3308?useUnicode=true&serverTimezone=UTC&characterEncoding=UTF-8",
  "user":"root",
  "weight":0
} */;
查询数据源
/*+ mycat:showDataSources{} */
7.3创建集群
/*! mycat:createCluster{
  "clusterType":"MASTER_SLAVE",
  "heartbeat":{
    "heartbeatTimeout":1000,
    "maxRetry":3,
    "minSwitchTimeInterval":300,
    "slaveThreshold":0
  },
  "masters":[
    "m1"
  ],
  "maxCon":2000,
  "name":"prototype",
  "readBalanceType":"BALANCE_ALL",
  "replicas":[
    "m1s1"
  ],
  "switchType":"SWITCH"
} */;
5.4.3显示集群
/*+ mycat:showClusters{} */


7.5创建逻辑库
CREATE DATABASE db1 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

创建表
USE DB1
CREATE TABLE SYS_USER(
    ID BIGINT PRIMARY KEY,
    USERNAME VARCHAR(200) NOT NULL,
    ADDRESS  VARCHAR(500)
)
添加数据
INSERT INTO SYS_USER(ID,USERNAME,ADDRESS) VALUES(1,"XIAOMING","WUHAN");
查询数据
SELECT * FROM SYS_USER;

删除数据库
DROP DATABASE db1;