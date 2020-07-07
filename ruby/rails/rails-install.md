# Rails Install

<https://guides.rubyonrails.org/getting_started.html#installing-rails>

> 注意：要求先安装 Ruby 2.5.0+ 和 sqlite3

```bash
ruby -v
sqlite3 --version
```

安装 `rails`

```bash
gem install rails
```

验证安装结果

```bash
rails --version
which rails
```

创建项目

```bash
rails new blog

# 查看帮助
rails new -h
```

启动服务器

```bash
rails server
```
