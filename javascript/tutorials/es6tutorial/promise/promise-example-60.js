let p1 = new Promise((resolve, reject) => {
    setTimeout(() => resolve("1"), 2000)
})

let p2 = p1.then(value => {
    return value + ", 2"
})

console.log(p1 === p2)

let p3 = p2.then(value => {
    console.log(value + ", 3")
})

console.log(p2 === p3)

/**
false
false
1, 2, 3
 */