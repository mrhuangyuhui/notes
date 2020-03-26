<!-- omit in toc -->
# MongoDB Manual

- [Install](#install)
  - [Docker](#docker)
  - [Mac](#mac)
- [Configs](#configs)
- [Commands](#commands)
  - [`mongod`](#mongod)
  - [`mongo`](#mongo)
- [References](#references)
- [Drivers](#drivers)
- [Clients](#clients)
- [GUI](#gui)
- [Books](#books)

<https://www.mongodb.com/>

<https://docs.mongodb.com/>

<https://docs.mongodb.com/guides/>

<https://docs.mongodb.com/manual/>

## Install

<https://docs.mongodb.com/master/administration/install-community/>

### Docker

<https://hub.docker.com/_/mongo>

```bash
docker pull mongo:4.2.3-bionic
```

Server

```bash
docker run -d --network mongo-network --name mongo-server \
  -e MONGO_INITDB_ROOT_USERNAME=mongoadmin \
  -e MONGO_INITDB_ROOT_PASSWORD=secret \
  mongo:4.2.3-bionic
```

Client

```bash
docker run -it --rm --network mongo-network mongo:4.2.3-bionic \
  mongo --host mongo-server \
    -u mongoadmin \
    -p secret \
    --authenticationDatabase admin \
    test
```

> 环境配置可参考 [Mac](#mac)

### Mac

<https://docs.mongodb.com/master/tutorial/install-mongodb-on-os-x/>

一、下载

- [最新版本](https://www.mongodb.com/download-center#production)
- [历史版本](https://www.mongodb.org/dl/osx)

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

五、启动服务端

```bash
mongod --dbpath ~/mongodb/data/db
```

六、验证启动结果

```bash
# 启动 Mongo shell 并连接服务器
mongo --host 127.0.0.1:27017
```

> Web 控制台 <http://localhost:28017/>

七、关闭服务端

```bash
# 在 Mongo shell 中关闭服务端
> use admin
> db.shutdownServer()
```

## Configs

<https://docs.mongodb.com/manual/reference/configuration-options/>

## Commands

### `mongod`

查看帮助

```bash
mongod -h
mongod --help
```

查看版本

```bash
mongod --version
```

启动服务端

```bash
# 指定数据目录
mongod --dbpath ~/mongodb/data/db
```

关闭服务端

```bash
# 在 Mongo shell 中关闭服务端
> use admin
> db.shutdownServer()
```

### `mongo`

启动客户端

```bash
mongo --host 127.0.0.1:27017
```

MongoDB shell 命令

```bash
# 查看帮助
> help

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

## Drivers

<https://docs.mongodb.com/manual/applications/drivers/>

## Clients

<https://www.npmjs.com/package/mongodb>

## GUI

<https://hub.docker.com/_/mongo-express>

[Robo 3T](https://robomongo.org/)

[MongoDB Compass](https://www.mongodb.com/download-center#compass)

## Books

[MongoDB 入门经典](https://mrhuangyuhui.gitee.io/books/UyE8mC.html)（[学习笔记](/books/mongodb/mongodb-24h/README.md)）
