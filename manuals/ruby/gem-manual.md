<!-- omit in toc -->
# Gem Manual

- [Mirrors](#mirrors)
- [Commands](#commands)
  - [`gem sources`](#gem-sources)
  - [`gem update`](#gem-update)

<https://rubygems.org/>

<https://guides.rubygems.org/>

## Mirrors

配置 RubyGems 国内镜像 <https://gems.ruby-china.com/>

> 提示：[点击查看 `gem sources` 的详细用法](#gem-sources)

```bash
$ gem update --system # 这里请翻墙一下
$ gem -v
2.6.3

$ gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/
$ gem sources -l
https://gems.ruby-china.com
# 确保只有 gems.ruby-china.com
```

可直接在配置文件修改 Gem 源

```bash
$ cat ~/.gemrc
---
:backtrace: false
:bulk_threshold: 1000
:sources:
- https://gems.ruby-china.com/
:update_sources: true
:verbose: true
:concurrent_downloads:
```

## Commands

查看帮助

```bash
gem -h
gem --help

# 列出全部命令
gem help commands
# 列出使用实例
gem help examples
# 在 http://localhost:8808/ 上列出已安装的 gems
gem server

# 查看子命令的帮助
gem help install
```

### `gem sources`

```bash
gem sources -h
gem sources --help
gem help sources
```

可直接在配置文件修改 Gem 源

```bash
$ cat ~/.gemrc
---
:backtrace: false
:bulk_threshold: 1000
:sources:
- https://gems.ruby-china.com/
:update_sources: true
:verbose: true
:concurrent_downloads:
```

列出全部软件源

```bash
gem sources -l
```

添加软件源

```bash
gem sources --add https://gems.ruby-china.com/
```

移除软件源

```bash
gem sources --remove https://rubygems.org/
```

### `gem update`

查看帮助

```bash
gem help update
```

更新 RubyGems 系统软件

```bash
gem update --system
```
