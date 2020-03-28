<!-- omit in toc -->
# 《MongoDB 入门经典》学习笔记

- [环境部署](#%e7%8e%af%e5%a2%83%e9%83%a8%e7%bd%b2)
  - [Mac](#mac)
- [配套代码](#%e9%85%8d%e5%a5%97%e4%bb%a3%e7%a0%81)
- [电子书](#%e7%94%b5%e5%ad%90%e4%b9%a6)

## 环境部署

参考笔记 [MongoDB Manual](/manuals/mongodb-manual.md#install)

### Mac

[MongoDB 2.4.8](http://downloads.mongodb.org/osx/mongodb-osx-x86_64-2.4.8.tgz)

```bash
# 创建数据目录
mkdir -p /Users/yuhuihuang/mongodb/data/db/mongodb-24h

# 启动服务端
mongod --dbpath /Users/yuhuihuang/mongodb/data/db/mongodb-24h

# 启动客户端
mongo --host 127.0.0.1:27017
```

## 配套代码

<http://www.informit.com/store/nosql-with-mongodb-in-24-hours-sams-teach-yourself-9780672337130>

<https://gitee.com/mrhuangyuhui/mongodb/tree/master/mongodb-24h>

## 电子书

<https://mrhuangyuhui.gitee.io/books/rTSFcF.html>
