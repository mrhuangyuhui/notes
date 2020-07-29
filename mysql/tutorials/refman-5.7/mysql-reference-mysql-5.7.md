# [MySQL 5.7 Reference Manual](https://dev.mysql.com/doc/refman/5.7/en/)

## Indexes ([5.6](https://dev.mysql.com/doc/refman/5.6/en/indexes.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/indexes.html))

## Example Databases

### [Employees Sample Database](https://dev.mysql.com/doc/employee/en/)

https://github.com/datacharmer/test_db

```bash
shell< mysql < employees.sql
```

[Sakila Sample Database](https://dev.mysql.com/doc/sakila/en/)

---

## Chapter 2 Installing and Upgrading MySQL ([5.6](https://dev.mysql.com/doc/refman/5.6/en/installing.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/installing.html))

### 2.5 Installing MySQL on Linux ([5.6](https://dev.mysql.com/doc/refman/5.6/en/linux-installation.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/linux-installation.html))

#### 2.5.1 Installing MySQL on Linux Using the MySQL Yum Repository ([5.6](https://dev.mysql.com/doc/refman/5.6/en/linux-installation-yum-repo.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/linux-installation-yum-repo.html))

[Download MySQL Yum Repository](https://dev.mysql.com/downloads/repo/yum/)

[A Quick Guide to Using the MySQL Yum Repository](https://dev.mysql.com/doc/mysql-yum-repo-quick-guide/en/)

**[install-mysql-yum-centos.sh](https://github.com/mrhuangyuhui/mysql-practice/blob/master/install-mysql-yum-centos.sh)**
```bash
./install-mysql-yum-centos.sh centos6 mysql56
```

#### 2.5.3 Installing MySQL on Linux Using the MySQL APT Repository ([5.6](https://dev.mysql.com/doc/refman/5.6/en/linux-installation-apt-repo.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/linux-installation-apt-repo.html))

[Download MySQL APT Repository](https://dev.mysql.com/downloads/repo/apt/)

[A Quick Guide to Using the MySQL APT Repository](https://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/)

```bash
## Ubuntu 14.04/16.04/17.04, Debian 7.11/8.9/9.1 ##
$ wget https://repo.mysql.com//mysql-apt-config_0.8.7-1_all.deb
$ sudo dpkg -i mysql-apt-config_0.8.7-1_all.deb

## Configuring mysql-apt-config ##
# Ubuntu 16.04/17.04 only has MySQL >=5.7

$ sudo apt-get update
$ sudo apt-get install -y mysql-server

## Configuring mysql-community-server ##

## Switch to another supported major release series at any time ##
$ sudo dpkg-reconfigure mysql-apt-config
$ sudo apt-get update
```

### 2.10 Postinstallation Setup and Testing ([5.6](https://dev.mysql.com/doc/refman/5.6/en/postinstallation.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/postinstallation.html))

#### 2.10.1 Initializing the Data Directory ([5.6](https://dev.mysql.com/doc/refman/5.6/en/data-directory-initialization.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/data-directory-initialization.html))

##### MySQL 5.6

---

```bash
## CentOS 6.9/7.3 ##
mysql_install_db --user=mysql
```

[`mysql_install_db`](https://dev.mysql.com/doc/refman/5.6/en/mysql-install-db.html) — Initialize MySQL Data Directory 

##### MySQL 5.7

---

###### [2.10.1.1 Initializing the Data Directory Manually Using mysqld](https://dev.mysql.com/doc/refman/5.7/en/data-directory-initialization-mysqld.html)

```bash
## CentOS 6.9/7.3 ##
$ mysqld --initialize-insecure --user=mysql

# Check whether the data directory is initialiazed.
$ ls -al /var/lib/mysql
```

###### [2.10.1.2 Initializing the Data Directory Manually Using mysql_install_db](https://dev.mysql.com/doc/refman/5.7/en/data-directory-initialization-mysql-install-db.html)

#### 2.10.2 Starting the Server ([5.6](https://dev.mysql.com/doc/refman/5.6/en/starting-server.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/starting-server.html))

Start the server
```bash
## CentOS 6.9, Ubuntu 14.04, Debian 7.11/8.9(MySQL 5.6)/9.1(MySQL 5.6) ##
mysqld_safe --user=mysql &

## CentOS 6.9, Ubuntu 14.04/16.04/17.04, Debian 7.11/8.9/9.1 ##
service mysql start

## CentOS 7.3 ##
systemctl start mysqld

## Ubuntu 16.04/17.04, Debian 8.9/9.1 ##
systemctl start mysql
```

Shut down the server
```bash
## CentOS 6.9, Ubuntu 14.04/16.04/17.04, Debian 7.11/8.9/9.1 ##
mysqladmin -u root shutdown

## CentOS 6.9, Ubuntu 14.04/16.04/17.04, Debian 7.11/8.9/9.1 ##
service mysql stop

## CentOS 7.3 ##
systemctl stop mysqld

## Ubuntu 16.04/17.04, Debian 8.9/9.1 ##
systemctl stop mysql
```

`mysqld_safe` — MySQL Server Startup Script ([5.6](https://dev.mysql.com/doc/refman/5.6/en/mysqld-safe.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/mysqld-safe.html))

#### 2.10.3 Testing the Server ([5.6](https://dev.mysql.com/doc/refman/5.6/en/testing-server.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/testing-server.html))

Simple tests to check whether the server is up and responding to connections
```bash
## CentOS 6.9/7.3, Ubuntu 14.04/16.04/17.04, Debian 7.11/8.9/9.1 ##
$ mysqladmin version
$ mysqladmin variables
```

Verify that you can retrieve information from the server
```bash
## CentOS 6.9/7.3, Ubuntu 14.04/16.04/17.04, Debian 7.11/8.9/9.1 ##
$ mysqlshow
$ mysqlshow mysql
$ mysql -e "SELECT User, Host, plugin FROM mysql.user" mysql
```

#### 2.10.4 Securing the Initial MySQL Accounts ([5.6](https://dev.mysql.com/doc/refman/5.6/en/default-privileges.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/default-privileges.html))

```bash
## CentOS 6.9/7.3, Ubuntu 14.04/16.04/17.04, Debian 7.11/8.9/9.1 ##
$ mysql_secure_installation
```

`mysql_secure_installation` — Improve MySQL Installation Security ([5.6](https://dev.mysql.com/doc/refman/5.6/en/mysql-secure-installation.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/mysql-secure-installation.html))

---

## Chapter 3 Tutorial ([5.6](https://dev.mysql.com/doc/refman/5.6/en/tutorial.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/tutorial.html))

### 3.1 Connecting to and Disconnecting from the Server ([5.6](https://dev.mysql.com/doc/refman/5.6/en/connecting-disconnecting.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/connecting-disconnecting.html))

```bash
$ mysql -h host -u user -p
```

If you are logging in on the same machine that MySQL is running on, you can omit the host, and simply use the following:
```bash
$ mysql -u user -p
```

After you have connected successfully, you can disconnect any time by typing QUIT (or \q) at the mysql> prompt:
```bash
mysql> QUIT
```

### 3.4 Getting Information About Databases and Tables ([5.6](https://dev.mysql.com/doc/refman/5.6/en/getting-information.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/getting-information.html))

You have previously seen SHOW DATABASES, which lists the databases managed by the server. To find out which database is currently selected, use the DATABASE() function:
```bash
mysql> SELECT DATABASE();
```

```bash
mysql> SHOW TABLES;
```

```bash
mysql> DESCRIBE pet;
```

### 3.5 Using mysql in Batch Mode ([5.6](https://dev.mysql.com/doc/refman/5.6/en/batch-mode.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/batch-mode.html))

```bash
$ mysql -h host -u user -p < batch-file
```

```bash
mysql> source filename;
mysql> \. filename
```

---

## Chapter 4 MySQL Programs ([5.6](https://dev.mysql.com/doc/refman/5.6/en/programs.html))

### 4.2 Using MySQL Programs ([5.6](https://dev.mysql.com/doc/refman/5.6/en/programs-using.html))

#### 4.2.2 Connecting to the MySQL Server ([5.6](https://dev.mysql.com/doc/refman/5.6/en/connecting.html))

```
$ mysql --host=localhost --user=myname --password mydb
$ mysql -h localhost -u myname -p mydb
```

You can specify connection parameters in the `[client]` section of an option file. The relevant section of the file might look like this:

```
[client]
host=host_name
user=user_name
password=your_pass
```

#### 4.2.6 Using Option Files ([5.6](https://dev.mysql.com/doc/refman/5.6/en/option-files.html))

To determine whether a program reads option files, invoke it with the `--help` option. (For `mysqld`, use `--verbose` and `--help`.) If the program reads option files, the help message indicates which files it looks for and which option groups it recognizes.

**Option Files Read on Unix and Unix-Like Systems**
File Name | Purpose
---|---
/etc/my.cnf	| Global options
/etc/mysql/my.cnf | Global options
SYSCONFDIR/my.cnf | Global options
$MYSQL_HOME/my.cnf | Server-specific options (server only)
defaults-extra-file	| The file specified with --defaults-extra-file, if any
~/.my.cnf | User-specific options
~/.mylogin.cnf | User-specific login path options (clients only)

#### 4.2.7 Command-Line Options that Affect Option-File Handling ([5.6](https://dev.mysql.com/doc/refman/5.6/en/option-file-options.html))

Most MySQL programs that support option files handle the following options. Because these options affect option-file handling, they must be given on the command line and not in an option file. To work properly, each of these options must be given before other options.

- `--defaults-extra-file=file_name`

- `--defaults-file=file_name`

- `--no-defaults`

#### 4.2.8 Using Options to Set Program Variables ([5.6](https://dev.mysql.com/doc/refman/5.6/en/program-variables.html))

Many MySQL programs have internal variables that can be set at runtime using the `SET` statement.

Most of these program variables also can be set at server startup by using the same syntax that applies to specifying program options. 

```
$ mysql --max_allowed_packet=16777216
$ mysql --max_allowed_packet=16M
```

### 4.3 MySQL Server and Server-Startup Programs ([5.6](https://dev.mysql.com/doc/refman/5.6/en/programs-server.html))

#### 4.3.1 `mysqld` — The MySQL Server ([5.6](https://dev.mysql.com/doc/refman/5.6/en/mysqld.html))

`mysqld`, also known as MySQL Server, is the main program that does most of the work in a MySQL installation. MySQL Server manages access to the MySQL data directory that contains databases and tables. **The data directory is also the default location for other information such as log files and status files.**

The `mysqld` program has many options that can be specified at startup. For a complete list of options, run this command:
```
$ mysqld --verbose --help
```

#### 4.3.2 `mysqld_safe` — MySQL Server Startup Script ([5.6](https://dev.mysql.com/doc/refman/5.6/en/mysqld-safe.html))

`mysqld_safe` reads all options from the `[mysqld]`, `[server]`, and `[mysqld_safe]` sections in option files.

**`mysqld_safe` Options**
Format | Description
---|---
--basedir | Path to MySQL installation directory
--datadir | Path to data directory
--defaults-extra-file | Read named option file in addition to usual option files
--defaults-file	| Read only named option file
--help | Display help message and exit
--log-error	| Write error log to named file
--no-defaults | Read no option files
--pid-file | Path name of server process ID file
--port | Port number on which to listen for TCP/IP connections
--socket | Socket file on which to listen for Unix socket connections
--user | Run mysqld as user having name user_name or numeric user ID user_id

### 4.4 MySQL Installation-Related Programs ([5.6](https://dev.mysql.com/doc/refman/5.6/en/programs-installation.html))

#### 4.4.3 `mysql_install_db` — Initialize MySQL Data Directory ([5.6](https://dev.mysql.com/doc/refman/5.6/en/mysql-install-db.html))

As of MySQL 5.6.8, on Unix platforms, `mysql_install_db` creates a default option file named `my.cnf` in the base installation directory. This file is created from a template included in the distribution package named `my-default.cnf`. You can find the template in or under the base installation directory. When started using `mysqld_safe`, the server uses `my.cnf` file by default. If `my.cnf` already exists, `mysql_install_db` assumes it to be in use and writes a new file named `my-new.cnf` instead.

**`mysql_install_db` Options**

Format | Description
---|---
--basedir | Path to base directory
--datadir | Path to data directory
--defaults-extra-file | Read named option file in addition to usual option files
--defaults-file	| Read only named option file
--force	| Run even if DNS does not work	 
--help | Display help message and exit
--keep-my-cnf | Keep existing my.cnf file, do not create new one
--no-defaults | Read no option files
--skip-name-resolve	| Use IP addresses rather than host names in grant tables
--user | System login user under which to execute mysqld

#### 4.4.5 `mysql_secure_installation` — Improve MySQL Installation Security ([5.6](https://dev.mysql.com/doc/refman/5.6/en/mysql-secure-installation.html))

```
$ mysql_secure_installation
```

### 4.5 MySQL Client Programs ([5.6](https://dev.mysql.com/doc/refman/5.6/en/programs-client.html))

#### 4.5.1 `mysql` — The MySQL Command-Line Tool ([5.6](https://dev.mysql.com/doc/refman/5.6/en/mysql.html))

```
$ mysql --user=user_name --password db_name
```

```
$ mysql db_name < script.sql > output.tab
```

##### 4.5.1.1 `mysql` Options ([5.6](https://dev.mysql.com/doc/refman/5.6/en/mysql-command-options.html))

`mysql` supports the following options, which can be specified on the command line or in the `[mysql]` and `[client]` groups of an option file. 

Format | Description
---|---
--database | The database to use
--defaults-extra-file | Read named option file in addition to usual option files
--defaults-file	| Read only named option file
--execute | Execute the statement and quit
--help | Display help message and exit
--host | Connect to MySQL server on given host
--no-defaults | Read no option files
--password | Password to use when connecting to server
--port | TCP/IP port number to use for connection
--socket | For connections to localhost, the Unix socket file or Windows named pipe to use
--user | MySQL user name to use when connecting to server
--version | Display version information and exit

##### 4.5.1.2 `mysql` Commands ([5.6](https://dev.mysql.com/doc/refman/5.6/en/mysql-commands.html))

```
mysql> help

List of all MySQL commands:
Note that all text commands must be first on line and end with ';'
?         (\?) Synonym for `help'.
clear     (\c) Clear command.
connect   (\r) Reconnect to the server. Optional arguments are db and host.
delimiter (\d) Set statement delimiter.
exit      (\q) Exit mysql. Same as quit.
help      (\h) Display this help.
quit      (\q) Quit mysql.
source    (\.) Execute an SQL script file. Takes a file name as an argument.
status    (\s) Get status information from the server.
system    (\!) Execute a system shell command.
use       (\u) Use another database. Takes database name as argument.

For server side help, type 'help contents'
```

##### 4.5.1.3 `mysql` Logging ([5.6](https://dev.mysql.com/doc/refman/5.6/en/mysql-logging.html))

On Unix, the `mysql` client logs statements executed interactively to a history file. By default, this file is named `.mysql_history` in your home directory. To specify a different file, set the value of the `MYSQL_HISTFILE` environment variable.

##### 4.5.1.4 `mysql` Server-Side Help ([5.6](https://dev.mysql.com/doc/refman/5.6/en/mysql-server-side-help.html))

```
mysql> help contents
You asked for help about help category: "Contents"
For more information, type 'help <item>', where <item> is one of the
following categories:
   Account Management
   Administration
   Data Definition
   Data Manipulation
   Data Types
   Functions
   Functions and Modifiers for Use with GROUP BY
   Geographic Features
   Language Structure
   Plugins
   Storage Engines
   Stored Routines
   Table Maintenance
   Transactions
   Triggers
```

##### 4.5.1.5 Executing SQL Statements from a Text File ([5.6](https://dev.mysql.com/doc/refman/5.6/en/mysql-batch-commands.html))

```
$ mysql db_name < text_file
```

```
mysql> source file_name
mysql> \. file_name
```

#### 4.5.2 `mysqladmin` — Client for Administering a MySQL Server ([5.6](https://dev.mysql.com/doc/refman/5.6/en/mysqladmin.html))

```
$ mysqladmin [options] command [command-arg] [command [command-arg]] ...
```

Format | Description
---|---
create db_name | Create a new database named db_name.
drop db_name | Delete the database named db_name and all its tables.
extended-status | Display the server status variables and their values.
flush-privileges | Reload the grant tables (same as reload).
ping | Check whether the server is available.
processlist | Show a list of active server threads.
reload | Reload the grant tables.
shutdown | Stop the server.
start-slave | Start replication on a slave server.
status | Display a short server status message.
stop-slave | Stop replication on a slave server.
variables | Display the server system variables and their values.
version | Display version information from the server.

#### 4.5.4 `mysqldump` — A Database Backup Program ([5.6](https://dev.mysql.com/doc/refman/5.6/en/mysqldump.html))

To make a backup of an entire database:
```
$ mysqldump db_name > backup-file.sql
```

To load the dump file back into the server:
```
$ mysql db_name < backup-file.sql
```

Another way to reload the dump file:
```
$ mysql -e "source /path-to-backup/backup-file.sql" db_name
```

`mysqldump` is also very useful for populating databases by copying data from one MySQL server to another:
```
$ mysqldump --opt db_name | mysql --host=remote_host -C db_name
```

You can dump several databases with one command:
```
$ mysqldump --databases db_name1 [db_name2 ...] > my_databases.sql
```

To dump all databases, use the `--all-databases` option:
```
$ mysqldump --all-databases > all_databases.sql
```

#### 4.5.6 `mysqlshow` — Display Database, Table, and Column Information ([5.6](https://dev.mysql.com/doc/refman/5.6/en/mysqlshow.html))

The `mysqlshow` client can be used to quickly see which databases exist, their tables, or a table's columns or indexes.

```
$ mysqlshow [options] [db_name [tbl_name [col_name]]]
```

### 4.6 MySQL Administrative and Utility Programs ([5.6](https://dev.mysql.com/doc/refman/5.6/en/programs-admin-utils.html))

#### 4.6.8 `mysqlbinlog` — Utility for Processing Binary Log Files ([5.6](https://dev.mysql.com/doc/refman/5.6/en/mysqlbinlog.html))

The server's binary log consists of files containing “events” that describe modifications to database contents. The server writes these files in binary format. To display their contents in text format, use the `mysqlbinlog` utility. You can also use `mysqlbinlog` to display the contents of relay log files written by a slave server in a replication setup because relay logs have the same format as binary logs. 

```
$ mysqlbinlog [options] log_file ...
```

#### 4.6.9 `mysqldumpslow` — Summarize Slow Query Log Files ([5.6](https://dev.mysql.com/doc/refman/5.6/en/mysqldumpslow.html))

The MySQL slow query log contains information about queries that take a long time to execute. `mysqldumpslow` parses MySQL slow query log files and prints a summary of their contents.

```
$ mysqldumpslow [options] [log_file ...]
```

### 4.9 MySQL Program Environment Variables ([5.6](https://dev.mysql.com/doc/refman/5.6/en/environment-variables.html))


Variable | Description
---|---
MYSQL_HISTFILE | The path to the mysql history file. If this variable is set, its value overrides the default for $HOME/.mysql_history.
MYSQL_HISTIGNORE | Patterns specifying statements not to log to $HOME/.mysql_history.
MYSQL_HOME | The path to the directory in which the server-specific my.cnf file resides.
MYSQL_HOST | The default host name used by the mysql command-line client.

---

## Chapter 5 MySQL Server Administration ([5.6](https://dev.mysql.com/doc/refman/5.6/en/server-administration.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/server-administration.html))

### 5.1 The MySQL Server ([5.6](https://dev.mysql.com/doc/refman/5.6/en/mysqld-server.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/mysqld-server.html))

#### 5.1.1 Configuring the Server ([5.6](https://dev.mysql.com/doc/refman/5.6/en/server-configuration.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/server-configuration.html))

To determine the command option and system variable values used by the server, execute this command:
```bash
$ mysqld --verbose --help
```

To see the current system variable values used by the server as it runs, connect to it and execute this statement:
```bash
mysql> SHOW VARIABLES;
```

To see some statistical and status indicators for a running server, execute this statement:
```bash
mysql> SHOW STATUS;
```

System variable and status information also is available using the mysqladmin command:
```bash
$ mysqladmin variables
$ mysqladmin extended-status
```

#### 5.1.2 Server Configuration Defaults ([5.6](https://dev.mysql.com/doc/refman/5.6/en/server-configuration-defaults.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/server-configuration-defaults.html))

#### 5.1.3 Server Option and Variable Reference ([5.6](https://dev.mysql.com/doc/refman/5.6/en/mysqld-option-tables.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/mysqld-option-tables.html))

#### 5.1.4 Server Command Options ([5.6](https://dev.mysql.com/doc/refman/5.6/en/server-options.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/server-options.html))

```bash
$ mysqld --verbose --help
```

#### 5.1.5 Server System Variables ([5.6](https://dev.mysql.com/doc/refman/5.6/en/server-system-variables.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/server-system-variables.html))

#### 5.1.6 Using System Variables ([5.6](https://dev.mysql.com/doc/refman/5.6/en/using-system-variables.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/using-system-variables.html))

**SET Syntax for Variable Assignment ([5.6](https://dev.mysql.com/doc/refman/5.6/en/set-variable.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/set-variable.html))**

**SHOW VARIABLES Syntax ([5.6](https://dev.mysql.com/doc/refman/5.6/en/show-variables.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/show-variables.html))**

To display system variable names and values, use the `SHOW VARIABLES` statement:
```bash
mysql> SHOW VARIABLES;
```

With a `LIKE` clause, the statement displays only those variables that match the pattern. To obtain a specific variable name, use a `LIKE` clause as shown:
```bash
mysql> SHOW VARIABLES LIKE 'max_join_size';
mysql> SHOW SESSION VARIABLES LIKE 'max_join_size';
```

To get a list of variables whose name match a pattern, use the `%` wildcard character in a `LIKE` clause:
```bash
mysql> SHOW VARIABLES LIKE '%size%';
mysql> SHOW GLOBAL VARIABLES LIKE '%size%';
```

##### 5.1.6.2 Dynamic System Variables ([5.6](https://dev.mysql.com/doc/refman/5.6/en/dynamic-system-variables.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/dynamic-system-variables.html))

#### 5.1.7 Server Status Variables ([5.6](https://dev.mysql.com/doc/refman/5.6/en/server-status-variables.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/server-status-variables.html))

```bash
mysql> SHOW GLOBAL STATUS;
```

Many status variables are reset to 0 by the `FLUSH STATUS` statement.

### 5.2 The MySQL Data Directory ([5.6](https://dev.mysql.com/doc/refman/5.6/en/data-directory.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/data-directory.html))

### 5.3 The mysql System Database ([5.6](https://dev.mysql.com/doc/refman/5.6/en/system-database.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/system-database.html))

### 5.4 MySQL Server Logs ([5.6](https://dev.mysql.com/doc/refman/5.6/en/server-logs.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/server-logs.html))

#### 5.4.1 Selecting General Query and Slow Query Log Output Destinations ([5.6](https://dev.mysql.com/doc/refman/5.6/en/log-destinations.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/log-destinations.html))

#### 5.4.2 The Error Log ([5.6](https://dev.mysql.com/doc/refman/5.6/en/error-log.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/error-log.html))

#### 5.4.3 The General Query Log ([5.6](https://dev.mysql.com/doc/refman/5.6/en/query-log.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/query-log.html))

#### 5.4.4 The Binary Log ([5.6](https://dev.mysql.com/doc/refman/5.6/en/binary-log.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/binary-log.html))

`log-bin` `max_binlog_size` `binlog-do-db` `binlog-ignore-db` `replicate-do-db` `replicate-ignore-db` `sync_binlog`

`mysqlbinlog`([5.6](https://dev.mysql.com/doc/refman/5.6/en/mysqlbinlog.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/mysqlbinlog.html)) — Utility for Processing Binary Log Files

##### 5.4.4.1 Binary Logging Formats ([5.6](https://dev.mysql.com/doc/refman/5.6/en/binary-log-formats.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/binary-log-formats.html))

`--binlog-format={ROW|STATEMENT|MIXED}`

##### 5.4.4.2 Setting The Binary Log Format ([5.6](https://dev.mysql.com/doc/refman/5.6/en/binary-log-setting.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/binary-log-setting.html))

The logging format also can be switched at runtime. To specify the format globally for all clients, set the global value of the binlog_format system variable:
```bash
mysql> SET GLOBAL binlog_format = 'STATEMENT';
mysql> SET GLOBAL binlog_format = 'ROW';
mysql> SET GLOBAL binlog_format = 'MIXED';
```

An individual client can control the logging format for its own statements by setting the session value of binlog_format:
```bash
mysql> SET SESSION binlog_format = 'STATEMENT';
mysql> SET SESSION binlog_format = 'ROW';
mysql> SET SESSION binlog_format = 'MIXED';
```

#### 5.4.5 The Slow Query Log ([5.6](https://dev.mysql.com/doc/refman/5.6/en/slow-query-log.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/slow-query-log.html))

`long_query_time` `slow_query_log` `slow_query_log_file` `log-output`

`mysqldumpslow`([5.6](https://dev.mysql.com/doc/refman/5.6/en/mysqldumpslow.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/mysqldumpslow.html)) — Summarize Slow Query Log Files

#### 5.4.7 Server Log Maintenance ([5.6](https://dev.mysql.com/doc/refman/5.6/en/log-file-maintenance.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/log-file-maintenance.html))

---

## Chapter 6 Security

### 6.2 The MySQL Access Privilege System ([5.6](https://dev.mysql.com/doc/refman/5.6/en/privilege-system.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/privilege-system.html))

#### 6.2.1 Privileges Provided by MySQL ([5.6](https://dev.mysql.com/doc/refman/5.6/en/privileges-provided.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/privileges-provided.html))

#### 6.2.3 Specifying Account Names ([5.6](https://dev.mysql.com/doc/refman/5.6/en/account-names.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/account-names.html))

#### 6.2.6 When Privilege Changes Take Effect ([5.6](https://dev.mysql.com/doc/refman/5.6/en/privilege-changes.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/privilege-changes.html))

To tell the server to reload the grant tables, perform a flush-privileges operation. This can be done by issuing a `FLUSH PRIVILEGES` statement or by executing a `mysqladmin flush-privileges` or `mysqladmin reload` command.

### 6.3 MySQL User Account Management ([5.6](https://dev.mysql.com/doc/refman/5.6/en/user-account-management.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/user-account-management.html))

#### 6.3.1 User Names and Passwords ([5.6](https://dev.mysql.com/doc/refman/5.6/en/user-names.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/user-names.html))

> MySQL stores accounts in the user table of the mysql system database. An account is defined in terms of a user name and the client host or hosts from which the user can connect to the server. 

To connect to a MySQL server with a command-line client, specify user name and password options as necessary for the account that you want to use:
```bash
$ mysql --user=finley --password db_name
```

If you prefer short options, the command looks like this:
```bash
$ mysql -u finley -p db_name
```

If you omit the password value following the --password or -p option on the command line (as just shown), the client prompts for one. Alternatively, the password can be specified on the command line:
```bash
$ mysql --user=finley --password=password db_name
$ mysql -u finley -ppassword db_name
```
If you use the -p option, there must be no space between -p and the following password value.

#### 6.3.2 Adding User Accounts ([5.6](https://dev.mysql.com/doc/refman/5.6/en/adding-users.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/adding-users.html ))

The following example uses CREATE USER and GRANT statements to set up four accounts:
```bash
mysql> CREATE USER 'finley'@'localhost' IDENTIFIED BY 'some_pass';
mysql> GRANT ALL PRIVILEGES ON *.* TO 'finley'@'localhost'
    ->     WITH GRANT OPTION;
mysql> CREATE USER 'finley'@'%' IDENTIFIED BY 'some_pass';
mysql> GRANT ALL PRIVILEGES ON *.* TO 'finley'@'%'
    ->     WITH GRANT OPTION;
mysql> CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin_pass';
mysql> GRANT RELOAD,PROCESS ON *.* TO 'admin'@'localhost';
mysql> CREATE USER 'dummy'@'localhost';
```

To see the privileges for an account, use `SHOW GRANTS`:
```bash
mysql> SHOW GRANTS FOR 'admin'@'localhost';
```

To see nonprivilege properties for an account, use `SHOW CREATE USER`:
```bash
## MySQL 5.7 ##
mysql> SHOW CREATE USER 'admin'@'localhost'\G
```

The next examples create three accounts and grant them access to specific databases. Each of them has a user name of custom and password of obscure:
```bash
mysql> CREATE USER 'custom'@'localhost' IDENTIFIED BY 'obscure';
mysql> GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP
    ->     ON bankaccount.*
    ->     TO 'custom'@'localhost';
mysql> CREATE USER 'custom'@'host47.example.com' IDENTIFIED BY 'obscure';
mysql> GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP
    ->     ON expenses.*
    ->     TO 'custom'@'host47.example.com';
mysql> CREATE USER 'custom'@'%.example.com' IDENTIFIED BY 'obscure';
mysql> GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP
    ->     ON customer.*
    ->     TO 'custom'@'%.example.com';
```

#### 6.3.3 Removing User Accounts ([5.6](https://dev.mysql.com/doc/refman/5.6/en/removing-users.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/removing-users.html))

To remove an account, use the DROP USER statement. For example:
```bash
mysql> DROP USER 'jeffrey'@'localhost';
```

#### 6.3.4 Setting Account Resource Limits ([5.6](https://dev.mysql.com/doc/refman/5.6/en/user-resources.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/user-resources.html))

To establish resource limits for an account, use the GRANT statement. Provide a WITH clause that names each resource to be limited. The default value for each limit is zero (no limit). For example, to create a new account that can access the customer database, but only in a limited fashion, issue these statements:
```bash
mysql> CREATE USER 'francis'@'localhost' IDENTIFIED BY 'frank';
mysql> GRANT ALL ON customer.* TO 'francis'@'localhost'
    ->     WITH MAX_QUERIES_PER_HOUR 20
    ->          MAX_UPDATES_PER_HOUR 10
    ->          MAX_CONNECTIONS_PER_HOUR 5
    ->          MAX_USER_CONNECTIONS 2;
```

To modify limits for an existing account, use a GRANT USAGE statement at the global level (ON `*.*`). The following statement changes the query limit for francis to 100:
```bash
mysql> GRANT USAGE ON *.* TO 'francis'@'localhost'
    ->     WITH MAX_QUERIES_PER_HOUR 100;
```
The statement modifies only the limit value specified and leaves the account otherwise unchanged.

To remove a limit, set its value to zero. For example, to remove the limit on how many times per hour francis can connect, use this statement:
```bash
mysql> GRANT USAGE ON *.* TO 'francis'@'localhost'
    ->     WITH MAX_CONNECTIONS_PER_HOUR 0;
```

#### 6.3.5 Assigning Account Passwords ([5.6](https://dev.mysql.com/doc/refman/5.6/en/assigning-passwords.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/assigning-passwords.html))

**To assign a password when you create a new account, use `CREATE USER` and include an `IDENTIFIED BY` clause:**
```bash
mysql> CREATE USER 'jeffrey'@'localhost' IDENTIFIED BY 'mypass';
```

**To assign or change a password for an existing account, use one of the following methods:**

Use `SET PASSWORD` with the `PASSWORD()` function:
```
## 5.6 ##
mysql> SET PASSWORD FOR 'jeffrey'@'localhost' = PASSWORD('mypass');

# If you are not connected as an anonymous user, you can change your own password by omitting the FOR clause:
mysql> SET PASSWORD = PASSWORD('mypass');
```

Use the `ALTER USER` statement with an `IDENTIFIED BY` clause:
```bash
## 5.7 ##
mysql> ALTER USER 'jeffrey'@'localhost' IDENTIFIED BY 'mypass';

# If you are not connected as an anonymous user, you can change your own password without naming your own account literally:
mysql> ALTER USER USER() IDENTIFIED BY 'mypass';
```

Use a `GRANT USAGE` statement at the global level (ON `*.*`) to change an account password without affecting the account's current privileges:
```bash
## 5.6 ##
mysql> GRANT USAGE ON *.* TO 'jeffrey'@'localhost' IDENTIFIED BY 'mypass';
```

To change an account password from the command line, use the mysqladmin command:
```bash
$ mysqladmin -u user_name -h host_name password "new_password"
```

#### 6.3.6 Password Expiration and Sandbox Mode ([5.6](https://dev.mysql.com/doc/refman/5.6/en/password-expiration-sandbox-mode.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/password-expiration-sandbox-mode.html))

To expire an account password, use the `ALTER USER` statement. For example:
```bash
mysql> ALTER USER 'myuser'@'localhost' PASSWORD EXPIRE;
```

## Chapter 11 Data Types ([5.6](https://dev.mysql.com/doc/refman/5.6/en/data-types.html), [5.7](https://dev.mysql.com/doc/refman/5.7/en/data-types.html))

## Chapter 17 Replication ([5.6](https://dev.mysql.com/doc/refman/5.6/en/replication.html))

### Quick Start

- **Master**

```
# my.cnf
[mysqld]
log-bin=mysql-bin
server-id=1
```

```
# Session 1
CREATE USER 'repl'@'%' IDENTIFIED BY '666666';
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';
```

```
# Session 1
FLUSH TABLES WITH READ LOCK;
```

```
# Session 2
SHOW MASTER STATUS;
```

```bash
mysqldump --all-databases --master-data > dbdump.db
```

```
# Session 1
UNLOCK TABLES;
```

- **Slave**

```bash
mysql < dbdump.db
```

```
CHANGE MASTER TO \
MASTER_HOST='128.199.177.76', \
MASTER_USER='repl', \
MASTER_PASSWORD='666666', \
MASTER_LOG_FILE='mysql-bin.000001', \
MASTER_LOG_POS=411;
```

```
START SLAVE;
```

```
SHOW SLAVE STATUS \G;

Slave_IO_Running: Yes
Slave_SQL_Running: Yes
Seconds_Behind_Master: 0
```

### 17.1 Replication Configuration ([5.6](https://dev.mysql.com/doc/refman/5.6/en/replication-configuration.html))

#### 17.1.1 How to Set Up Replication ([5.6](https://dev.mysql.com/doc/refman/5.6/en/replication-howto.html))

##### 17.1.1.1 Setting the Replication Master Configuration ([5.6](https://dev.mysql.com/doc/refman/5.6/en/replication-howto-masterbaseconfig.html))

```
# Master
[mysqld]
log-bin=mysql-bin
server-id=1
```
After making the changes, restart the server.

##### 17.1.1.2 Setting the Replication Slave Configuration ([5.6](https://dev.mysql.com/doc/refman/5.6/en/replication-howto-slavebaseconfig.html))

```
# Slave
[mysqld]
server-id=2
```
After making the changes, restart the server.

##### 17.1.1.3 Creating a User for Replication ([5.6](https://dev.mysql.com/doc/refman/5.6/en/replication-howto-repuser.html))

```
# Master
mysql> CREATE USER 'repl'@'%.mydomain.com' IDENTIFIED BY 'slavepass';
mysql> GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%.mydomain.com';
```

##### 17.1.1.4 Obtaining the Replication Master Binary Log Coordinates ([5.6](https://dev.mysql.com/doc/refman/5.6/en/replication-howto-masterstatus.html))

To obtain the master binary log coordinates, follow these steps:

Start a session on the master by connecting to it with the command-line client, and flush all tables and block write statements by executing the `FLUSH TABLES WITH READ LOCK` statement:
```
# Master
mysql> FLUSH TABLES WITH READ LOCK;
```

> **Warning**
> Leave the client from which you issued the `FLUSH TABLES` statement running so that the read lock remains in effect. If you exit the client, the lock is released.


**In a different session** on the master, use the `SHOW MASTER STATUS` statement to determine the current binary log file name and position:
```
# Master
mysql> SHOW MASTER STATUS;
```

##### 17.1.1.5 Creating a Data Snapshot Using `mysqldump` ([5.6](https://dev.mysql.com/doc/refman/5.6/en/replication-howto-mysqldump.html))

```bash
# Master
mysqldump --all-databases --master-data > dbdump.db
```

```
# Master
mysql> UNLOCK TABLES;
```

##### 17.1.1.8 Setting Up Replication with Existing Data ([5.6](https://dev.mysql.com/doc/refman/5.6/en/replication-howto-existingdata.html))

```bash
# Slave
mysql < fulldb.dump
```

```
# Slave
mysql> START SLAVE;
```

##### 17.1.1.10 Setting the Master Configuration on the Slave ([5.6](https://dev.mysql.com/doc/refman/5.6/en/replication-howto-slaveinit.html))

```
mysql> CHANGE MASTER TO
    ->     MASTER_HOST='master_host_name',
    ->     MASTER_USER='replication_user_name',
    ->     MASTER_PASSWORD='replication_password',
    ->     MASTER_LOG_FILE='recorded_log_file_name',
    ->     MASTER_LOG_POS=recorded_log_position;
```