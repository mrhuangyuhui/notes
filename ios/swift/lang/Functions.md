<!-- omit in toc -->
# [Functions](https://docs.swift.org/swift-book/LanguageGuide/Functions.html)

- [Defining and Calling Functions](#defining-and-calling-functions)
- [Function Parameters and Return Values](#function-parameters-and-return-values)
  - [Functions Without Parameters](#functions-without-parameters)
  - [Functions With Multiple Parameters](#functions-with-multiple-parameters)
  - [Functions Without Return Values](#functions-without-return-values)
  - [Functions with Multiple Return Values](#functions-with-multiple-return-values)
  - [Optional Tuple Return Types](#optional-tuple-return-types)
  - [Functions With an Implicit Return](#functions-with-an-implicit-return)
- [Function Argument Labels and Parameter Names](#function-argument-labels-and-parameter-names)
  - [Specifying Argument Labels](#specifying-argument-labels)
  - [Omitting Argument Labels](#omitting-argument-labels)
  - [Default Parameter Values](#default-parameter-values)
  - [Variadic Parameters](#variadic-parameters)
  - [In-Out Parameters](#in-out-parameters)
- [Function Types](#function-types)
  - [Using Function Types](#using-function-types)
  - [Function Types as Parameter Types](#function-types-as-parameter-types)
  - [Function Types as Return Types](#function-types-as-return-types)

## Defining and Calling Functions

```swift
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}
print(greet(person: "Anna"))
```

## Function Parameters and Return Values

### Functions Without Parameters

```swift
func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())
```

### Functions With Multiple Parameters

```swift
func greet(person: String, alreadyGreeted: Bool) -> String {
    // ...
}
print(greet(person: "Tim", alreadyGreeted: true))
```

### Functions Without Return Values

```swift
func greet(person: String) {
    print("Hello, \(person)!")
}
greet(person: "Dave")
```

The return value of a function can be ignored when it is called:

```swift
func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
```

> NOTE
>
> Return values can be ignored, but a function that says it will return a value must always do so. A function with a defined return type cannot allow control to fall out of the bottom of the function without returning a value, and attempting to do so will result in a compile-time error.

### Functions with Multiple Return Values

```swift
func minMax(array: [Int]) -> (min: Int, max: Int) {
    // ...
    return (currentMin, currentMax)
}
let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")
```

### Optional Tuple Return Types

```swift
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    // ...
    return (currentMin, currentMax)
}
```

### Functions With an Implicit Return

```swift
func greeting(for person: String) -> String {
    "Hello, " + person + "!"
}
print(greeting(for: "Dave"))
```

[Shorthand Getter Declaration](https://docs.swift.org/swift-book/LanguageGuide/Properties.html#ID608)

## [Function Argument Labels and Parameter Names](https://docs.swift.org/swift-book/LanguageGuide/Functions.html#ID166)

### Specifying Argument Labels

```swift
func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet(person: "Bill", from: "Cupertino"))
```

### Omitting Argument Labels

```swift
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    // ...
}
someFunction(1, secondParameterName: 2)
```

### Default Parameter Values

```swift
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // ...
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6)
someFunction(parameterWithoutDefault: 4)
```

### Variadic Parameters

```swift
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
```

> NOTE
>
> A function may have at most one variadic parameter.

### In-Out Parameters

> NOTE
>
> In-out parameters cannot have default values, and variadic parameters cannot be marked as inout.

```swift
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// Prints "someInt is now 107, and anotherInt is now 3"
```

## [Function Types](https://docs.swift.org/swift-book/LanguageGuide/Functions.html#ID174)

```swift
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}
```

### Using Function Types

```swift
var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2, 3))")

mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")
```

### Function Types as Parameter Types

```swift
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)
```

### Function Types as Return Types

```swift
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}
```
