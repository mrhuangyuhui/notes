# [ExpressJS - Cookies](https://www.tutorialspoint.com/expressjs/expressjs_cookies.htm)

```bash
npm install --save cookie-parser
```

```js
const express = require('express')
const cookieParser = require('cookie-parser')

const app = express()

// 加载 Cookie 解析中间件
app.use(cookieParser())

app.get('/', function (req, res) {
    // 服务器响应带上一个 Cookie 返回给客户端
    res.cookie('fruit', 'Apple').send('cookie set')
})

app.listen(3000)
```

在浏览器控制台查看

```bash
> document.cookie
"_ga=GA1.1.916126669.1524328894; fruit=Apple"
```

## Adding Cookies with Expiration Time

设置 Cookie 的过期时间

```js
const express = require('express')
const cookieParser = require('cookie-parser')

const app = express()

// 加载 Cookie 解析中间件
app.use(cookieParser())

app.get('/', function (req, res) {
    // 方式一：指定一个过期时间
    // res.cookie('fruit', 'Apple', { expires: new Date(Date.now() + 900000) }).send('Adding Cookies with Expiration Time')

    // 方式二：指定一个存在时长
    res.cookie('animal', 'Dog', { maxAge: 900000 }).send('Adding Cookies with Expiration Time')
})

app.listen(3000)
```

在 Chrome 上查看 Cookie 的过期时间 <chrome://settings/cookies/detail?site=localhost>

## Deleting Existing Cookies

```js
const express = require('express')
const cookieParser = require('cookie-parser')

const app = express()

// 加载 Cookie 解析中间件
app.use(cookieParser())

app.get('/', function (req, res) {
    res.cookie('foo', 'bar').send('cookie set')
})

app.get('/clear_cookie_foo', function (req, res) {
    // 删除 Cookie
    res.clearCookie('foo')
    res.send('cookie cleared')
})

app.listen(3000)
```

在浏览器控制台查看

```bash
# 打开 http://localhost:3000
> document.cookie
"foo=bar" # 添加成功

# 打开 http://localhost:3000/clear_cookie_foo
> document.cookie
"" # 删除成功
```
