<!-- omit in toc -->
# MongoDB Manual

- [Install](#install)
  - [Docker](#docker)
  - [Mac](#mac)
- [Configs](#configs)
- [Commands](#commands)
  - [`mongod`](#mongod)
  - [`mongo`](#mongo)
  - [User Management Commands](#user-management-commands)
  - [Role Management Commands](#role-management-commands)
- [References](#references)
- [Drivers](#drivers)
- [GUI](#gui)
  - [MongoDB Compass](#mongodb-compass)
  - [Robo 3T](#robo-3t)
  - [mongo-express](#mongo-express)
- [Books](#books)
- [Misc](#misc)

<https://www.mongodb.com/>

<https://docs.mongodb.com/>

<https://docs.mongodb.com/manual/>

<https://docs.mongodb.com/guides/>

<https://github.com/mongodb/mongo>

<https://github.com/mongodb/docs>

<https://github.com/mongodb-js/compass/>

## Install

<https://docs.mongodb.com/master/administration/install-community/>

### Docker

<https://hub.docker.com/_/mongo>

```bash
docker pull mongo:4.2.5-bionic
```

Server

```bash
docker run -d --network mongo-network --name mongo-server \
  -e MONGO_INITDB_ROOT_USERNAME=mongoadmin \
  -e MONGO_INITDB_ROOT_PASSWORD=secret \
  mongo:4.2.5-bionic
```

Client

```bash
docker run -it --rm --network mongo-network mongo:4.2.5-bionic \
  mongo --host mongo-server \
    -u mongoadmin \
    -p secret \
    --authenticationDatabase admin \
    test
```

> 环境配置可参考 [Mac](#mac)

### Mac

<https://docs.mongodb.com/master/tutorial/install-mongodb-on-os-x/>

- 下载

<https://www.mongodb.com/download-center/community>

<https://fastdl.mongodb.org/osx/mongodb-macos-x86_64-4.2.5.tgz>

老版本 <https://www.mongodb.org/dl/osx>

下载到目录 `~/mongodb`

- 解压

- 配置 `PATH`

```bash
ln -s ~/mongodb/mongodb-macos-x86_64-4.2.5/ current

echo 'export MONGODB_HOME=~/mongodb/current' >> ~/.bash_profile

echo 'export PATH=${PATH}:${MONGODB_HOME}/bin' >> ~/.bash_profile
```

- 创建数据目录

```bash
mkdir -p ~/mongodb/data/db
```

- 启动服务端

```bash
mongod --dbpath ~/mongodb/data/db
```

- 启动客户端

```bash
mongo --host 127.0.0.1:27017
```

> Web 控制台 <http://localhost:28017/>

- 关闭服务端

```bash
# 在 Mongo shell 中关闭服务端
> use admin
> db.shutdownServer()
```

## Configs

<https://docs.mongodb.com/manual/reference/configuration-options/>

## Commands

### `mongod`

```bash
mongod -h
mongod --help
```

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

<https://docs.mongodb.com/manual/reference/mongo-shell/>

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

# 切换数据库，如果数据库不存在，则创建新的。
# 新创建的数据库由于没有数据，执行 `show dbs` 时不会列出。
> use newDB

# 列出全部集合
> show collections

# 列出数据库用户
> show users
```

### User Management Commands

<https://docs.mongodb.com/manual/reference/command/nav-user-management/>

<https://docs.mongodb.com/manual/reference/command/nav-user-management/index.html>

### Role Management Commands

<https://docs.mongodb.com/manual/reference/command/nav-role-management/>

## References

<https://docs.mongodb.com/manual/>

<https://docs.mongodb.com/manual/reference/>

[The `mongo` Shell](https://docs.mongodb.com/manual/mongo/)

[`mongo` Shell Quick Reference](https://docs.mongodb.com/manual/reference/mongo-shell/)

## Drivers

<https://docs.mongodb.com/manual/applications/drivers/>

<<https://www.npmjs.com/package/mongodb>>

## GUI

### MongoDB Compass

<https://docs.mongodb.com/compass/current/>

[Download and Install Compass](https://docs.mongodb.com/compass/current/install/)

[Connect to MongoDB](https://docs.mongodb.com/compass/current/connect/)

### Robo 3T

[Robo 3T](https://robomongo.org/)

### mongo-express

<https://hub.docker.com/_/mongo-express>

## Books

[MongoDB 入门经典](https://mrhuangyuhui.gitee.io/books/UyE8mC.html)（[学习笔记](/books/mongodb/mongodb-24h/README.md)）

## Misc

<http://docs.mongodb.com/v4.2/manual.tar.gz>

<http://docs.mongodb.com/v4.2/MongoDB-manual.epub>
