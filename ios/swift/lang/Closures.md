# Closures

<https://docs.swift.org/swift-book/LanguageGuide/Closures.html>

## [Closure Expressions](https://docs.swift.org/swift-book/LanguageGuide/Closures.html#ID95)

```swift
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
```

### Closure Expression Syntax

```swift
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )
```

### Inferring Type From Context

```swift
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
```

### Implicit Returns from Single-Expression Closures

```swift
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
```

### Shorthand Argument Names

```swift
reversedNames = names.sorted(by: { $0 > $1 } )
```

### Operator Methods

```swift
reversedNames = names.sorted(by: >)
```

## [Trailing Closures](https://docs.swift.org/swift-book/LanguageGuide/Closures.html#ID102)

```swift
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}

// Here's how you call this function without using a trailing closure:
someFunctionThatTakesAClosure(closure: {
    // closure's body goes here
})

// Here's how you call this function with a trailing closure instead:
someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}
```

```swift
reversedNames = names.sorted() { $0 > $1 }

```

If a closure expression is provided as the function’s or method’s only argument and you provide that expression as a trailing closure, you don’t need to write a pair of parentheses () after the function or method’s name when you call the function:

```swift
reversedNames = names.sorted { $0 > $1 }
```

```swift
let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
    // ...
    return output
}
```

If a function takes multiple closures, you omit the argument label for the first trailing closure and you label the remaining trailing closures.

```swift
func loadPicture(from server: Server, completion: (Picture) -> Void, onFailure: () -> Void) {
    if let picture = download("photo.jpg", from: server) {
        completion(picture)
    } else {
        onFailure()
    }
}

loadPicture(from: someServer) { picture in
    someView.currentPicture = picture
} onFailure: {
    print("Couldn't download the next picture.")
}
```

## [Capturing Values](https://docs.swift.org/swift-book/LanguageGuide/Closures.html#ID103)

```swift
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)

incrementByTen()
// returns a value of 10
incrementByTen()
// returns a value of 20
incrementByTen()
// returns a value of 30

// If you create a second incrementer, it will have its own stored reference to a new, separate runningTotal variable:
let incrementBySeven = makeIncrementer(forIncrement: 7)

incrementBySeven()
// returns a value of 7
```
