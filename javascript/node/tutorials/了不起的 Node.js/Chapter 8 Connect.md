# Chapter 8 Connect

`./server.js` [完整代码](https://github.com/mrhuangyuhui/smashingnode/tree/master/code-examples/connect/introduction/connect)
```js
var connect = require('connect')
var path = require('path')
var serveStatic = require('serve-static')

var server = connect()

server.use(serveStatic(path.join(__dirname, 'website')))

server.listen(3000)
```

`./server.js` [完整代码](https://github.com/mrhuangyuhui/smashingnode/tree/master/code-examples/connect/logger)
```js 
var connect = require('connect')
var morgan = require('morgan')
var serveStatic = require('serve-static')
var path = require('path')

var server = connect()

server.use(morgan('dev'))
server.use(morgan('type is :res[content-type], length is '
  + ':res[content-length] and it took :response-time ms.'))
server.use(serveStatic(path.join(__dirname, 'website')))

server.listen(3000)
```

输出结果（确保在没有缓存的情况下）：
```
$ node server.js 
GET / 200 8.883 ms - 126
type is text/html; charset=UTF-8, length is 126 and it took 8.883 ms.
GET /images/1.jpg 200 1.682 ms - 103298
type is image/jpeg, length is 103298 and it took 1.682 ms.
GET /images/2.jpg 200 0.769 ms - 124504
type is image/jpeg, length is 124504 and it took 0.769 ms.
GET /images/3.jpg 200 0.702 ms - 132904
type is image/jpeg, length is 132904 and it took 0.702 ms.
GET /images/4.jpg 200 3.152 ms - 81636
type is image/jpeg, length is 81636 and it took 3.152 ms.
```
