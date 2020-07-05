// Resolving a thenable object
var p1 = Promise.resolve({
    then: function (onFulfill, onReject) { onFulfill('fulfilled!'); }
});

console.log(p1 instanceof Promise) // true, object casted to a Promise

p1.then(function (v) {
    console.log(v); // "fulfilled!"
}, function (e) {
    // not called
});

// true
// fulfilled!
