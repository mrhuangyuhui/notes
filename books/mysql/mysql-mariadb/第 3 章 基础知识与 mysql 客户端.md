# 第 3 章 基础知识与 mysql 客户端

## 3.2 连接到服务器

这种登录方式会提示输入密码
```bash
$ mysql -u russell -p
```

选项 `-p` 和密码之间不要留空格（这种登录方式不安全，密码会明文显示）
```bash
$ mysql -u russell -p666666
```

登录用户默认与当前系统用户名一致
```bash
$ mysql -p
```

登录后的提示信息
```bash
# 命令要以分号（;）或斜线 +g（\g）结尾
Welcome to the MySQL monitor.  Commands end with ; or \g.

# 此次连接的标识号
Your MySQL connection id is 15

# 版本号
Server version: 5.6.37 MySQL Community Server (GPL)

...

# help 是帮助命令，\c 是清除当前输入语句的命令
Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
```

此命令会介绍如何使用 mysql
```bash
mysql> help

For information about MySQL products and services, visit:
   http://www.mysql.com/
For developer information, including the MySQL Reference Manual, visit:
   http://dev.mysql.com/
To buy MySQL Enterprise support, training, or other products, visit:
   https://shop.mysql.com/

List of all MySQL commands:
Note that all text commands must be first on line and end with ';'
?         (\?) Synonym for `help'.
clear     (\c) Clear the current input statement.
connect   (\r) Reconnect to the server. Optional arguments are db and host.
delimiter (\d) Set statement delimiter.
edit      (\e) Edit command with $EDITOR.
ego       (\G) Send command to mysql server, display result vertically.
exit      (\q) Exit mysql. Same as quit.
go        (\g) Send command to mysql server.
help      (\h) Display this help.
nopager   (\n) Disable pager, print to stdout.
notee     (\t) Don't write into outfile.
pager     (\P) Set PAGER [to_pager]. Print the query results via PAGER.
print     (\p) Print current command.
prompt    (\R) Change your mysql prompt.
quit      (\q) Quit mysql.
rehash    (\#) Rebuild completion hash.
source    (\.) Execute an SQL script file. Takes a file name as an argument.
status    (\s) Get status information from the server.
system    (\!) Execute a system shell command.
tee       (\T) Set outfile [to_outfile]. Append everything into given outfile.
use       (\u) Use another database. Takes database name as argument.
charset   (\C) Switch to another charset. Might be needed for processing binlog with multi-byte charsets.
warnings  (\W) Show warnings after every statement.
nowarning (\w) Don't show warnings after every statement.

For server side help, type 'help contents'
```

此命令将 MySQL 或 MariaDB 的各种帮助分门别类地以列表展示出来
```bash
mysql> help contents
You asked for help about help category: "Contents"
For more information, type 'help <item>', where <item> is one of the following
categories:
   Account Management
   Administration
   Compound Statements
   Data Definition
   Data Manipulation
   Data Types
   Functions
   Functions and Modifiers for Use with GROUP BY
   Geographic Features
   Help Metadata
   Language Structure
   Plugins
   Procedures
   Storage Engines
   Table Maintenance
   Transactions
   User-Defined Functions
   Utility
```

此命令会将所有可用的数据操作语句显示出来
```bash
mysql> help Data Manipulation
You asked for help about help category: "Data Manipulation"
For more information, type 'help <item>', where <item> is one of the following
topics:
   CALL
   DELETE
   DO
   DUAL
   HANDLER
   INSERT
   INSERT DELAYED
   INSERT SELECT
   JOIN
   LOAD DATA
   LOAD XML
   REPLACE
   SELECT
   UNION
   UPDATE
```

查看具体某个命令的说明
```bash
mysql> help DELETE
```

取消输入到一半的 SQL 语句
```bash
mysql> show databases\c
```

## 3.3 开始探索数据库

查看数据库
```bash
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
+--------------------+
3 rows in set (0.00 sec)
```

> MySQL 不区分关键字（如 SHOW）的大小写，所以你可以用 show 甚至 sHoW。然而，数据库、表和列的名字却可能是区分大小写的。

> information_schema 数据库包含服务器的相关信息。mysql 数据库则存储着用户名、密码和权限。

### 3.3.1 第一条 SQL 语句

创建数据库
```bash
mysql> create database test;
```

切换数据库
```
mysql> use test
```

创建表
```bash
# 当前数据库就是 test
mysql> create table books(book_id int, title text, status int);

或

# 当前数据库不是 test
mysql> create table test.books(book_id int, title text, status int);
```

查看表
```bash
# 当前数据库就是 test
mysql> show tables;
+----------------+
| Tables_in_test |
+----------------+
| books          |
+----------------+

或

# 当前数据库不是 test
mysql> show tables from test;
+----------------+
| Tables_in_test |
+----------------+
| books          |
+----------------+
```

查看表结构
```
mysql> describe books;
+---------+---------+------+-----+---------+-------+
| Field   | Type    | Null | Key | Default | Extra |
+---------+---------+------+-----+---------+-------+
| book_id | int(11) | YES  |     | NULL    |       |
| title   | text    | YES  |     | NULL    |       |
| status  | int(11) | YES  |     | NULL    |       |
+---------+---------+------+-----+---------+-------+
```

### 3.3.2 插入和操作数据

插入数据
```bash
mysql> insert into books values(100, 'Heart of Darkness', 0);

mysql> insert into books values(101, 'The Catcher of the Rye', 1);

mysql> insert into books values(102, 'My Antonia', 0);
```

查询数据
```bash
mysql> select * from books;
+---------+------------------------+--------+
| book_id | title                  | status |
+---------+------------------------+--------+
|     100 | Heart of Darkness      |      0 |
|     101 | The Catcher of the Rye |      1 |
|     102 | My Antonia             |      0 |
+---------+------------------------+--------+
```

`WHERE` 子句
```bash
mysql> select * from books where status = 1;
+---------+------------------------+--------+
| book_id | title                  | status |
+---------+------------------------+--------+
|     101 | The Catcher of the Rye |      1 |
+---------+------------------------+--------+
```

使每条记录都分成多行来展示
```bash
mysql> select * from books where status = 0 \G
*************************** 1. row ***************************
book_id: 100
  title: Heart of Darkness
 status: 0
*************************** 2. row ***************************
book_id: 102
  title: My Antonia
 status: 0
```

更新数据
```bash
mysql> update books set status = 1 where book_id = 102;
```

同时更新多个字段
```bash
mysql> update books
    -> set title = 'The Catcher in the Rye', status = 0
    -> where book_id = 101;
```

### 3.3.3 再复杂一点

建立另一个表
```bash
mysql> create table status_names (status_id int, status_name char(8));

mysql> insert into status_names values(0, 'Inactive'), (1, 'Active');

mysql> select * from status_names;
+-----------+-------------+
| status_id | status_name |
+-----------+-------------+
|         0 | Inactive    |
|         1 | Active      |
+-----------+-------------+
```

表连接
```bash
mysql> select book_id, title, status_name
    -> from books join status_names
    -> where status = status_id;
+---------+------------------------+-------------+
| book_id | title                  | status_name |
+---------+------------------------+-------------+
|     100 | Heart of Darkness      | Inactive    |
|     101 | The Catcher in the Rye | Inactive    |
|     102 | My Antonia             | Active      |
+---------+------------------------+-------------+
```
