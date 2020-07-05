const promise = new Promise((resolve, reject) => {
    throw new Error('test')
})

promise.catch((err) => console.log(err))

/**
Error: test
 */
