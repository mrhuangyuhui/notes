const promise = new Promise(function (resolve, reject) {
    reject(new Error('test'));
});
promise.catch(function (error) {
    console.log(error);
});
