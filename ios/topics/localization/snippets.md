# Localization Snippets

```objc
NSURL *url = [[NSBundle mainBundle] URLForResource:@"OverseaSDKEA" withExtension:@"bundle"];
NSBundle *bundle = [NSBundle bundleWithURL:url];
NSString *str1 = [bundle localizedStringForKey:@"tip_read_agreements" value:@"default value" table:@"Localizable"];
// 或
NSString *str2 = NSLocalizedStringWithDefaultValue(@"tip_read_agreements", @"Localizable", bundle, @"default value", @"comment");
```
