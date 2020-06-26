# [Node.js URL Module](https://www.w3schools.com/nodejs/nodejs_url.asp)

## The Built-in URL Module

```js
var url = require('url');
var adr = 'http://localhost:8080/default.htm?year=2017&month=february';

var q = url.parse(adr, true);

console.log(q.host);
console.log(q.pathname);
console.log(q.search);

var qdata = q.query;
console.log(qdata);
console.log(qdata.year);
console.log(qdata.month);
```

输出结果

```bash
$ node server.js
localhost:8080
/default.htm
?year=2017&month=february
{ year: '2017', month: 'february' }
2017
february
```

## Node.js File Server

`summer.html`

```html
<!DOCTYPE html>
<html>

<body>
    <h1>Summer</h1>
    <p>I love the sun!</p>
</body>

</html>
```

`winter.html`

```html
<!DOCTYPE html>
<html>

<body>
    <h1>Winter</h1>
    <p>I love the snow!</p>
</body>

</html>
```

```js
var http = require('http');
var url = require('url');
var fs = require('fs');

http.createServer(function (req, res) {
    var q = url.parse(req.url, true);
    var filename = '.' + q.pathname;
    fs.readFile(filename, function (err, data) {
        if (err) {
            res.writeHead(404, { 'Content-Type': 'text/html' });
            return res.end('404 Not Found');
        }
        res.writeHead(200, { 'Content-Type': 'text/html' });
        res.write(data);
        return res.end();
    });
}).listen(8080);
```

打开 <http://localhost:8080>

输出结果

```html
404 Not Found
```

打开 <http://localhost:8080/summer.html>

输出结果

```html
<!DOCTYPE html>
<html>

<body>
    <h1>Summer</h1>
    <p>I love the sun!</p>
</body>

</html>
```

打开 <http://localhost:8080/winter.html>

输出结果

```html
<!DOCTYPE html>
<html>

<body>
    <h1>Winter</h1>
    <p>I love the snow!</p>
</body>

</html>
```