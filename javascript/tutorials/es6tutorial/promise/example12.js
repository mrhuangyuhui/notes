new Promise((resolve, reject) => {
    console.log("1");
    resolve();
}).then(() => {
    console.log("2")
    return new Promise((resolve, reject) => {
        console.log("3")
        throw new Error();
    });
}).then(() => {
    // 此处不会执行
    console.log("4")
}).catch(() => {
    console.log("5")
});

/**
$ node example12.js 
1
2
3
5
 */