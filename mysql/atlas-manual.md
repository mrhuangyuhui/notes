# Atlas Manual

<https://github.com/Qihoo360/Atlas>

[Atlas 的安装](https://github.com/Qihoo360/Atlas/wiki/Atlas%E7%9A%84%E5%AE%89%E8%A3%85)

[Atlas 的运行及常见问题](https://github.com/Qihoo360/Atlas/wiki/Atlas%E7%9A%84%E8%BF%90%E8%A1%8C%E5%8F%8A%E5%B8%B8%E8%A7%81%E9%97%AE%E9%A2%98)

[Atlas 版本列表](https://github.com/Qihoo360/Atlas/releases)

环境信息：CentOS 6.9, MySQL 5.6, Atlas 2.2.1

拓扑结构：一主一从一代理

- Master 209.97.171.99
- Slave 206.189.47.137
- Atlas 209.97.163.58

Master/Slave 主机：安装 MySQL Server 和配置主从复制，查看相关笔记

- [MySQL Manual](https://gitee.com/mrhuangyuhui/notes/blob/master/manuals/mysql-manual.md)
- [MySQL Replication](https://gitee.com/mrhuangyuhui/notes/blob/master/snippets/mysql/mysql-replication.md)

Atlas 主机：安装 MySQL 客户端，同样可以参考上述笔记。

Atlas 主机：安装 Atlas

```bash
# 下载软件包
wget https://github.com/Qihoo360/Atlas/releases/download/2.2.1/Atlas-2.2.1.el6.x86_64.rpm

# 安装软件
sudo yum localinstall Atlas-2.2.1.el6.x86_64.rpm -y

# 查看安装目录
ls -al /usr/local/mysql-proxy

# 密码加密，后面配置文件要用。
$ /usr/local/mysql-proxy/bin/encrypt 666666
gnqsKkYutpM=

# 配置文件，配置说明查看注释。
$ vim /usr/local/mysql-proxy/conf/test.cnf
# 主数据的 IP 地址和端口
proxy-backend-addresses = 209.97.171.99:3306
# 从数据的 IP 地址和端口
proxy-read-only-backend-addresses = 206.189.47.137:3306
# 主、从数据库的账号密码
pwds = user1:gnqsKkYutpM=, user2:gnqsKkYutpM=

# 启动
sudo /usr/local/mysql-proxy/bin/mysql-proxyd test start
# 重启
sudo /usr/local/mysql-proxy/bin/mysql-proxyd test restart
# 停止
sudo /usr/local/mysql-proxy/bin/mysql-proxyd test stop

# 验证启动结果
$ netstat -tulnp | grep mysql-proxy
tcp        0      0 0.0.0.0:2345                0.0.0.0:*                   LISTEN      1649/mysql-proxy
tcp        0      0 0.0.0.0:1234                0.0.0.0:*                   LISTEN      1649/mysql-proxy
```

Master/Slave 主机：创建以下账号并授予所有权限（和 Atlas 配置文件上的要保持一致，IP 地址是 Atlas 主机的 IP 地址）

```bash
# user1=666666
mysql> GRANT ALL ON *.* TO 'user1'@'209.97.163.58' IDENTIFIED BY '666666';
# user2=666666
mysql> GRANT ALL ON *.* TO 'user2'@'209.97.163.58' IDENTIFIED BY '666666';
mysql> FLUSH PRIVILEGES;
```

Atlas 主机：验证能否登录主、从数据库

```bash
# 主数据库
mysql -h209.97.171.99 -uuser1 -p
mysql -h209.97.171.99 -uuser2 -p
# 从数据库
mysql -h206.189.47.137 -uuser1 -p
mysql -h206.189.47.137 -uuser2 -p
```

Atlas 主机：如果能连上则证明 Atlas 初步测试正常，可以再尝试发几条 SQL 语句看看执行结果是否正确。

```bash
mysql -h127.0.0.1 -P1234 -uuser1 -p666666

mysql> SELECT User, Host, plugin FROM mysql.user;
```

Atlas 主机：进入管理界面

```bash
# 账号密码对应配置文件上的以下两项
# admin-username = user
# admin-password = pwd
mysql -h127.0.0.1 -P2345 -uuser -ppwd

# 输入以下命令查看管理数据库的各类命令
mysql> SELECT * FROM help;
```