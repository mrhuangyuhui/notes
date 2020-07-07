<!-- omit in toc -->
# RubyGems Manual

- [Mirrors](#mirrors)
- [Commands](#commands)
  - [`gem sources`](#gem-sources)
  - [`gem update`](#gem-update)

<https://rubygems.org/> | [RubyGems 镜像 - Ruby China](https://gems.ruby-china.com/)

<https://gems.ruby-china.com/stats>

<https://guides.rubygems.org/>

## Mirrors

[gem-mirrors.md](gem-mirrors.md)

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

https://rubygems.org/

https://github.com/rubygems/rubygems

Installation
https://rubygems.org/pages/download

Command Reference
http://guides.rubygems.org/command-reference/

Guides

http://guides.rubygems.org/

http://guides.rubygems.org/rubygems-basics/

Make your own gem
http://guides.rubygems.org/make-your-own-gem/

Specification reference
http://guides.rubygems.org/specification-reference/


FINDING GEMS
```
# 支持正则表达式搜索
$ gem search ^rails

# 查看详细信息
$ gem search ^rails$ -d

```

INSTALLING GEMS
```
$ gem install drip
```

LISTING INSTALLED GEMS
```
$ gem list
```

UNINSTALLING GEMS
```
$ gem uninstall drip
```

FETCHING AND UNPACKING GEMS
```
$ gem fetch malice
$ gem unpack malice-13.gem
```
