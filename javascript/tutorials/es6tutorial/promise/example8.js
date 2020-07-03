const promise = new Promise((resolve, reject) => {
    throw new Error('test');
});

promise.catch((err) => console.log(err));

/**
$ node example8.js 
Error: test
 */