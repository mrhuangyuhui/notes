// Thenable throws after callback
// Promise resolves
var thenable = {
  then: function (resolve) {
    resolve('Resolving');
    throw new TypeError('Throwing');
  }
};

var p3 = Promise.resolve(thenable);
p3.then(function (v) {
  console.log(v); // "Resolving"
}, function (e) {
  // not called
});

// Resolving
