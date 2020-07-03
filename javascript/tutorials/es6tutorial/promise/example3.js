// 调用 resolve 或 reject 并不会终结 Promise 的参数函数的执行
new Promise((resolve, reject) => {
  resolve(1); // 立即 resolved 的 Promise 是在本轮事件循环的末尾执行，总是晚于本轮循环的同步任务。
  console.log(2); // 仍会继续执行
}).then(r => {
  console.log(r);
});

/**
$ node example3.js
2
1
 */
