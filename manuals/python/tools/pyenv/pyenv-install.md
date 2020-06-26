<!-- omit in toc -->
# Pyenv - Install

- [pyenv-installer](#pyenv-installer)
- [Basic GitHub Checkout](#basic-github-checkout)
- [Homebrew](#homebrew)

<https://github.com/pyenv/pyenv#installation>

> 注意：编译 Python 需要安装以下依赖！

[Common-build-problems#prerequisites](https://github.com/pyenv/pyenv/wiki/Common-build-problems#prerequisites)

Ubuntu

```bash
sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
```

Mac

```bash
brew install readline xz
```

## pyenv-installer

<https://github.com/pyenv/pyenv-installer>

```bash
curl https://pyenv.run | bash
```

配置环境变量

```bash
cat >> ~/.bashrc << EOF
# Pyenv
export PATH="\$HOME/.pyenv/bin:\$PATH"
eval "\$(pyenv init -)"
eval "\$(pyenv virtualenv-init -)"
EOF
```

验证安装结果

```bash
exec "$SHELL"
pyenv --version
```

## Basic GitHub Checkout

<https://github.com/pyenv/pyenv#basic-github-checkout>

```bash
git clone git@gitee.com:mrhuangyuhui/pyenv.git ~/.pyenv
```

配置环境变量

```bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile

echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile

echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile
```

验证安装结果

```bash
exec "$SHELL"
pyenv --version
```

## Homebrew

<https://github.com/pyenv/pyenv#homebrew-on-macos>

<https://formulae.brew.sh/formula/pyenv>

```bash
brew update

brew install pyenv
```

配置环境变量

```bash
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile
```

验证安装结果

```bash
exec "$SHELL"
pyenv --version
```
