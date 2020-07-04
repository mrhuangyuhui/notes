new Promise((resolve, reject) => {
    setTimeout(() => resolve("1"), 2000)
}).then(value => {
    return value + ", 2"
}).then(value => {
    console.log(value + ", 3")
})

/**
1, 2, 3
 */