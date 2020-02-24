# [PostgreSQL Tutorial 学习笔记](http://www.postgresqltutorial.com/)

下载测试数据

<http://www.postgresqltutorial.com/postgresql-sample-database/>

[加载测试数据](http://www.postgresqltutorial.com/load-postgresql-sample-database/)

> 注意：测试数据已下载并解压到本目录 `dvdrental.tar`

```bash
$ yum install -y unzip

# 解压后得到 dvdrental.tar
$ unzip /tmp/dvdrental.zip

# 切换到 Linux 账户
$ su - postgres

# 登录控制台
-bash-4.2$ psql

# 修改密码
postgres> \password
Enter new password:
Enter it again:

# 创建数据库
postgres> CREATE DATABASE dvdrental;
CREATE DATABASE

# 退出到 bash
postgres>\q

# 导入数据库
-bash-4.2$ pg_restore -d dvdrental /tmp/dvdrental.tar

# 重新登录控制台并连接测试数据库
-bash-4.2$ psql dvdrental
psql (10.4)
Type "help" for help.

dvdrental>
```