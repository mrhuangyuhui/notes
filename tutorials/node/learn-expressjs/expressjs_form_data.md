# [ExpressJS - Form Data](https://www.tutorialspoint.com/expressjs/expressjs_form_data.htm)

安装 POST 请求体解析中间件

```bash
npm install --save body-parser
```

`views/form.pug`

```pug
html
    head
        title Form Tester
    body
        form(action="/form", method="POST")
            div
                label(for="say") Say:
                input(name="say" value="Hi")
            br
            div
                label(for="to") To:
                input(name="to" value="Express forms")
            br
            button(type="submit") Send my greetings
```

`index.js`

```js
var express = require('express')
var bodyParser = require('body-parser')

var app = express()

app.set('view engine', 'pug')
app.set('views', './views')

// 加载表单解析的中间件
app.use(bodyParser.urlencoded({ extended: true }))

app.get('/form', function (req, res) {
    // 返回表单
    res.render('form')
})

// 处理表单提交请求
app.post('/form', function (req, res) {
    // 打印表单内容
    console.log(req.body)
    res.send('Received your request!')
})

app.listen(3000)
```

打开 <http://localhost:3000/form>

输出结果

```bash
$ nodemon index.js
{ say: 'Hi', to: 'Express forms' }
```