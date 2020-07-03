new Promise((resolve, reject) => {
    setTimeout(() => resolve("0"), 2000);
}).then(arg => {
    arg = arg + ", 1";
    // 返回一个新的 Promise 对象
    return new Promise((resolve, reject) => {
        setTimeout(() => resolve(arg), 2000);
    })
}).then(arg => { // 需要等待新的 Promise 对象状态发生变化，才会执行回调函数。
    console.log(arg + ", 2");
});

/**
$ node example6.js
0, 1, 2
 */