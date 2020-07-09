# `Info.plist`

[Information Property List | Apple Developer Documentation](https://developer.apple.com/documentation/bundleresources/information_property_list)

[Information Property List Key Reference](https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Introduction/Introduction.html#//apple_ref/doc/uid/TP40009247)

```objc
NSDictionary *dict = [[NSBundle mainBundle] infoDictionary];
NSString *subject = [NSString stringWithFormat:@"%@お問い合わせ", dict[@"CFBundleName"]];
// 或
NSString *subject = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
```
