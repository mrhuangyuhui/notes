# Rails Manual

<https://rubyonrails.org/>

<https://github.com/rails/rails>

<https://guides.rubyonrails.org/getting_started.html>

<https://api.rubyonrails.org/v6.0.2.1/>

## [Install](https://guides.rubyonrails.org/getting_started.html#installing-rails)

> 注意：要求先安装 Ruby 2.5.0 以上版本和 sqlite3

```bash
ruby -v
sqlite3 --version
```

安装 `rails`

```bash
gem install rails
```

检查安装结果

```bash
rails --version
```

创建项目

```bash
rails new blog

# 查看创建命令的帮助
rails new -h
```

### Docker

```bash
# 安装 Rails
gem install rails

# 安装 SQLite 3
apt-get update && apt-get install -y sqlite3

# 安装 Node
curl -sL https://deb.nodesource.com/setup_12.x | bash -

apt-get install -y nodejs

# 安装 Yarn
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -

echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

apt-get update && apt-get install -y yarn
```

## [Commands](https://guides.rubyonrails.org/command_line.html)

### [`rails new`](https://guides.rubyonrails.org/command_line.html#rails-new)

查看帮助

```bash
rails new -h
rails new --help
```

## Refrences

<https://guides.rubyonrails.org/api_documentation_guidelines.html>

<https://api.rubyonrails.org/v6.0.2.1/>
