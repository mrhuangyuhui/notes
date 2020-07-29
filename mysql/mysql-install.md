# MySQL Install

### [YUM](https://dev.mysql.com/doc/refman/5.7/en/linux-installation-yum-repo.html)

环境信息：CentOS 6.9/7.3

下载和安装 MySQL Repo

[Download MySQL Yum Repository](https://dev.mysql.com/downloads/repo/yum/)

[A Quick Guide to Using the MySQL Yum Repository](https://dev.mysql.com/doc/mysql-yum-repo-quick-guide/en/)

```bash
# CentOS 7.3
wget https://repo.mysql.com/mysql80-community-release-el7-1.noarch.rpm
sudo yum localinstall mysql80-community-release-el7-1.noarch.rpm -y

# CentOS 6.9
wget https://repo.mysql.com/mysql80-community-release-el6-1.noarch.rpm
sudo yum localinstall mysql80-community-release-el6-1.noarch.rpm -y

# 查看所有 Repo
yum repolist all | grep mysql
```

安装 YUM 配置工具

```bash
# 安装 yum-config-manager
yum install yum-utils -y
```

选择 MySQL 版本

```bash
# MySQL 5.7
yum-config-manager --disable mysql80-community && yum-config-manager --enable mysql57-community

# MySQL 5.6
yum-config-manager --disable mysql80-community && yum-config-manager --enable mysql56-community
```

验证选择结果

```bash
yum repolist enabled | grep "mysql.*-community.*"
```

安装 MySQL Server

```bash
sudo yum install mysql-community-server -y
```

初始化数据库

```bash
# MySQL 5.7
mysqld --initialize-insecure --user=mysql

# MySQL 5.6
mysql_install_db --user=mysql
```

验证数据库是否初始化成功

```bash
ls -al /var/lib/mysql
```

启动 MySQL Server

```bash
# 不同操作系统和 MySQL 版本的启动方式不一样

# CentOS 7.3 + MySQL 5.6/5.7
systemctl start mysqld

# CentOS 6.9 + MySQL 5.6/5.7
service mysqld start

# CentOS 6.9 + MySQL 5.6/5.7
mysqld_safe --user=mysql &
```

停止 MySQL Server

```bash
# 不同操作系统和 MySQL 版本的停止方式不一样

# CentOS 7.3 + MySQL 5.6/5.7
systemctl stop mysqld

# CentOS 6.9 + MySQL 5.6/5.7
service mysqld stop

# CentOS 6.9 + MySQL 5.6/5.7
mysqladmin -u root shutdown
```

验证 MySQL Server 是否启动成功

```bash
mysqladmin version
mysqladmin variables
mysqlshow
mysqlshow mysql
mysql -e "SELECT User, Host, plugin FROM mysql.user" mysql
```

安全配置

```bash
mysql_secure_installation
```

相关链接：

- MySQL 5.7

[2.5.1 Installing MySQL on Linux Using the MySQL Yum Repository](https://dev.mysql.com/doc/refman/5.7/en/linux-installation-yum-repo.html)

[2.10.1.1 Initializing the Data Directory Manually Using mysqld](https://dev.mysql.com/doc/refman/5.7/en/data-directory-initialization-mysqld.html)

[2.10.2 Starting the Server](https://dev.mysql.com/doc/refman/5.7/en/starting-server.html)

[2.10.3 Testing the Server](https://dev.mysql.com/doc/refman/5.7/en/testing-server.html)

[2.10.4 Securing the Initial MySQL Account](https://dev.mysql.com/doc/refman/5.7/en/default-privileges.html)

- MySQL 5.6

[2.5.1 Installing MySQL on Linux Using the MySQL Yum Repository](https://dev.mysql.com/doc/refman/5.6/en/linux-installation-yum-repo.html)

[2.10.1 Initializing the Data Directory](https://dev.mysql.com/doc/refman/5.6/en/data-directory-initialization.html)

[2.10.2 Starting the Server](https://dev.mysql.com/doc/refman/5.6/en/starting-server.html)

[2.10.3 Testing the Server](https://dev.mysql.com/doc/refman/5.6/en/testing-server.html)

[2.10.4 Securing the Initial MySQL Accounts](https://dev.mysql.com/doc/refman/5.6/en/default-privileges.html)
