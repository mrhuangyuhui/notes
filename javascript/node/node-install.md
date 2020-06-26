<!-- omit in toc -->
# Node - Install

- [Docker](#docker)
- [NVM](#nvm)
- [YUM](#yum)
- [APT](#apt)

<https://nodejs.org/en/download/>

<https://nodejs.org/dist/>

<https://nodejs.org/en/download/releases/>

<!-- #node-docker -->
## Docker

> [`node-docker.md`](node-docker.md)

<https://hub.docker.com/_/node/>

<!-- #node-nvm -->
## NVM

Node 版本管理工具，本地安装推荐这种方式。

[`nvm-manual.md`](/manuals/node/tools/nvm-manual.md)

## YUM

<https://nodejs.org/en/download/package-manager/>

<https://github.com/nodesource/distributions>

[CentOS](https://nodejs.org/en/download/package-manager/#enterprise-linux-and-fedora)

```bash
# 8.x
curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -

# 9.x
curl --silent --location https://rpm.nodesource.com/setup_9.x | sudo bash -

yum -y install nodejs
```

epel

```bash
yum install -y epel-release
yum install -y nodejs
```

## APT

[Ubuntu](https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions)

```bash
# 8.x
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

# 9.x
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -

apt-get install -y nodejs
```
