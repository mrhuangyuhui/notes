# [Node.js HTTP Module](https://www.w3schools.com/nodejs/nodejs_http.asp)

Node.js as a Web Server

```js
var http = require('http');

http.createServer(function (req, res) {
    res.write('Hello World!');
    res.end();
}).listen(8080);
```

Add an HTTP Header

```js
var http = require('http');
http.createServer(function (req, res) {
    res.writeHead(200, { 'Content-Type': 'text/html' });
    res.write('Hello World!');
    res.end();
}).listen(8080);
```

Read the Query String

```js
var http = require('http');
http.createServer(function (req, res) {
    res.writeHead(200, { 'Content-Type': 'text/html' });
    res.write(req.url);
    res.end();
}).listen(8080);
```

```bash
node server.js
```

```bash
$ curl http://localhost:8080/winter
/winter

$ curl http://localhost:8080/summer
/summer
```

Split the Query String

```js
var http = require('http');
var url = require('url');

http.createServer(function (req, res) {
    res.writeHead(200, { 'Content-Type': 'text/html' });
    var q = url.parse(req.url, true).query;
    var txt = q.year + " " + q.month;
    res.end(txt);
}).listen(8080);
```

```bash
node server.js
```

```bash
$ curl "http://localhost:8080/?year=2017&month=July"
2017 July
```
