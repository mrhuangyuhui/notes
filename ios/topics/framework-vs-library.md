# Framework vs Library

<https://www.jianshu.com/p/0b00d27ed2f5>

<https://medium.com/onfido-tech/distributing-compiled-swift-frameworks-via-cocoapods-8cb67a584d57>

把第三方 SDK 编译进一个 Framework 的设置方法：

设置 `Mach-O Type` 为 `Relocatable Object File`

![img](https://gitee.com/mrhuangyuhui/images/raw/master/ios/ios-frameworks-1.jpg)

删除 `Compatibility Version` 的值

![img](https://gitee.com/mrhuangyuhui/images/raw/master/ios/ios-frameworks-2.jpg)

删除 `Current Library Version` 的值

![img](https://gitee.com/mrhuangyuhui/images/raw/master/ios/ios-frameworks-3.jpg)

[Framework vs Library (Cocoa, iOS) – Knowledge Stack](http://www.knowstack.com/framework-vs-library-cocoa-ios/)

[How to Create a Framework for iOS | raywenderlich.com](https://www.raywenderlich.com/2430-how-to-create-a-framework-for-ios)
