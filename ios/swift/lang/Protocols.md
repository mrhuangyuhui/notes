<!-- omit in toc -->
# [Protocols](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)

## [Property Requirements](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html#ID269)

A protocol can require any conforming type to provide an instance property or type property with a particular name and type. The protocol doesn’t specify whether the property should be a stored property or a computed property—it only specifies the required property name and type.

```swift
protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}
```

```swift
protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}

class Starship: FullyNamed {
    // ...
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}
```

## [Method Requirements](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html#ID270)

Protocols can require specific instance methods and type methods to be implemented by conforming types.

Default values, however, can’t be specified for method parameters within a protocol’s definition.

```swift
protocol SomeProtocol {
    static func someTypeMethod()
}
```

```swift
protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    // ...
    func random() -> Double {
        // ...
    }
}
```

## [Mutating Method Requirements](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html#ID271)

[mutating.md](/ios/swift/lang/keywords/mutating.md)

## [Initializer Requirements](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html#ID272)
