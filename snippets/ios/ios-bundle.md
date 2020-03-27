# iOS - Bundle

```objc
- (instancetype)init {
    self = [super initWithNibName:@"SDKDemoViewController" bundle:[NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:@"SDKDemoBundle" withExtension:@"bundle"]]];
    if (self) {
        return self;
    }
    return self;
}
```

```objc
- (instancetype)init {
    self = [super initWithNibName:@"SDKDemoViewController" bundle:[NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:@"Frameworks/SDKDemo.framework/SDKDemoBundle" withExtension:@"bundle"]]];
    if (self) {
        return self;
    }
    return self;
}
```

---

> Tags: resource, bundle
