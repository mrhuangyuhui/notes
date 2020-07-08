<!-- omit in toc -->
# Bundler Manual

- [Quick Start](#quick-start)
- [Install](#install)
- [Repos](#repos)
- [Gemfile](#gemfile)
- [Commands](#commands)
  - [`bundle config`](#bundle-config)
- [Docs](#docs)

<https://bundler.io/>

## Quick Start

<https://bundler.io/>

```bash
gem install bundler
```

`Gemfile`

```rb
source 'https://rubygems.org'
gem 'nokogiri'
gem 'rack', '~> 2.0.1'
gem 'rspec'
```

```bash
bundle install
```

```bash
git add Gemfile Gemfile.lock
```

## Install

```bash
gem install bundler
```

## Repos

<https://github.com/bundler/bundler>

<https://github.com/mrhuangyuhui/bundler-playground>

## Gemfile

[Gemfile.md](Gemfile.md)

## Commands

<https://bundler.io/v2.0/man/bundle-install.1.html>

```bash
bundle -h
bundle --help
man bundle

bundle help install
bundle install -h
bundle install --help
man bundle-install
```

```bash
bundle -v
bundle --version
bundle version
```

### `bundle config`

```bash
bundle help config
```

列出所有配置项

```bash
bundle config list
```

配置 Gemfile 的源镜像

```bash
bundle config mirror.https://rubygems.org https://gems.ruby-china.com
```

## Docs

<https://bundler.io/docs.html>
