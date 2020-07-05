const promise = new Promise(function (resolve, reject) {
    // 如果 Promise 状态已经变成 resolved，再抛出错误是无效的。
    resolve('OK')
    throw new Error('test')
})
promise.then(function (value) { console.log(value) })
    .catch(function (error) { console.log(error) })

/**
OK
 */
