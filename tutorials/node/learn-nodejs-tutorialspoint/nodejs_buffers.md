# [Node.js - Buffers](https://www.tutorialspoint.com/nodejs/nodejs_buffers.htm)

## Creating Buffers

```js
var buf = new Buffer(10);

var buf = new Buffer([10, 20, 30, 40, 50]);

var buf = new Buffer("Simply Easy Learning", "utf-8");
```

## Writing to Buffers

```js
buf = new Buffer(256);
len = buf.write("Simply Easy Learning");

console.log("Octets written: " + len);
```

```bash
$ node main.js
Octets written: 20
```

## Reading from Buffers

```js
buf = new Buffer(26);
for (var i = 0; i < 26; i++) {
    buf[i] = i + 97;
}

console.log(buf.toString('ascii'));
console.log(buf.toString('ascii', 0, 5));
console.log(buf.toString('utf8', 0, 5));
console.log(buf.toString(undefined, 0, 5));
```

```bash
$ node main.js
abcdefghijklmnopqrstuvwxyz
abcde
abcde
abcde
```

```js
var buf = new Buffer('Simply Easy Learning');
var json = buf.toJSON(buf);

console.log(json);
```

## Convert Buffer to JSON

```bash
$ node main.js
{ type: 'Buffer',
  data:
   [ 83,
     105,
     109,
     112,
     108,
     121,
     32,
     69,
     97,
     115,
     121,
     32,
     76,
     101,
     97,
     114,
     110,
     105,
     110,
     103 ] }
```

## Concatenate Buffers

```js
var buffer1 = new Buffer('TutorialsPoint ');
var buffer2 = new Buffer('Simply Easy Learning');
var buffer3 = Buffer.concat([buffer1, buffer2]);

console.log("buffer3 content: " + buffer3.toString());
```

```bash
$ node main.js
buffer3 content: TutorialsPoint Simply Easy Learning
```

## Compare Buffers

```js
var buffer1 = new Buffer('ABC');
var buffer2 = new Buffer('ABCD');
var result = buffer1.compare(buffer2);

if (result < 0) {
    console.log(buffer1 + " comes before " + buffer2);
} else if (result == 0) {
    console.log(buffer1 + " is same as " + buffer2);
} else {
    console.log(buffer1 + " comes after " + buffer2);
}
```

```bash
$ node main.js
ABC comes before ABCD
```

## Copy Buffer

```js
var buffer1 = new Buffer('ABC');

// copy a buffer
var buffer2 = new Buffer(3);
buffer1.copy(buffer2);
console.log("buffer2 content: " + buffer2.toString());
```

```bash
$ node main.js
buffer2 content: ABC
```

## Slice Buffer

```js
var buffer1 = new Buffer('TutorialsPoint');

// slicing a buffer
var buffer2 = buffer1.slice(0, 9);
console.log("buffer2 content: " + buffer2.toString());
```

```bash
$ node main.js
buffer2 content: Tutorials
```

## Buffer Length

```js
var buffer = new Buffer('TutorialsPoint');

// length of the buffer
console.log("buffer length: " + buffer.length);
```

```bash
$ node main.js
buffer length: 14
```