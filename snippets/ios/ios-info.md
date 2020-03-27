# iOS - `Info.plist`

```objc
[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];

[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
```
