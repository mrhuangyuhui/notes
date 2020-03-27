# [ExpressJS - Sessions](https://www.tutorialspoint.com/expressjs/expressjs_sessions.htm)

```bash
npm install --save cookie-parser
npm install --save express-session
```

```js
var express = require('express')
var cookieParser = require('cookie-parser')
var session = require('express-session')

var app = express()
app.use(cookieParser())
app.use(session({ secret: "Shh, its a serect!" }))

app.get('/', function (req, res) {
    if (req.session.page_views) {
        req.session.page_views++
        res.send("You visited this page " + req.session.page_views + " times")
        console.log(req.cookies)
    } else {
        req.session.page_views = 1
        res.send("Welcome to this page for the first time!")
    }
})

app.listen(3000)
```

打开 <http://localhost:3000/>

```bash
$ nodemon index.js
# 打印会话 ID
{ 'connect.sid': 's:oV9f8eadmnGDE6HoyUMDcWubRHmAfrEQ.JGRenc9pgzIi/bFiyJIR1O1WD6A2tIkafpeGsEWc314' }
```
