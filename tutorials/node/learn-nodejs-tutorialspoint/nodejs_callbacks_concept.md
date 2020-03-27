# [Node.js - Callbacks Concept](https://www.tutorialspoint.com/nodejs/nodejs_callbacks_concept.htm)

`input.txt`

```bash
Tutorials Point is giving self learning content
to teach the world in simple and easy way!!!!!
```

## Blocking Code Example

```js
var fs = require("fs");

var data = fs.readFileSync('input.txt');

console.log(data.toString());
console.log("Program Ended");
```

```bash
$ node main.js
Tutorials Point is giving self learning content
to teach the world in simple and easy way!!!!!
Program Ended
```

## Non-Blocking Code Example

```js
var fs = require("fs");

fs.readFile('input.txt', function (err, data) {
    if (err) return console.error(err);
    console.log(data.toString());
});

console.log("Program Ended");
```

```bash
$ node main.js
Program Ended
Tutorials Point is giving self learning content
to teach the world in simple and easy way!!!!!
```