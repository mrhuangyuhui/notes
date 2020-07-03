// Promise 新建后就会立即执行
let promise = new Promise(function (resolve, reject) {
  console.log('Promise');
  resolve();
});

// then 方法指定的回调函数，将在当前脚本所有同步任务执行完才会执行。
promise.then(function () {
  console.log('resolved.');
});

console.log('Hi!');

/**
$ node example2.js
Promise
Hi!
resolved.
 */
