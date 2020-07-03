new Promise((resolve, reject) => {
    setTimeout(() => resolve("0"), 2000);
}).then(arg => {
    return arg + ", 1"; // 返回值作为参数传递给下一个回调函数
}).then(arg => {
    console.log(arg + ", 2");
});

/**
$ node example6.js 
0, 1, 2
 */