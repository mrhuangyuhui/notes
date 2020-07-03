var promise = new Promise((resolve, reject) => {
  // 异步操作
  setTimeout(resolve, 2000, 'done');
});

// 添加异步操作的回调函数
promise.then((value) => {
  console.log(value);
});

/**
$ node example1.js 
done
 */
