# [ExpressJS - Routing](https://www.tutorialspoint.com/expressjs/expressjs_routing.htm)

## `app.method(path, handler)`

```js
const express = require('express')
const app = express()

app.get('/apple', function (req, res) {
    res.send('Apple')
})

app.post('/banana', function (req, res) {
    res.send('Banana')
})

app.all('/orange', function (req, res) {
    res.send('Orange')
})

app.listen(3000)
```

```bash
curl -X GET localhost:3000/apple

curl -X POST localhost:3000/banana

curl -X GET localhost:3000/orange

curl -X POST localhost:3000/orange

curl -X PUT localhost:3000/orange

curl -X DELETE localhost:3000/orange
```

## Routers

`myapp/things.js`

```js
const express = require('express')
const router = express.Router()

router.get('/', function (req, res) {
    res.send('GET route on things.')
})

router.post('/', function (req, res) {
    res.send('POST route on things.')
})

module.exports = router
```

```js
const express = require('express')
const things = require('./things.js')
const app = express()

app.use('/things', things)

app.listen(3000)
```

```bash
$ curl -X GET localhost:3000/things
GET route on things.

$ curl -X POST localhost:3000/things
POST route on things.
```
