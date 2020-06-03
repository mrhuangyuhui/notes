<!-- omit in toc -->
# Yarn Manual

- [Install](#install)
  - [Mac](#mac)
  - [Debian / Ubuntu](#debian--ubuntu)
- [Mirrors](#mirrors)

<https://yarnpkg.com/>

## Install

<https://yarnpkg.com/en/docs/install>

### Mac

```bash
curl -o- -L https://yarnpkg.com/install.sh | bash

echo 'export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"' >> ~/.bash_profile
```

### Debian / Ubuntu

```bash
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -

echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
```

## Mirrors

查看源地址

```bash
yarn config get registry
```

修改源地址

```bash
yarn config set registry https://registry.npm.taobao.org/
```
