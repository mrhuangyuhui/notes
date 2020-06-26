# [Hello world](http://expressjs.com/en/starter/hello-world.html)

`./app.js`
```js
const express = require('express')
const app = express()

app.get('/', (req, res) => res.send('Hello World!'))

app.listen(3000, () => console.log('Example app listening on port 3000!'))
```