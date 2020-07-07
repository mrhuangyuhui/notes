# ObjC - Singleton

```objc
// .h
+ (instancetype)sharedInstance;

// .m
+ (instancetype)sharedInstance {

    static dispatch_once_t onceToken;

    static <#class#> *sharedInstance;

    dispatch_once(&onceToken, ^{

        sharedInstance = [[<#class#> alloc] init];

    });

    return sharedInstance;
}
```
