new Promise((resolve, reject) => {
    setTimeout(() => resolve(), 2000);
}).then(() => {
    console.log("1");
}).then(() => {
    console.log("2");
});

/**
$ node example5.js
1
2
 */