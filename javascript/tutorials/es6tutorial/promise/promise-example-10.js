let promise = new Promise((resolve, reject) => {
  // 异步操作，2 秒后调用 resolve，将 Promise 对象的状态改为 fulfilled。
  setTimeout(resolve, 2000, 'done')
})

// 添加 Promise 对象 fulfilled 状态的回调函数
promise.then((value) => {
  console.log(value)
})

/**
done
 */
