# [Node.js Get Started](https://www.w3schools.com/nodejs/nodejs_get_started.asp)

```js
var http = require('http');

http.createServer(function (req, res) {
    res.writeHead(200, { 'Content-Type': 'text/html' });
    res.end('Hello World!');
}).listen(8080);
```

```bash
node server.js
```

```bash
$ curl -i localhost:8080
HTTP/1.1 200 OK
Content-Type: text/html
Date: Wed, 19 Jun 2019 13:45:50 GMT
Connection: keep-alive
Transfer-Encoding: chunked

Hello World!
```
