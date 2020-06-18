<!-- omit in toc -->
# Rbenv - Commands

- [`rbenv install`](#rbenv-install)
- [`rbenv versions`](#rbenv-versions)
- [`rbenv version`](#rbenv-version)
- [`rbenv global`](#rbenv-global)
- [`rbenv local`](#rbenv-local)
- [`rbenv which`](#rbenv-which)

<https://github.com/rbenv/rbenv#command-reference>

```bash
rbenv
rbenv -h
rbenv --help

rbenv install -h
rbenv install --help
rbenv help install
```

## `rbenv install`

[Installing Ruby versions](https://github.com/rbenv/rbenv#installing-ruby-versions)

```bash
rbenv install -h
rbenv install --help
rbenv help install
```

列出可安装的 Ruby 版本

```bash
rbenv install -l
```

安装一个 Ruby 版本

```bash
rbenv install 2.7.1 -v
```

## `rbenv versions`

<https://github.com/rbenv/rbenv#rbenv-versions>

Lists all Ruby versions known to rbenv, and shows an asterisk next to the currently active version.

```bash
rbenv versions -h
rbenv versions --help
rbenv help versions
```

```bash
rbenv versions
```

## `rbenv version`

<https://github.com/rbenv/rbenv#rbenv-version>

Displays the currently active Ruby version, along with information on how it was set.

```bash
$ rbenv version
1.9.3-p327 (set by /Users/sam/.rbenv/version)
```

## `rbenv global`

<https://github.com/rbenv/rbenv#rbenv-global>

Sets the global version of Ruby to be used in all shells by writing the version name to the `~/.rbenv/version` file. This version can be overridden by an application-specific `.ruby-version` file, or by setting the `RBENV_VERSION` environment variable.

```bash
rbenv global --help
rbenv help global
```

```bash
rbenv global 1.8.7-p352
```

列出当前使用的全局 Ruby 版本

```bash
rbenv global
```

## `rbenv local`

<https://github.com/rbenv/rbenv#rbenv-local>

Sets a local application-specific Ruby version by writing the version name to a `.ruby-version` file in the current directory. This version overrides the global version, and can be overridden itself by setting the `RBENV_VERSION` environment variable or with the `rbenv shell` command.

```bash
rbenv local 1.9.3-p327
```

查看当前目录的版本配置

```bash
rbenv local
```

删除当前目录的版本配置

```bash
rbenv local --unset
```

## `rbenv which`

<https://github.com/rbenv/rbenv#rbenv-which>

Displays the full path to the executable that rbenv will invoke when you run the given command.

```bash
$ rbenv which ruby
/home/ubuntu/.rbenv/versions/2.7.1/bin/ruby

$ rbenv which irb
/home/ubuntu/.rbenv/versions/2.7.1/bin/irb
```
