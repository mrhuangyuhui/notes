# [ExpressJS - Error Handling](https://gitee.com/mrhuangyuhui/notes/tree/master/tutorials/node/learn-expressjs/expressjs_error_handling.md)

<https://www.tutorialspoint.com/expressjs/expressjs_error_handling.htm>

```js
var express = require('express')
var app = express()

app.get('/', function (req, res) {
    var err = new Error('Something went wrong')
    next(err)
})
// 方法签名必须有四个参数
app.use(function (err, req, res, next) {
    res.status(500)
    res.send('Oops, something went wrong.')
})

app.listen(3000)
```

```bash
$ curl -i localhost:3000
HTTP/1.1 500 Internal Server Error
X-Powered-By: Express
Content-Type: text/html; charset=utf-8
Content-Length: 27
ETag: W/"1b-ksQEvAXATMbGNJH0Y/DsOWiPdBo"
Date: Wed, 20 Jun 2018 16:41:10 GMT
Connection: keep-alive

Oops, something went wrong.
```