<!-- omit in toc -->
# `Promise` 对象

- [`Promise` 的含义](#promise-的含义)
- [基本用法](#基本用法)
- [`Promise.prototype.then()`](#promiseprototypethen)
- [`Promise.prototype.catch()`](#promiseprototypecatch)
- [`Promise.all()`](#promiseall)
- [`Promise.race()`](#promiserace)
- [`Promise.resolve()`](#promiseresolve)
- [`Promise.reject()`](#promisereject)
- [两个有用的附加方法](#两个有用的附加方法)
- [应用](#应用)
- [Promise.try()](#promisetry)

<http://es6.ruanyifeng.com/#docs/promise>

## `Promise` 的含义

`Promise` 是异步编程的一种解决方案

所谓 `Promise`，简单说就是一个容器，里面保存着某个未来才会结束的事件（通常是一个异步操作）的结果。

`Promise` 对象有以下两个特点：

- 对象的状态不受外界影响。`Promise` 对象代表一个异步操作，有三种状态：`pending`（进行中）、`fulfilled`（已成功）和 `rejected`（已失败）。只有异步操作的结果，可以决定当前是哪一种状态，任何其他操作都无法改变这个状态；
- 一旦状态改变，就不会再变，任何时候都可以得到这个结果。`Promise` 对象的状态改变，只有两种可能：从 `pending` 变为 `fulfilled` 和从 `pending` 变为 `rejected`。只要这两种情况发生，状态就凝固了，不会再变了，会一直保持这个结果，这时就称为 resolved（已定型）。如果改变已经发生了，你再对 `Promise` 对象添加回调函数，也会立即得到这个结果。

## 基本用法

[promise-example-10.js](promise-example-10.js)

[promise-example-20.js](promise-example-20.js)

[promise-example-30.js](promise-example-30.js)

[promise-example-40.js](promise-example-40.js)

[promise-example-50.js](promise-example-50.js)

## `Promise.prototype.then()`

`Promise` 实例具有 `then` 方法，它的作用是为 `Promise` 实例添加状态改变时的回调函数。

`then` 方法返回的是一个新的 `Promise` 实例（注意，不是原来那个 `Promise` 实例）。因此可以采用链式写法，即 `then` 方法后面再调用另一个 `then` 方法。

[promise-example-60.js](promise-example-60.js)

[promise-example-70.js](promise-example-70.js)

[promise-example-80.js](promise-example-80.js)

## `Promise.prototype.catch()`

[promise-example-90.js](promise-example-90.js)

[promise-example-100.js](promise-example-100.js)

[promise-example-110.js](promise-example-110.js)

[promise-example-120.js](promise-example-120.js)

[promise-example-130.js](promise-example-130.js)

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

`Promise.resolve()` 等价于下面的写法。

```js
Promise.resolve('foo')
// 等价于
new Promise(resolve => resolve('foo'))
```

## `Promise.reject()`

已学习

## 两个有用的附加方法

已学习

## 应用

已学习

## Promise.try()

跳过，学习完 async 函数后再回来