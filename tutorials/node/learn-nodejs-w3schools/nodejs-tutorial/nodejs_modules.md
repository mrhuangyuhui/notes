# [Node.js Modules](https://www.w3schools.com/nodejs/nodejs_modules.asp)

`myfirstmodule.js`

```js
exports.myDateTime = function () {
    return Date();
}
```

```js
var http = require('http');
var dt = require('./myfirstmodule');

http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.write("The date and time are currently: " + dt.myDateTime());
    res.end();
}).listen(8080);
```

```bash
node server.js
```

```bash
$ curl localhost:8080
The date and time are currently: Wed Jun 19 2019 21:43:52 GMT+0800 (CST)
```
