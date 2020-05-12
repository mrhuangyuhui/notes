# iOS - Game Center

[GameKit | Apple Developer Documentation](https://developer.apple.com/documentation/gamekit?language=objc)

[Game Center for iOS: Building a Turn-Based Game](https://www.raywenderlich.com/7544-game-center-for-ios-building-a-turn-based-game)

[Game Center Programming Guide](https://developer.apple.com/library/archive/documentation/NetworkingInternet/Conceptual/GameKit_Guide/Introduction/Introduction.html)

- [Working with Players in Game Center](https://developer.apple.com/library/archive/documentation/NetworkingInternet/Conceptual/GameKit_Guide/Users/Users.html)

获取授权（官方示例）

```objc
- (void) authenticateLocalPlayer
{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    localPlayer.authenticateHandler = ^(UIViewController *viewController, NSError *error){
         if (viewController != nil)
         {
             //showAuthenticationDialogWhenReasonable: is an example method name. Create your own method that displays an authentication view when appropriate for your app.
             [self showAuthenticationDialogWhenReasonable: viewController];
         }
         else if (localPlayer.isAuthenticated)
         {
             //authenticatedPlayer: is an example method name. Create your own method that is called after the local player is authenticated.
             [self authenticatedPlayer: localPlayer];
         }
         else
         {
             [self disableGameCenter];
         }
     };
}
```