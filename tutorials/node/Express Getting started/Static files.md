# [Static files](http://expressjs.com/en/starter/static-files.html)

```js
const express = require('express')
const app = express()

app.use(express.static('public'));

app.listen(3000, () => console.log('Example app listening on port 3000!'))
```

http://localhost:3000/images/kitten.jpg \
http://localhost:3000/css/style.css \
http://localhost:3000/js/app.js \
http://localhost:3000/images/bg.png \
http://localhost:3000/hello.html

To use multiple static assets directories, call the `express.static` middleware function multiple times:
```js
app.use(express.static('public'))
app.use(express.static('files'))
```

To create a virtual path prefix (where the path does not actually exist in the file system) for files that are served by the `express.static` function, specify a mount path for the static directory, as shown below:
```js
app.use('/static', express.static('public'))
```

http://localhost:3000/static/images/kitten.jpg \
http://localhost:3000/static/css/style.css \
http://localhost:3000/static/js/app.js \
http://localhost:3000/static/images/bg.png \
http://localhost:3000/static/hello.html