<!-- omit in toc -->
# Rbenv - Install

- [rbenv-installer](#rbenv-installer)
- [Basic GitHub Checkout](#basic-github-checkout)
- [Homebrew](#homebrew)

<https://github.com/rbenv/rbenv#installation>

## rbenv-installer

<https://github.com/rbenv/rbenv-installer>

安装

```bash
# with curl
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash

# alternatively, with wget
wget -q https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer -O- | bash
```

配置

```bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile

~/.rbenv/bin/rbenv init

echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

source ~/.bash_profile
```

验证安装结果

```bash
rbenv

curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
```

## Basic GitHub Checkout

<https://github.com/rbenv/rbenv#basic-github-checkout>

```bash
git clone https://github.com/rbenv/rbenv.git ~/.rbenv

# Optionally, try to compile dynamic bash extension to speed up rbenv. Don't worry if it fails; rbenv will still work normally:
cd ~/.rbenv && src/configure && make -C src

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile

~/.rbenv/bin/rbenv init

echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

source ~/.bash_profile
```

验证安装结果

```bash
rbenv
```

安装插件 [ruby-build](ruby-build.md)

```bash
mkdir -p "$(rbenv root)"/plugins

git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
```

验证安装结果

```bash
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
```

## Homebrew

```bash
brew install rbenv

rbenv init

echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

source ~/.bash_profile
```

验证安装结果

```bash
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
```
