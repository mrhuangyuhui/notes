/**
一般来说，调用 resolve 或 reject 以后，Promise 的使命就完成了，
后继操作应该放到 then 方法里面，而不应该直接写在 resolve 或 reject 的后面。
所以，最好在它们前面加上 return 语句，这样就不会有意外。
 */
new Promise((resolve, reject) => {
  return resolve(1);
  // 后面的语句不会执行
  console.log(2);
})
