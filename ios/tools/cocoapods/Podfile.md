<!-- omit in toc -->
# `Podfile`

- [Examples](#examples)
- [Dependencies](#dependencies)
  - [`pod`](#pod)
- [Target configuration](#target-configuration)
  - [`platform`](#platform)

[Podfile Syntax Reference](https://guides.cocoapods.org/syntax/podfile.html)

## Examples

<https://github.com/CocoaPods/CocoaPods/tree/master/examples>

[AFNetworking Example/Podfile](https://github.com/CocoaPods/CocoaPods/blob/master/examples/AFNetworking%20Example/Podfile)

## Dependencies

### `pod`

<https://guides.cocoapods.org/syntax/podfile.html#pod>

Specifies a dependency of the project.

最新版本

```rb
pod 'SSZipArchive'
```

指定版本

```rb
pod 'Objection', '0.9'
```

指定 Specs 的源地址

```rb
pod 'PonyDebugger', :source => 'https://github.com/CocoaPods/Specs.git'
```

指定 Pod 的仓库地址

```rb
# To use the master branch of the repository:
pod 'AFNetworking', :git => 'https://github.com/gowalla/AFNetworking.git'

# To use a different branch of the repository:
pod 'AFNetworking', :git => 'https://github.com/gowalla/AFNetworking.git', :branch => 'dev'

# To use a tag of the repository:
pod 'AFNetworking', :git => 'https://github.com/gowalla/AFNetworking.git', :tag => '0.7.0'

# Or specify a commit:
pod 'AFNetworking', :git => 'https://github.com/gowalla/AFNetworking.git', :commit => '082f8319af'
```

## Target configuration

### `platform`

<https://guides.cocoapods.org/syntax/podfile.html#platform>

Specifies the platform for which a static library should be built.

```rb
platform :ios, '4.0'
platform :ios
```
