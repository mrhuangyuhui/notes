<!-- omit in toc -->
# CocoaPods Commands

- [Repos](#repos)
  - [`pod repo add`](#pod-repo-add)
  - [`pod repo list`](#pod-repo-list)

<https://guides.cocoapods.org/terminal/commands.html>

```bash
pod
pod --help

# 不可用
# pod -h
```

```bash
pod --version
```

初始化 `Podfile` 文件

```bash
pod init
```

安装依赖库

```bash
pod install
```

## Repos

### `pod repo add`

```bash
pod repo add --help
```

### `pod repo list`

List the repos from the local spec-repos directory at `/home/travis/.cocoapods/repos`.

```bash
pod repo list --help
```

```bash
pod repo list
```
