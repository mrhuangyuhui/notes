# [ExpressJS - Hello World](https://www.tutorialspoint.com/expressjs/expressjs_hello_world.htm)

[搭建开发环境](https://gitee.com/mrhuangyuhui/notes/blob/master/manuals/node/express-manual.md)

安装工具包，自动监控文件变更并重启服务。

```bash
npm install -g nodemon
```

`myapp/app.js`

```js
const express = require('express')
const app = express()

app.get('/', function (req, res) {
    res.send('Hello World')
})

app.listen(3000)
```

启动服务器

```bash
nodemon app.js
```

发起请求

```bash
curl localhost:3000
```
