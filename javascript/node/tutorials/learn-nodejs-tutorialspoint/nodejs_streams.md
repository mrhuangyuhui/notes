# [Node.js - Streams](https://www.tutorialspoint.com/nodejs/nodejs_streams.htm)

## Reading from a Stream

```js
var fs = require("fs");
var data = '';

// Create a readable stream
var readerStream = fs.createReadStream('input.txt');

// Set the encoding to be utf8. 
readerStream.setEncoding('UTF8');

// Handle stream events --> data, end, and error
readerStream.on('data', function (chunk) {
    data += chunk;
});

readerStream.on('end', function () {
    console.log(data);
});

readerStream.on('error', function (err) {
    console.log(err.stack);
});

console.log("Program Ended");
```

```bash
$ node main.js
Program Ended
Tutorials Point is giving self learning content
to teach the world in simple and easy way!!!!!
```

## Writing to a Stream

```js
var fs = require("fs");
var data = 'Simply Easy Learning';

// Create a writable stream
var writerStream = fs.createWriteStream('output.txt');

// Write the data to stream with encoding to be utf8
writerStream.write(data, 'UTF8');

// Mark the end of file
writerStream.end();

// Handle stream events --> finish, and error
writerStream.on('finish', function () {
    console.log("Write completed.");
});

writerStream.on('error', function (err) {
    console.log(err.stack);
});

console.log("Program Ended");
```

```bash
$ node main.js
Program Ended
Write completed.
$ cat output.txt
Simply Easy Learning
```

## Piping the Streams

```js
var fs = require("fs");

// Create a readable stream
var readerStream = fs.createReadStream('input.txt');

// Create a writable stream
var writerStream = fs.createWriteStream('output.txt');

// Pipe the read and write operations
// read input.txt and write data to output.txt
readerStream.pipe(writerStream);

console.log("Program Ended");
```

```bash
$ node main.js
Program Ended
$ cat output.txt
Tutorials Point is giving self learning content
to teach the world in simple and easy way!!!!!
```

## Chaining the Streams

```js
var fs = require("fs");
var zlib = require('zlib');

// Compress the file input.txt to input.txt.gz
fs.createReadStream('input.txt')
    .pipe(zlib.createGzip())
    .pipe(fs.createWriteStream('input.txt.gz'));

console.log("File Compressed.");
```

```bash
$ node main.js
File Compressed.
$ ls | grep input
input.txt
input.txt.gz
```

```js
var fs = require("fs");
var zlib = require('zlib');

// Decompress the file input.txt.gz to input.txt
fs.createReadStream('input.txt.gz')
    .pipe(zlib.createGunzip())
    .pipe(fs.createWriteStream('input.txt'));

console.log("File Decompressed.");
```

```bash
$ node main.js
File Decompressed.
$ ls | grep input
input.txt
input.txt.gz
```