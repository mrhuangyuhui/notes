# MySQL Commands

MySQL 5.6

- [Chapter 4 MySQL Programs](https://dev.mysql.com/doc/refman/5.6/en/programs.html)

MySQL 5.7

- [Chapter 4 MySQL Programs](https://dev.mysql.com/doc/refman/5.7/en/programs.html)

## `mysqld`

启动/停止/重启服务器

```bash
# CentOS 7.3 + MySQL 5.6/5.7
systemctl start mysqld
systemctl stop mysqld
systemctl restart mysqld

# CentOS 6.9 + MySQL 5.6/5.7
service mysqld start
service mysqld stop
service mysqld restart
```

## `mysql`

```bash
mysql --help
```

命令行选项说明

选项 | 说明
--- | ---
-h, --host=name | 登录主机
-P, --port=# | 登录端口
-u, --user=name | 登录用户
-p, --password[=name] | 登录密码
-D, --database=name | 要使用的数据库
-e, --execute=name | 执行 SQL 语句

执行脚本

```bash
mysql -h localhost -u root -p -D mydb < my.sql

# 或在交互终端内执行
mysql> source /tmp/my.sql;
mysql> \. /tmp/my.sql
```
