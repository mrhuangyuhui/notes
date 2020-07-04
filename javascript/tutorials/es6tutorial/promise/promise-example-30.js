const p1 = new Promise(function (resolve, reject) {
  console.log("p1 开始")
  setTimeout(() => {
    console.log("p1 计时结束")
    reject(new Error('fail'))
  }, 3000)
})

const p2 = new Promise(function (resolve, reject) {
  console.log("p2 开始")
  setTimeout(() => {
    console.log("p2 计时结束")
    resolve(p1) // 由于 p2 返回的是另一个 Promise，导致 p2 自己的状态无效了，由 p1 的状态决定 p2 的状态。
  }, 1000) // 改成 5000，观察执行结果。
})

// p2 的计时改成 5000，添加以下代码。
// p1.then(result => console.log(result))
//   .catch(error => console.log(error))

p2.then(result => console.log(result))
  .catch(error => console.log(error))

/**
p1 开始
p2 开始
p2 计时结束
p1 计时结束
Error: fail
 */
