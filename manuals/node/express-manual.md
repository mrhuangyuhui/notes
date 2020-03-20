# Express Manual

- [Express Manual](#express-manual)
  - [Install](#install)
    - [Express Generator](#express-generator)
  - [Commands](#commands)
  - [References](#references)
  - [Middlewares](#middlewares)
  - [Tutorials](#tutorials)
  - [Examples](#examples)
  - [Misc](#misc)

<http://expressjs.com/>

<http://expressjs.com/zh-cn/>

<https://www.npmjs.com/package/express>

<https://github.com/expressjs/express/>

<https://github.com/expressjs/generator>

<https://github.com/expressjs/expressjs.com>

<https://github.com/topics/express>

<https://sourcegraph.com/github.com/expressjs/expressjs.com>

<https://sourcegraph.com/github.com/expressjs/express>

<https://gitee.com/mrhuangyuhui/express>

## Install

<https://expressjs.com/en/starter/installing.html>

> 注意：
>
> 要先安装 Node
>
> 安装工具包，自动监控文件变更并重启服务。
>
> ```bash
> npm install -g nodemon
> ```

```bash
mkdir myapp

cd myapp

# 初始化项目
npm init

# 安装依赖
npm install express --save

# 创建主文件
touch app.js
```

`myapp/app.js`

```js
const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => res.send('Hello World!'))

app.listen(port, () => console.log(`Example app listening on port ${port}!`))
```

启动服务器

```bash
node app.js
# 或
nodemon app.js # 自动监控文件变更并重启服务

# 发起请求
curl localhost:3000
```

### Express Generator

<https://expressjs.com/en/starter/generator.html>

> 使用脚手架创建 Express 项目

<https://github.com/expressjs/generator>

```bash
# 安装脚手架
npm install -g express-generator

# 查看安装结果
npm ls -g express-generator

# 创建项目（不需要视图引擎）
express --no-view myapp

cd myapp

# 安装依赖包
npm install

# 启动服务器
DEBUG=myapp:* npm start

# 发起请求
curl localhost:3000
```

## Commands

查看帮助

```bash
express -h
```

查看版本

```bash
express --version
```

创建项目

```bash
# 不需要视图引擎
express --no-view myapp

# 使用指定视图引擎
express --view=pug myapp
```

## References

[4.x API](http://expressjs.com/en/4x/api.html)

[Using middleware](http://expressjs.com/en/guide/using-middleware.html)

[Express middleware](http://expressjs.com/en/resources/middleware.html)

[Application Settings](http://expressjs.com/en/4x/api.html#app.settings.table)

[Serving static files in Express](http://expressjs.com/en/starter/static-files.html)

## Middlewares

[Express middleware](http://expressjs.com/en/resources/middleware.html)

## Tutorials

<http://expressjs.com/en/starter/installing.html>

[Learn ExpressJS](https://www.tutorialspoint.com/expressjs/index.htm)

## Examples

<https://github.com/vuejs/vue-router/blob/dev/examples/server.js>

<https://github.com/bailicangdu/node-elm>

<https://github.com/nswbmw/N-blog>

## Misc

Chrome Search Engine

```
https://sourcegraph.com/search?q=repo:%5Egithub%5C.com/expressjs/express%24+%s&patternType=literal
```
