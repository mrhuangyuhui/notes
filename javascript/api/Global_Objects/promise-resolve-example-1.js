Promise.resolve('Success').then(function (value) {
    console.log(value); // "Success"
}, function (value) {
    // not called
});
