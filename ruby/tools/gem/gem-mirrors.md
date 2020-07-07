<!-- #gem-mirror -->
# Gem Mirrors

查看当前源地址

```bash
gem sources -l
```

配置 RubyGems 国内镜像 <https://gems.ruby-china.com/>

```bash
$ gem update --system # 这里请翻墙一下
$ gem -v
2.6.3

$ gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/
$ gem sources -l
https://gems.ruby-china.com
# 确保只有 gems.ruby-china.com
```

可直接在配置文件修改源地址

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
