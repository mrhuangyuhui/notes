# Gem Manual

<https://rubygems.org/>

<https://guides.rubygems.org/>

RubyGems 国内镜像 <https://gems.ruby-china.com/>

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

查看帮助

```bash
gem sources -h
gem sources --help
gem help sources
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
