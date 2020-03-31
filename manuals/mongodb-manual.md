<!-- omit in toc -->
# MongoDB Manual

- [Install](#install)
  - [Docker](#docker)
  - [Mac](#mac)
- [Configs](#configs)
- [Commands](#commands)
  - [`mongod`](#mongod)
  - [`mongo` Shell](#mongo-shell)
- [`mongo` Shell Methods](#mongo-shell-methods)
  - [Connection Methods](#connection-methods)
  - [Database Methods](#database-methods)
  - [Collection Methods](#collection-methods)
  - [Cursor Methods](#cursor-methods)
  - [User Management Methods](#user-management-methods)
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

[Configuration File Options](https://docs.mongodb.com/manual/reference/configuration-options/)

[Configuration File Settings and Command-Line Options Mapping](https://docs.mongodb.com/manual/reference/configuration-file-settings-command-line-options-mapping/)

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

### `mongo` Shell

<https://docs.mongodb.com/manual/reference/mongo-shell/>

启动客户端

```bash
mongo --host 127.0.0.1:27017
```

```
# 查看帮助
> help

# 退出
> exit

# 查看当前数据库
> db

# 切换数据库，如果不存在，则创建新的。
# 新创建的数据库由于没有数据，执行 `show dbs` 时不会列出。
> use newDB

# 列出全部数据库
> show dbs

# 列出全部集合
> show collections

# 列出数据库用户
> show users
```

```
> help
  db.help()                    help on db methods
  db.mycoll.help()             help on collection methods
  help admin                   administrative help
  help connect                 connecting to a db help
  show dbs                     show database names
  show collections             show collections in current database
  show users                   show users in current database
  use <db_name>                set current database
  db.foo.find()                list objects in collection foo
  db.foo.find( { a : 1 } )     list objects in foo where a == 1
  exit                         quit the mongo shell
```

```
> help admin
  ls([path])                      list files
  pwd()                           returns current directory
  cat(fname)                      returns contents of text file as a string
  removeFile(f)                   delete a file or directory
  load(jsfilename)                load and execute a .js file
```

## `mongo` Shell Methods

<https://docs.mongodb.com/manual/reference/method/>

### Connection Methods

<https://docs.mongodb.com/manual/reference/method/js-connection/>

[`Mongo()`](https://docs.mongodb.com/manual/reference/method/Mongo/#Mongo)

[`Mongo.getDB()`](https://docs.mongodb.com/manual/reference/method/Mongo.getDB/#Mongo.getDB)

### Database Methods

<https://docs.mongodb.com/manual/reference/method/js-database/>

[`db.createCollection()`](https://docs.mongodb.com/manual/reference/method/db.createCollection/#db.createCollection)

[`db.getCollection()`](https://docs.mongodb.com/manual/reference/method/db.getCollection/#db.getCollection)

[`db.getCollectionNames()`](https://docs.mongodb.com/manual/reference/method/db.getCollectionNames/#db.getCollectionNames)

[`db.dropDatabase()`](https://docs.mongodb.com/manual/reference/method/db.dropDatabase/#db.dropDatabase)

[`db.stats()`](https://docs.mongodb.com/manual/reference/method/db.stats/#db.stats)

### Collection Methods

<https://docs.mongodb.com/manual/reference/method/js-collection/>

[`db.collection.drop()`](https://docs.mongodb.com/manual/reference/method/db.collection.drop/#db.collection.drop)

[`db.collection.find()`](https://docs.mongodb.com/manual/reference/method/db.collection.find/#db.collection.find)

[`db.collection.findOne()`](https://docs.mongodb.com/manual/reference/method/db.collection.findOne/#db.collection.findOne)

### Cursor Methods

<https://docs.mongodb.com/manual/reference/method/js-cursor/>

[`cursor.limit()`](https://docs.mongodb.com/manual/reference/method/cursor.limit/#cursor.limit)

[`cursor.forEach()`](https://docs.mongodb.com/manual/reference/method/cursor.forEach/#cursor.forEach)

[`cursor.map()`](https://docs.mongodb.com/manual/reference/method/cursor.map/#cursor.map)

### User Management Methods

<https://docs.mongodb.com/manual/reference/method/js-user-management/>

[`db.createUser()`](https://docs.mongodb.com/manual/reference/method/db.createUser/#db.createUser)

[`db.getUsers()`](https://docs.mongodb.com/manual/reference/method/db.getUsers/#db.getUsers)

[`db.getUser()`](https://docs.mongodb.com/manual/reference/method/db.getUser/#db.getUser)

[`db.dropUser()`](https://docs.mongodb.com/manual/reference/method/db.dropUser/#db.dropUser)

[`db.dropAllUsers()`](https://docs.mongodb.com/manual/reference/method/db.dropAllUsers/#db.dropAllUsers)

## References

<https://docs.mongodb.com/manual/>

<https://docs.mongodb.com/manual/reference/>

[The `mongo` Shell](https://docs.mongodb.com/manual/mongo/)

[`mongo` Shell Quick Reference](https://docs.mongodb.com/manual/reference/mongo-shell/)

<!-- omit in toc -->
### 部署本地站点

下载文档 <http://docs.mongodb.com/v4.2/manual.tar.gz>

- 使用 `docker run`

```bash
cd mongodb-manual-v4.2

docker run --name mongodb-docs -v `pwd`/html:/usr/share/nginx/html:ro -p 80:80 -d nginx:1.16.1-alpine
```

- 使用 `docker-compose`

```bash
cd mongodb-manual-v4.2

docker-compose up
```

`docker-compose.yml`

```yml
version: "3.7"
services:
  web:
    image: nginx:1.16.1-alpine
    volumes:
      - ./html/:/usr/share/nginx/html/
    ports:
      - "80:80"
```

![img](https://gitee.com/mrhuangyuhui/images/raw/master/mongodb/mongodb-docs-docker.jpg)

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

<https://github.com/mongo-express/mongo-express>

## Books

[MongoDB 入门经典](https://mrhuangyuhui.gitee.io/books/UyE8mC.html)（[学习笔记](/books/mongodb/mongodb-24h/README.md)）

## Misc

<http://docs.mongodb.com/v4.2/manual.tar.gz>

<http://docs.mongodb.com/v4.2/MongoDB-manual.epub>
