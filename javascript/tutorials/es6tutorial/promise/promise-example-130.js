// Promise 对象的错误具有“冒泡”性质，会一直向后传递，直到被捕获为止。也就是说，错误总是会被下一个 catch 语句捕获。
new Promise((resolve, reject) => {
    console.log("1")
    resolve()
}).then(() => {
    console.log("2")
    return new Promise((resolve, reject) => {
        console.log("3")
        throw new Error("test")
    })
}).then(() => {
    // 此处不会执行
    console.log("4")
}).catch((err) => {
    console.log(err)
})

/**
1
2
3
Error: test
 */
