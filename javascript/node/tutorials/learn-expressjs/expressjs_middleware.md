# [ExpressJS - Middleware](https://www.tutorialspoint.com/expressjs/expressjs_middleware.htm)

```js
const express = require('express')
const app = express()

// 对所有请求使用中间件函数
app.use(function (req, res, next) {
    console.dir(req.originalUrl)
    console.dir("A new request received at " + Date.now())
    // 继续下一个中间件函数
    next()
})

app.get('/apple', function (req, res) {
    res.send(req.originalUrl)
})

app.get('/banana', function (req, res) {
    res.send(req.originalUrl)
})

app.listen(3000)
```

```bash
$ nodemon app.js
# 观察中间件函数的输出
'/apple'
'A new request received at 1570695406946'
'/banana'
'A new request received at 1570695411173'

$ curl localhost:3000/apple
/apple

$ curl localhost:3000/banana
/banana
```

```js
const express = require('express')
const app = express()

// 对指定请求使用中间件函数
app.use('/apple', function (req, res, next) {
    console.dir(req.originalUrl)
    console.dir("A new request received at " + Date.now())
    next()
})

app.get('/apple', function (req, res) {
    res.send('apple')
})

app.get('/banana', function (req, res) {
    res.send('banana')
})

app.listen(3000)
```

```bash
$ nodemon app.js
# 观察中间件函数的输出
'/apple'
'A new request received at 1570695072180'

$ curl localhost:3000/apple
/apple

$ curl localhost:3000/banana
/banana
```

<http://expressjs.com/en/guide/using-middleware.html>

## Order of Middleware Calls

```js
const express = require('express')
const app = express()

// 调整以下三个代码段的顺序，观察输出结果。

app.use(function (req, res, next) {
    console.dir('Apple: ' + Date.now())
    // 添加/取消注释，观察输出结果。
    next()
})

app.use('/', function (req, res, next) {
    console.dir('Orange: ' + Date.now())
    // 添加/取消注释，观察输出结果。
    next()
})

app.get('/', function (req, res, next) {
    console.dir('Banana: ' + Date.now())
    res.send(req.originalUrl)
    // 添加/取消注释，观察输出结果。
    next()
})

app.listen(3000)
```

## Third Party Middleware

<http://expressjs.com/en/resources/middleware.html>
