5.2.1创建用户
/*+ mycat:createUser{
  "username":"user",
  "password":"",
  "ip":"127.0.0.1",
  "transactionType":"xa"
} */

5.2.3显示用户
/*+ mycat:showUsers */

5.2.2删除用户
/*+ mycat:dropUser{
  "username":"user"} */
  

5.3.1创建数据源
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
  "name":"dc2",
  "password":"123456",
  "type":"JDBC",
  "url":"jdbc:mysql://127.0.0.1:3306?useUnicode=true&serverTimezone=UTC&characterEncoding=UTF-8",
  "user":"root",
  "weight":0
} */;  
5.3.3显示数据源
/*+ mycat:showDataSources{} */

5.3.2删除数据源
/*+ mycat:dropDataSource{
  "dbType":"mysql",
  "idleTimeout":60000,
  "initSqls":[],
  "initSqlsGetConnection":true,
  "instanceType":"READ_WRITE",
  "maxCon":1000,
  "maxConnectTimeout":3000,
  "maxRetryCount":5,
  "minCon":1,
  "name":"dc2",
  "type":"JDBC",
  "weight":0
} */;

/*! mycat:createCluster{
  "clusterType":"MASTER_SLAVE",
  "heartbeat":{
    "heartbeatTimeout":1000,
    "maxRetry":3,
    "minSwitchTimeInterval":300,
    "slaveThreshold":0
  },
  "masters":[
    "dc1" //主节点
  ],
  "maxCon":2000,
  "name":"c0",
  "readBalanceType":"BALANCE_ALL",
  "replicas":[
    "dc2" //从节点
  ],
  "switchType":"SWITCH"
} */;

5.4.2删除集群
/*! mycat:dropCluster{
  "name":"c0"
} */;

5.4.3显示集群
/*+ mycat:showClusters{} */

  