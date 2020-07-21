# Twitter SDK Manual

<https://developer.twitter.com/en>

<https://github.com/twitter-archive/twitter-kit-ios>

<https://github.com/twitter-archive/twitter-kit-ios/releases>

<https://github.com/touren/twitter-kit-ios>

<https://developer.twitter.com/en/docs/basics/authentication/guides/log-in-with-twitter>

系统库

```
MapKit.framework
```

配置 `Info.plist`

```xml
<plist version="1.0">
    <dict>
        <key>CFBundleURLTypes</key>
        <array>
            <dict>
                <key>CFBundleTypeRole</key>
                <string>Editor</string>
                <key>CFBundleURLSchemes</key>
                <array>
                    <string>twitterkit-yUwQWgueLToTFs9kTc3oPzfPc</string>
                </array>
            </dict>
        </array>
        <key>LSApplicationQueriesSchemes</key>
        <array>
            <string>twitter</string>
            <string>twitterauth</string>
        </array>
        <key>TwitterKey</key>
        <string>yUwQWgueLToTFs9kTc3oPzfPc</string>
        <key>TwitterSecret</key>
        <string>vuS4SWNiFuVdGlQVjHz4VaLIgFtG6P5gK1uLjYejbdJpLdulxm</string>
    </dict>
</plist>
```

初始化 `AppDelegate.m`

```objc
#import <TwitterKit/TWTRKit.h>
#import <TwitterCore/TwitterCore.h>

NSString *key = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"TwitterKey"];
NSString *secret = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"TwitterSecret"];
[[Twitter sharedInstance] startWithConsumerKey:key consumerSecret:secret];

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    if ([[Twitter sharedInstance] application:application openURL:url options:options]) return YES;
    return NO;
}
```

