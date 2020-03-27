# MySQL Replication

## 环境信息

- CentOS 6.9/7.5
- MySQL 5.6

## 拓扑结构

一主一从

- 主节点：master, 206.189.148.32
- 从节点：slave, 206.189.82.189

## 配置过程

主节点：配置

```bash
[root@master ~]$ vim /etc/my.cnf
[mysqld]
log-bin=mysql-bin
server-id=1
```

主节点：重启

```bash
# CentOS 7.5
[root@master ~]$ systemctl restart mysqld
# CentOS 6.9
[root@master ~]$ service mysqld restart
```

主节点：启动交互终端一（需要启动两个交互终端）

```bash
[root@master ~]$ mysql -uroot -p
```

主节点：创建专用的复制账号

```bash
# 主节点交互终端一
mysql> CREATE USER 'repl'@'%' IDENTIFIED BY '666666';
mysql> GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';
```

主节点：表加锁

```bash
# 主节点交互终端一
mysql> FLUSH TABLES WITH READ LOCK;
```

主节点：启动交互终端二，终端一保持打开。

```bash
[root@master ~]$ mysql -uroot -p
```

主节点：查看日志信息，从节点配置要用到相关信息，建议复制保存。

```bash
# 主节点交互终端二
mysql> SHOW MASTER STATUS;
+------------------+----------+--------------+------------------+-------------------+
| File             | Position | Binlog_Do_DB | Binlog_Ignore_DB | Executed_Gtid_Set |
+------------------+----------+--------------+------------------+-------------------+
| mysql-bin.000002 |      411 |              |                  |                   |
+------------------+----------+--------------+------------------+-------------------+
1 row in set (0.00 sec)
```

主节点：导出数据

```bash
[root@master ~]$ mysqldump -uroot -p --all-databases --master-data > dbdump.db
```

主节点：表解锁

```bash
# 主节点交互终端一
mysql> UNLOCK TABLES;
```

主节点：导出的数据传送到从节点

从节点：配置

```bash
[root@slave ~]$ vim /etc/my.cnf
[mysqld]
server-id=2
```

从节点：重启

```bash
# CentOS 7.5
[root@master ~]$ systemctl restart mysqld
# CentOS 6.9
[root@master ~]$ service mysqld restart
```

从节点：导入主节点的数据

```bash
[root@slave ~]$ mysql -uroot -p < dbdump.db
```

从节点：启动交互终端

```bash
[root@slave ~]$ mysql -uroot -p
```

从节点：配置主节点的连接信息和日志偏移量

```bash
CHANGE MASTER TO \
MASTER_HOST='206.189.148.32', \
MASTER_USER='repl', \
MASTER_PASSWORD='666666', \
MASTER_LOG_FILE='mysql-bin.000002', \
MASTER_LOG_POS=411;
```

从节点：开始复制

```bash
mysql> START SLAVE;
```

从节点：验证复制是否成功

```bash
mysql> SHOW SLAVE STATUS \G;
# 出现下面三行数据表示复制正常
Slave_IO_Running: Yes
Slave_SQL_Running: Yes
Seconds_Behind_Master: 0
```

参考文档：

MySQL 5.6 - [Chapter 17 Replication](https://dev.mysql.com/doc/refman/5.6/en/replication.html)

MySQL 5.7 - [Chapter 16 Replication](https://dev.mysql.com/doc/refman/5.7/en/replication.html)