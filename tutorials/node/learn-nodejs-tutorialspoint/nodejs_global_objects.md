# [Node.js - Global Objects](https://www.tutorialspoint.com/nodejs/nodejs_global_objects.htm)

## `__filename`

当前被执行脚本的绝对路径

```js
console.log(__filename);
```

```bash
$ node main.js
/Users/yuhuihuang/workspaces/node/main.js
```

## `__dirname`

当前被执行脚本所在目录的绝对路径

```js
console.log(__dirname);
```

```bash
$ node main.js
/Users/yuhuihuang/workspaces/node
```

## `setTimeout(cb, ms)`

定时器

```js
function printHello() {
    console.log("Hello, World!");
}
// Now call above function after 2 seconds
setTimeout(printHello, 2000);
```

```bash
$ node main.js
Hello, World!
```

## `clearTimeout(t)`

删除定时器

```js
function printHello() {
    console.log("Hello, World!");
}

// Now call above function after 2 seconds
var t = setTimeout(printHello, 2000);

// Now clear the timer
clearTimeout(t);
```

## `setInterval(cb, ms)`

循环定时器

```js
function printHello() {
    console.log("Hello, World!");
}
// Now call above function after 2 seconds
setInterval(printHello, 2000);
```