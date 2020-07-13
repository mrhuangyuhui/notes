<!-- omit in toc -->
# Properties

- [Stored Properties](#stored-properties)
- [Computed Properties](#computed-properties)
- [Type Properties](#type-properties)

<https://docs.swift.org/swift-book/LanguageGuide/Properties.html>

Computed properties are provided by classes, structures, and enumerations. Stored properties are provided only by classes and structures.

## [Stored Properties](https://docs.swift.org/swift-book/LanguageGuide/Properties.html#ID255)

[Default Property Values](https://docs.swift.org/swift-book/LanguageGuide/Initialization.html#ID206)

[Assigning Constant Properties During Initialization](https://docs.swift.org/swift-book/LanguageGuide/Initialization.html#ID212)

## [Computed Properties](https://docs.swift.org/swift-book/LanguageGuide/Properties.html#ID259)

In addition to stored properties, classes, structures, and enumerations can define computed properties, which do not actually store a value. Instead, they provide a getter and an optional setter to retrieve and set other properties and values indirectly.

```swift
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
```

Shorthand Setter Declaration

```swift
struct AlternativeRect {
    // ...
    var center: Point {
        // ...
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}
```

Shorthand Getter Declaration

```swift
struct CompactRect {
    // ...
    var center: Point {
        get {
            Point(x: origin.x + (size.width / 2),
                  y: origin.y + (size.height / 2))
        }
        // ...
    }
}
```

[Functions With an Implicit Return](https://docs.swift.org/swift-book/LanguageGuide/Functions.html#ID607)

## [Type Properties](https://docs.swift.org/swift-book/LanguageGuide/Properties.html#ID264)

Stored type properties can be variables or constants. Computed type properties are always declared as variable properties, in the same way as computed instance properties.

> NOTE
>
> Unlike stored instance properties, you must always give stored type properties a default value. This is because the type itself does not have an initializer that can assign a value to a stored type property at initialization time.

```swift
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}
```
