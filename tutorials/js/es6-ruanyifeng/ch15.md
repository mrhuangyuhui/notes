# [`Promise` 对象](http://es6.ruanyifeng.com/#docs/promise)

## `Promise` 的含义

`Promise` 是异步编程的一种解决方案，比传统的解决方案——回调函数和事件——更合理和更强大。

所谓 `Promise`，简单说就是一个容器，里面保存着某个未来才会结束的事件（通常是一个异步操作）的结果。

`Promise` 对象有以下两个特点：

- 对象的状态不受外界影响。`Promise` 对象代表一个异步操作，有三种状态：`pending`（进行中）、`fulfilled`（已成功）和`rejected`（已失败）。只有异步操作的结果，可以决定当前是哪一种状态，任何其他操作都无法改变这个状态；
- 一旦状态改变，就不会再变，任何时候都可以得到这个结果。`Promise` 对象的状态改变，只有两种可能：从 `pending` 变为 `fulfilled` 和从 `pending` 变为 `rejected`。只要这两种情况发生，状态就凝固了，不会再变了，会一直保持这个结果，这时就称为 resolved（已定型）。如果改变已经发生了，你再对 `Promise` 对象添加回调函数，也会立即得到这个结果。这与事件（Event）完全不同，事件的特点是，如果你错过了它，再去监听，是得不到结果的。

## 基本用法

下面是一个 `Promise` 对象的简单例子。

```js
function timeout(ms) {
    return new Promise((resolve, reject) => {
        setTimeout(resolve, ms, 'done');
    });
}

// 2000 毫秒后执行一个回调函数
timeout(2000).then((value) => {
    console.log(value);
});
```

`Promise` 新建后就会立即执行。

```js
let promise = new Promise(function (resolve, reject) {
    console.log('Promise');
    resolve();
});

promise.then(function () {
    console.log('resolved.');
});

console.log('Hi!');
```

输出结果

```bash
Promise
Hi!
resolved.
```

下面是一个用 `Promise` 对象实现的 Ajax 操作的例子。

```js
const getJSON = function (url) {
    const promise = new Promise(function (resolve, reject) {
        const handler = function () {
            if (this.readyState !== 4) {
                return;
            }
            if (this.status === 200) {
                resolve(this.response);
            } else {
                reject(new Error(this.statusText));
            }
        };
        const client = new XMLHttpRequest();
        client.open("GET", url);
        client.onreadystatechange = handler;
        client.responseType = "json";
        client.setRequestHeader("Accept", "application/json");
        client.send();

    });

    return promise;
};

getJSON("/posts.json").then(function (json) {
    console.log('Contents: ' + json);
}, function (error) {
    console.error('出错了', error);
});
```

```js
const p1 = new Promise(function (resolve, reject) {
    console.log("p1 开始");
    setTimeout(() => {
        console.log("p1 定时器结束");
        reject(new Error('fail'));
    }, 3000);
});

const p2 = new Promise(function (resolve, reject) {
    console.log("p2 开始");
    setTimeout(() => {
        console.log("p2 定时器结束");
        resolve(p1);
    }, 1000);
});

p2.then(result => console.log(result))
    .catch(error => console.log(error));
```

输出结果

```bash
p1 开始
p2 开始
p2 定时器结束
p1 定时器结束
Error: fail
```

> 注意：调用 `resolve` 或 `reject` 并不会终结 `Promise` 的参数函数的执行。

```js
new Promise((resolve, reject) => {
    // // 立即 resolved 的 Promise 是在本轮事件循环的末尾执行，总是晚于本轮循环的同步任务。
    resolve(1);
    console.log(2);
}).then(r => {
    console.log(r);
});
```

输出结果

```bash
2
1
```

一般来说，调用 `resolve` 或 `reject` 以后，`Promise` 的使命就完成了，后继操作应该放到 `then` 方法里面，而不应该直接写在 `resolve` 或 `reject` 的后面。所以，最好在它们前面加上 `return` 语句，这样就不会有意外。

```js
new Promise((resolve, reject) => {
    return resolve(1);
    // 后面的语句不会执行
    console.log(2);
});
```

## `Promise.prototype.then()`

