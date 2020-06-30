# `UIApplication` - `canOpenURL`

```objc
KOAuthType authType = KOAuthTypeAccount;
// 判断是否安装了 KakaoTalk
if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"kakaotalk-5.9.7://"]]){
    authType = KOAuthTypeTalk;
}
```

`info.plist`

```plist
<key>LSApplicationQueriesSchemes</key>
<array>
    <string>kakaod292666c23e911bd6ebb1917a3e91af8</string>
    <string>kakaokompassauth</string>
    <string>storykompassauth</string>
    <string>kakaolink</string>
    <string>storylink</string>
    <string>kakaotalk-5.9.7</string>
</array>
```
