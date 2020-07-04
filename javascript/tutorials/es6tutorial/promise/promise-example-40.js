// 调用 resolve 或 reject 并不会终结 Promise 的参数函数的执行
new Promise((resolve, reject) => {
  resolve(1)
  console.log(2) // 仍会继续执行
}).then(value => { // Promise 的状态回调函数是在本轮事件循环的末尾执行，总是晚于同步任务。
  console.log(value)
})

/**
2
1
 */