`then` 方法返回的是一个新的 `Promise` 实例（注意，不是原来那个 `Promise` 实例）。因此可以采用链式写法，即 `then` 方法后面再调用另一个 `then` 方法。

```js
new Promise((resolve, reject) => {
    setTimeout(() => resolve("dog"), 2);
}).then(a => {
    return a + ", cat";
}).then(b => {
    console.log(b + ", tiger");
});

// dog, cat, tiger
```

## `Promise.prototype.catch()`

`Promise.prototype.catch` 方法是 `.then(null, rejection)` 的别名，用于指定发生错误时的回调函数。

```js
const promise = new Promise((resolve, reject) => {
    throw new Error('test error');
});

promise.then((val) => console.log(val))
    .catch((err) => console.log(err));

// 等同于
// promise.then((val) => console.log(val))
//     .then(null, (err) => console.log(err));

// Error: test error
```

以下三种写法是等价的。

```js
const promise = new Promise(function (resolve, reject) {
    throw new Error('test error');
});
promise.catch(function (error) {
    console.log(error);
});
// Error: test error
```

```js
const promise = new Promise(function (resolve, reject) {
    try {
        throw new Error('test error');
    } catch (e) {
        reject(e);
    }
});
promise.catch(function (error) {
    console.log(error);
});
// Error: test error
```

```js
const promise = new Promise(function (resolve, reject) {
    reject(new Error('test error'));
});
promise.catch(function (error) {
    console.log(error);
});
// Error: test error
```

比较上面三种写法，可以发现 `reject` 方法的作用，等同于抛出错误。

如果 `Promise` 状态已经变成 `resolved`，再抛出错误是无效的。

```js
const promise = new Promise(function (resolve, reject) {
    resolve('test resolve');
    throw new Error('test error');
});
promise.then(function (value) { console.log(value) })
    .catch(function (error) { console.log(error) });

// test resolve
```

`Promise` 对象的错误具有“冒泡”性质，会一直向后传递，直到被捕获为止。也就是说，错误总是会被下一个 `catch` 语句捕获。

```js
new Promise((resolve, reject) => {
    console.log("p1");
    resolve();
}).then(() => {
    console.log("then 1")
    return new Promise((resolve, reject) => {
        console.log("p2")
        throw new Error();
    });
}).then(() => {
    console.log("then 2")
}).catch(() => {
    // 处理前面三个 Promise 产生的错误
    console.log("catch")
});
```

输出结果

```bash
p1
then 1
p2
catch
```

一般来说，不要在 `then` 方法里面定义 `Reject` 状态的回调函数（即 `then` 的第二个参数），总是使用 `catch` 方法。

```js
// bad
promise.then(function (data) {
    // success
}, function (err) {
    // error
});

// good
promise.then(function (data) {
    // success
}).catch(function (err) {
    // error
});
```

跟传统的 `try/catch` 代码块不同的是，如果没有使用 `catch` 方法指定错误处理的回调函数，`Promise` 对象抛出的错误不会传递到外层代码，即不会有任何反应。

```js
const someAsyncThing = function () {
    return new Promise(function (resolve, reject) {
        // 下面一行会报错，因为x没有声明
        resolve(x + 2);
    });
};

someAsyncThing().then(function () {
    console.log('everything is great');
});

setTimeout(() => { console.log(123) }, 2000);
```

输出结果

```bash
(node:1556) UnhandledPromiseRejectionWarning: Unhandled promise rejection (rejection id: 2): ReferenceError: x
 is not defined
(node:1556) [DEP0018] DeprecationWarning: Unhandled promise rejections are deprecated. In the future, promise
rejections that are not handled will terminate the Node.js process with a non-zero exit code.
123
```

> 注意：Node 有计划在未来废除 `unhandledRejection` 事件。如果 `Promise` 内部有未捕获的错误，会直接终止进程，并且进程的退出码不为 0。

## `Promise.all()`

已学习

## `Promise.race()`

已学习

## `Promise.resolve()`

已学习

## `Promise.reject()`

已学习

## 两个有用的附加方法

已学习

## 应用

已学习

## Promise.try()

跳过，学习完 async 函数后再回来