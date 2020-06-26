# [Basic routing](http://expressjs.com/en/starter/basic-routing.html)

`./app.js`
```js
const express = require('express')
const app = express()

app.get('/', function (req, res) {
    res.send('Hello World!')
})

app.post('/', function (req, res) {
    res.send('Got a POST request')
})

app.put('/user', function (req, res) {
    res.send('Got a PUT request at /user')
})

app.delete('/user', function (req, res) {
    res.send('Got a DELETE request at /user')
})

app.listen(3000, () => console.log('Example app listening on port 3000!'))
```

`./client.js`
```js
var http = require('http')

var options = {
    host:'localhost',
    port: '3000',
    path: '/', // /, /user
    method: 'get' // get, post, put, delete
}

var callback = function (response) {

    var body = '';

    response.on('data', function (data) {
        body += data;
    });

    response.on('end', function () {
        console.log(body);
    });
};

var req = http.request(options, callback);
req.end();
```

启动服务
```
$ node app.js
Example app listening on port 3000!
```

客户端发起请求
```
$ node client.js
Hello World!

$ node client.js
Got a POST request

$ node client.js
Got a PUT request at /user

$ node client.js
Got a DELETE request at /user
```
