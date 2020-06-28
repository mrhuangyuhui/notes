<!-- omit in toc -->
# Kakao SDK Manual

- [Downlaods](#downlaods)
- [Repos](#repos)
- [Examples](#examples)
- [API](#api)
- [注册程序](#注册程序)
- [配置参数](#配置参数)
- [登录授权](#登录授权)
- [用户信息](#用户信息)
- [分享信息](#分享信息)
- [KakaoAd](#kakaoad)

<https://developers.kakao.com/docs/latest/ko/getting-started/sdk-ios-v1>

<https://developers.kakao.com/docs/latest/ko/sdk-download/ios-v1>

`KakaoOpenSDK.framework/Headers/KakaoOpenSDK.h`

```objc
#define KAKAO_SDK_IOS_VERSION_STRING    @"1.23.1"
```

## Downlaods

## Repos

<https://gitee.com/mrhuangyuhui/kakao-samples>

<https://github.com/KakaoAd/kakao-ad-ios> | [Gitee](https://gitee.com/mrhuangyuhui/kakao-ad-ios)

## Examples

<https://developers.kakao.com/docs/latest/ko/sdk-download/ios-v1>

## API

<https://developers.kakao.com/sdk/reference/ios-legacy/release/index.html>

## 注册程序

<https://developers.kakao.com/docs/latest/ko/getting-started/app>

## 配置参数

<https://developers.kakao.com/docs/latest/ko/getting-started/sdk-ios-v1>

[`CFBundleURLTypes`](https://gitee.com/mrhuangyuhui/kakao-samples/blob/master/KakaoOpenSDK-1.23.1/samples/objc/KakaoSample/KakaoSample/Info.plist#L28)

[`KAKAO_APP_KEY`](https://gitee.com/mrhuangyuhui/kakao-samples/blob/master/KakaoOpenSDK-1.23.1/samples/objc/KakaoSample/KakaoSample/Info.plist#L35)

[`LSApplicationQueriesSchemes`](https://gitee.com/mrhuangyuhui/kakao-samples/blob/master/KakaoOpenSDK-1.23.1/samples/objc/KakaoSample/KakaoSample/Info.plist#L38)

## 登录授权

<https://developers.kakao.com/docs/latest/ko/kakaologin/common>

<https://developers.kakao.com/docs/latest/ko/kakaologin/ios>

[`AppDelegate.m`](https://gitee.com/mrhuangyuhui/kakao-samples/blob/master/KakaoOpenSDK-1.23.1/samples/objc/KakaoSample/KakaoSample/AppDelegate.m#L74)

```objc
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    if ([KOSession handleOpenURL:url]) {
        return YES;
    }
    return NO;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options {
    if ([KOSession handleOpenURL:url]) {
        return YES;
    }
    return NO;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [KOSession handleDidEnterBackground];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [KOSession handleDidBecomeActive];
}
```

[`LoginViewController.m`](https://gitee.com/mrhuangyuhui/kakao-samples/blob/master/KakaoOpenSDK-1.23.1/samples/objc/KakaoSample/KakaoSample/LoginViewController.m#L24)

```objc
- (IBAction)login:(id)sender {
    KOSession *session = [KOSession sharedSession];

    if (session.isOpen) {
        [session close];
    }

    [session openWithCompletionHandler:^(NSError *error) {
        if (!session.isOpen) {
            switch (error.code) {
                case KOErrorCancelled:
                    break;
                default:
                    [UIAlertController showMessage:error.description];
                    break;
            }
        }
    }];
}
```

## 用户信息

<https://developers.kakao.com/docs/latest/ko/user-mgmt/common>

<https://developers.kakao.com/docs/latest/ko/user-mgmt/ios>

[`UserMgmtViewController.m`](https://gitee.com/mrhuangyuhui/kakao-samples/blob/master/KakaoOpenSDK-1.23.1/samples/objc/KakaoSample/KakaoSample/UserMgmtViewController.m#L62)

```objc
[KOSessionTask userMeTaskWithCompletion:^(NSError *error, KOUserMe *me) {
    if (error) {
        NSLog(@"사용자 정보 요청 실패: %@", error);
    }
    else {
        NSLog(@"사용자 정보: %@", me);
    }
}];
```

API

[KOUserMe Class Reference](https://developers.kakao.com/sdk/reference/ios-legacy/release/Classes/KOUserMe.html)

## 分享信息

<https://developers.kakao.com/docs/latest/ko/message/common>

<https://developers.kakao.com/docs/latest/ko/message/ios>

[`AppDelegate.m`](https://gitee.com/mrhuangyuhui/kakao-samples/blob/master/KakaoOpenSDK-1.23.1/samples/objc/LinkSample/LinkSample/AppDelegate.m)

```objc
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    if ([[KLKTalkLinkCenter sharedCenter] isTalkLinkCallback:url]) {
        NSString *params = url.query;
        [UIAlertController showMessage:[NSString stringWithFormat:@"카카오링크 메시지 액션\n%@", params]];
        return YES;
    }
    return NO;
}
```

配置消息样式

[ViewController.m](https://gitee.com/mrhuangyuhui/kakao-samples/blob/master/KakaoOpenSDK-1.23.1/samples/objc/LinkSample/LinkSample/ViewController.m)

```objc
// 기본 템플릿 - feed 템플릿 생성 예제
- (KMTTemplate*)feedTemplate {
    KMTTemplate *template = [KMTFeedTemplate feedTemplateWithBuilderBlock:^(KMTFeedTemplateBuilder * _Nonnull feedTemplateBuilder) {

        // 콘텐츠
        feedTemplateBuilder.content = [KMTContentObject contentObjectWithBuilderBlock:^(KMTContentBuilder * _Nonnull contentBuilder) {
            contentBuilder.title = @"디저트 사진";
            contentBuilder.desc = @"아메리카노, 빵, 케익";
            contentBuilder.imageURL = [NSURL URLWithString:@"http://mud-kage.kakao.co.kr/dn/NTmhS/btqfEUdFAUf/FjKzkZsnoeE4o19klTOVI1/openlink_640x640s.jpg"];
            contentBuilder.link = [KMTLinkObject linkObjectWithBuilderBlock:^(KMTLinkBuilder * _Nonnull linkBuilder) {
                linkBuilder.mobileWebURL = [NSURL URLWithString:@"https://developers.kakao.com"];
            }];
        }];

        // 소셜
        feedTemplateBuilder.social = [KMTSocialObject socialObjectWithBuilderBlock:^(KMTSocialBuilder * _Nonnull socialBuilder) {
            socialBuilder.likeCount = @(10);
            socialBuilder.commnentCount = @(20);
            socialBuilder.sharedCount = @(30);
            socialBuilder.viewCount = @(40);
        }];

        // 버튼
        [feedTemplateBuilder addButton:[KMTButtonObject buttonObjectWithBuilderBlock:^(KMTButtonBuilder * _Nonnull buttonBuilder) {
            buttonBuilder.title = @"웹으로 이동";
            buttonBuilder.link = [KMTLinkObject linkObjectWithBuilderBlock:^(KMTLinkBuilder * _Nonnull linkBuilder) {
                linkBuilder.mobileWebURL = [NSURL URLWithString:@"https://developers.kakao.com"];
            }];
        }]];
        [feedTemplateBuilder addButton:[KMTButtonObject buttonObjectWithBuilderBlock:^(KMTButtonBuilder * _Nonnull buttonBuilder) {
            buttonBuilder.title = @"앱으로 이동";
            buttonBuilder.link = [KMTLinkObject linkObjectWithBuilderBlock:^(KMTLinkBuilder * _Nonnull linkBuilder) {
                linkBuilder.iosExecutionParams = @"param1=value1&param2=value2";
                linkBuilder.androidExecutionParams = @"param1=value1&param2=value2";
            }];
        }]];
    }];

    return template;
}
```

发送消息

```objc
[[KLKTalkLinkCenter sharedCenter] sendDefaultWithTemplate:<#YourFeedTemplate#>
                                                    success:^(NSDictionary<NSString *,NSString *> * _Nullable warningMsg,
                                                            NSDictionary<NSString *,NSString *> * _Nullable argumentMsg) {
    NSLog(@"successs request: warningMsg:%@ argMsg:%@", warningMsg, argumentMsg);
} failure:^(NSError * _Nonnull error) {
    NSLog(@"failed request - error: %@", error);
}];
```

## KakaoAd

<https://github.com/KakaoAd/kakao-ad-ios> | [Gitee](https://gitee.com/mrhuangyuhui/kakao-ad-ios)

<https://github.com/KakaoAd/kakao-ad-ios/releases>

<https://developers.kakao.com/docs/latest/ko/kakaomoment/common>

<https://moment.kakao.com/>

接入配置

<https://kakaoad.github.io/kakao-ad-ios/install-sdk.html>

<https://kakaoad.github.io/kakao-ad-ios/project-setting.html>

API <https://kakaoad.github.io/kakao-ad-ios/>
