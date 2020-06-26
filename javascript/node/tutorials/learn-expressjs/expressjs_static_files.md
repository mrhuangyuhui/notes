# [ExpressJS - Static Files](https://www.tutorialspoint.com/expressjs/expressjs_static_files.htm)

安装模板引擎

```bash
npm install --save pug
```

`views/static.pug`

```pug
html
    head
    body
        h3 Testing static file serving:
        img(src="/test.png", alt="Testing Image")
```

`index.js`

```js
var express = require('express')
var app = express()

// 设置模板引擎
app.set('view engine', 'pug')
// 设置模板目录
app.set('views', './views')

app.use(express.static('public'))

app.get('/static', function (req, res) {
    res.render('static')
})

app.listen(3000)
```

打开 <http://localhost:3000/static>

<http://expressjs.com/en/starter/static-files.html>

## Multiple Static Directories

`views/static.pug`

```pug
html
    head
    body
        h3 Testing static file serving:
        img(src="/google.png", alt="Google")
        img(src="/baidu.png", alt="百度")
```

`index.js`

```js
var express = require('express')
var app = express()

app.set('view engine', 'pug')
app.set('views', './views')

app.use(express.static('public'))
app.use(express.static('images'))

app.get('/static', function (req, res) {
    res.render('static')
})

app.listen(3000)
```

打开 <http://localhost:3000/static>

## Virtual Path Prefix

测试图片

- `public/logo_google.png`
- `images/logo_baidu.png`

`views/static.pug`

```pug
html
    head
    body
        h3 Testing static file serving:
        img(src="/google/logo_google.png", alt="Google")
        img(src="/baidu/logo_baidu.png", alt="百度")
```

`index.js`

```js
var express = require('express')
var app = express()

app.set('view engine', 'pug')
app.set('views', './views')

// 路由 /google 的资源在目录 public 内
app.use('/google', express.static('public'))
// 路由 /baidu 的资源在目录 images 内
app.use('/baidu', express.static('images'))

app.get('/static', function (req, res) {
    res.render('static')
})

app.listen(3000)
```

打开 <http://localhost:3000/static>