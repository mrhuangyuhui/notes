const promise = new Promise(function (resolve, reject) {
    // reject() 方法的作用，等同于抛出错误。
    reject(new Error('test'))
})
promise.catch(function (error) {
    console.log(error)
})

/**
Error: test
 */
