<!-- #node-manual -->
<!-- omit in toc -->
# Node Manual

- [Install](#install)
  - [Docker](#docker)
  - [NVM](#nvm)
  - [Linux Binaries](#linux-binaries)
  - [Package Manager](#package-manager)
  - [Source Code](#source-code)
  - [macOS](#macos)
- [References](#references)
- [Tutorials](#tutorials)
- [Test](#test)
- [Tools](#tools)

<https://nodejs.org/en/>

<https://github.com/nodejs/node>

<https://gitee.com/mrhuangyuhui/node>

<https://www.npmjs.com/>

<https://npm.taobao.org/>

<https://npm.runkit.com/>

[Dockerizing a Node.js web app](https://nodejs.org/en/docs/guides/nodejs-docker-webapp/)

<!-- #node-install -->
## Install

[Downloads](https://nodejs.org/en/download/)

[全部版本下载仓库（包括源码）](https://nodejs.org/dist/)

[Previous Releases](https://nodejs.org/en/download/releases/)

<!-- #node-docker -->
### Docker

<https://hub.docker.com/_/node/>

<!-- #node-nvm -->
### NVM

Node 版本管理工具，本地安装推荐这种方式。

<https://github.com/creationix/nvm>

请参考 [NVM Manual](nvm-manual.md)

### Linux Binaries

[node-install-bin.sh](https://github.com/mrhuangyuhui/node/blob/master/node-install-bin.sh)

```bash
yum install -y wget && curl -L https://github.com/mrhuangyuhui/node/raw/master/node-install-bin.sh | bash
```

### Package Manager

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

[Ubuntu](https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions)

```bash
# 8.x
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

# 9.x
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -

apt-get install -y nodejs
```

### Source Code

<https://github.com/nodejs/node/blob/master/BUILDING.md#building-nodejs-on-supported-platforms>

### macOS

```bash
# 创建安装目录
mkdir -p ~/node/

# 进入安装目录
cd ~/node/

# 下载安装包
wget https://nodejs.org/dist/v10.16.3/node-v10.16.3-darwin-x64.tar.gz

# 解压安装包
tar -zxvf node-v10.16.3-darwin-x64.tar.gz

# 创建符号链接
ln -s node-v10.16.3-darwin-x64 current

# 配置环境变量
echo 'export PATH=${PATH}:~/node/current/bin' >> ~/.bash_profile

# 检查安装结果
node -v
```

<!-- #node-ref -->
## References

[Node API](https://nodejs.org/dist/latest-v8.x/docs/api/)

[Node.js Built-in Modules](https://www.w3schools.com/nodejs/ref_modules.asp)

<!-- #node-tutorial -->
## Tutorials

[Learn Node.js (tutorialspoint)](https://www.tutorialspoint.com/nodejs/index.htm)

[Learn Node.js (w3schools)](https://www.w3schools.com/nodejs/)

## Test

<https://mochajs.org/>

<!-- #node-tool -->
## Tools

<https://runkit.com/>

<https://npm.runkit.com/>
