# MongoDB Manual

- [MongoDB Manual](#mongodb-manual)
  - [Install](#install)
    - [Docker](#docker)
    - [Mac](#mac)
  - [Commands](#commands)
    - [`mongod`](#mongod)
    - [`mongo`](#mongo)
  - [References](#references)
  - [Clients](#clients)
  - [GUI](#gui)

<https://www.mongodb.com/>

<https://docs.mongodb.com/>

<https://docs.mongodb.com/manual/>

<https://docs.mongodb.com/manual/reference/configuration-options/>

<https://docs.mongodb.com/manual/applications/drivers/>

## Install

<https://docs.mongodb.com/master/administration/install-community/>

### Docker

<https://hub.docker.com/_/mongo>

### Mac

<https://docs.mongodb.com/master/tutorial/install-mongodb-on-os-x/>

一、下载：[最新版本](https://www.mongodb.com/download-center#production) [历史版本](https://www.mongodb.org/dl/osx)

二、解压

三、配置环境变量

```bash
echo 'export MONGODB_HOME=~/mongodb/current' >> ~/.bash_profile
echo 'export PATH=${PATH}:${MONGODB_HOME}/bin' >> ~/.bash_profile
```

四、创建数据目录

```bash
mkdir -p ~/mongodb/data/db
```

五、启动服务器

```bash
mongod --dbpath ~/mongodb/data/db
```

六、验证启动结果

```bash
# 启动 Mongo Shell 并连接服务器
mongo --host 127.0.0.1:27017
```

七、关闭服务器

```bash
# 在 Mongo Shell 中关闭服务器
> use admin
switched to db admin
> db.shutdownServer()
server should be down...
```

## Commands

### `mongod`

启动服务器

```bash
mongod --dbpath ~/mongodb/data/db
```

### `mongo`

```bash
# 启动
$ mongo --host 127.0.0.1:27017
MongoDB shell version v3.4.6
connecting to: mongodb://127.0.0.1:27017/
MongoDB server version: 3.4.6

# 退出
> quit()

# 查看帮助
> db.help()

# 查看当前数据库
> db
test

# 列出全部数据库
> show dbs
admin  0.000GB
local  0.000GB

# 切换数据库
> use test
switched to db test

# 列出全部集合
> show collections

# 列出数据库用户
> show users
```

## References

<https://docs.mongodb.com/manual/>

<https://docs.mongodb.com/manual/reference/>

## Clients

<https://www.npmjs.com/package/mongodb>

## GUI

<https://hub.docker.com/_/mongo-express>

[Robo 3T](https://robomongo.org/)

[MongoDB Compass](https://www.mongodb.com/download-center#compass)
