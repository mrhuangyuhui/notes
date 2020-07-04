new Promise((resolve, reject) => {
    console.log(new Date())
    setTimeout(() => resolve("1"), 2000)
}).then(value => {
    console.log(new Date())
    // 返回一个新的 Promise 对象
    return new Promise((resolve, reject) => {
        console.log(new Date())
        setTimeout(() => resolve(value + ", 2"), 2000)
    })
}).then(value => { // 需要等待新的 Promise 对象状态发生变化，才会执行回调函数。
    console.log(new Date())
    console.log(value + ", 3")
})

/**
2020-07-04T16:34:06.506Z
2020-07-04T16:34:08.536Z
2020-07-04T16:34:08.536Z
2020-07-04T16:34:10.537Z
1, 2, 3
 */
