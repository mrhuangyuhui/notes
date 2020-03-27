# [ExpressJS - URL Building](https://www.tutorialspoint.com/expressjs/expressjs_url_building.htm)

```js
const express = require('express')
const app = express()

app.get('/:id', function (req, res) {
    res.send('id: ' + req.params.id)
})

app.listen(3000)
```

```bash
$ curl localhost:3000/123
id: 123
```

```js
const express = require('express')
const app = express()

app.get('/things/:name/:id', function (req, res) {
    res.send('name: ' + req.params.name + ', id: ' + req.params.id)
})

app.listen(3000)
```

```bash
$ curl localhost:3000/things/tutorialspoint/12345
name: tutorialspoint, id: 12345
```

## Pattern Matched Routes

```js
const express = require('express')
const app = express()

app.get('/things/:id([0-9]{5})', function (req, res) {
    res.send('id: ' + req.params.id)
})
// 这个要放到所有路由的后面，作为默认处理。
app.get('*', function (req, res) {
    res.send('Sorry, this is an invalid URL.')
})

app.listen(3000)
```

```bash
$ curl localhost:3000/things/14554
id: 14554

$ curl localhost:3000/things/145
Sorry, this is an invalid URL.
```
