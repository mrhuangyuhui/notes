<!-- omit in toc -->
# Kakao Manual

- [Repos](#repos)
- [Examples](#examples)
- [Login](#login)
- [Message](#message)

<https://developers.kakao.com/docs/latest/ko/getting-started/sdk-ios-v1>

## Repos

<https://github.com/KakaoAd/kakao-ad-ios> | [Gitee](https://gitee.com/mrhuangyuhui/kakao-ad-ios)

## Examples

<https://developers.kakao.com/docs/latest/ko/sdk-download/ios-v1>

## Login

<https://developers.kakao.com/docs/latest/ko/kakaologin/ios>

```objc
[[KOSession sharedSession] openWithCompletionHandler:^(NSError *error) {
    ...
} authType:(KOAuthType)KOAuthTypeTalk, nil]];
```

## Message

<https://developers.kakao.com/docs/latest/ko/message/ios>

配置消息样式

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

