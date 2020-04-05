<!-- #mongodb-tutorial -->
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
mkdir -p ~/mongodb/data/db

# 启动服务端
mongod --dbpath ~/mongodb/data/db

# 启动客户端
mongo --host 127.0.0.1:27017
```

加载测试数据

```bash
# 注意：第 2 行的变量名错误！
> load('/Users/yuhuihuang/repos/notes/books/mongodb/mongodb-24h/codes/hour05/generate_words.js')
```

## 配套代码

<https://gitee.com/mrhuangyuhui/mongodb-24h>

```bash
git clone git@gitee.com:mrhuangyuhui/mongodb-24h.git
```

## 电子书

<https://mrhuangyuhui.gitee.io/books/UyE8mC.html>
