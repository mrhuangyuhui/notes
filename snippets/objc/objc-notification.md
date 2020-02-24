# ObjC - Notification

发送广播

```objc
[[NSNotificationCenter defaultCenter] postNotificationName:kNotificationCloseShareView object:nil];
```

监听广播

```objc
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(myMethod:) name:@"myNotification" object:nil];
```
