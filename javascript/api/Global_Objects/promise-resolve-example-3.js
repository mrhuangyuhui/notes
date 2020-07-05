var original = Promise.resolve(33);
var cast = Promise.resolve(original);
cast.then(function (value) {
    console.log('value: ' + value);
});
console.log('original === cast ? ' + (original === cast));

// original === cast ? true
// value: 33
