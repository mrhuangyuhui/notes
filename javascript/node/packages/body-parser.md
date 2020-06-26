# [body-parser](https://gitee.com/mrhuangyuhui/notes/blob/master/manuals/node/body-parser.md)

<https://www.npmjs.com/package/body-parser>

```js
var bodyParser = require('body-parser')
```

## References

API

- [`bodyParser.json([options])`](https://www.npmjs.com/package/body-parser#bodyparserjsonoptions)

JSON 数据解析器

- [`bodyParser.urlencoded([options])`](https://www.npmjs.com/package/body-parser#bodyparserurlencodedoptions)

urlencoded 数据解析器

例子

```bash
# 发送 urlencoded 数据
$ curl -X POST --data "name=Toy%20story&year=1995&rating=8.5" http://localhost:3000/movies
{"message":"New movie created","location":"/movies/105"}
```

## [Examples](https://www.npmjs.com/package/body-parser#examples)

对所有路由应用解析器

```js
var express = require('express')
var bodyParser = require('body-parser')

var app = express()

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())

app.use(function (req, res) {
  res.setHeader('Content-Type', 'text/plain')
  res.write('you posted:\n')
  res.end(JSON.stringify(req.body, null, 2))
})
```

对特定的路由应用解析器

```js
var express = require('express')
var bodyParser = require('body-parser')

var app = express()

// create application/json parser
var jsonParser = bodyParser.json()

// create application/x-www-form-urlencoded parser
var urlencodedParser = bodyParser.urlencoded({ extended: false })

// POST /login gets urlencoded bodies
app.post('/login', urlencodedParser, function (req, res) {
  if (!req.body) return res.sendStatus(400)
  res.send('welcome, ' + req.body.username)
})

// POST /api/users gets JSON bodies
app.post('/api/users', jsonParser, function (req, res) {
  if (!req.body) return res.sendStatus(400)
  // create user in req.body
})
```

## Articles

<https://www.cnblogs.com/chyingp/p/nodejs-learning-express-body-parser.html>