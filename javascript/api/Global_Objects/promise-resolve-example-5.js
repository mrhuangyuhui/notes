// Thenable throws before callback
// Promise rejects
var thenable = {
  then: function (resolve) {
    throw new TypeError('Throwing');
    resolve('Resolving');
  }
};

var p2 = Promise.resolve(thenable);
p2.then(function (v) {
  // not called
}, function (e) {
  console.error(e); // TypeError: Throwing
});

// TypeError: Throwing
