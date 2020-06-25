<!-- omit in toc -->
# Vagrant Manual

- [Install](#install)
  - [Mac](#mac)
  - [CentOS](#centos)
  - [Ubuntu](#ubuntu)
- [Quick Start](#quick-start)
- [Commands](#commands)
  - [`vagrant global-status`](#vagrant-global-status)
  - [`vagrant box`](#vagrant-box)
    - [`vagrant box add`](#vagrant-box-add)
    - [`vagrant box list`](#vagrant-box-list)
    - [`vagrant box remove`](#vagrant-box-remove)
  - [`vagrant init`](#vagrant-init)
  - [`vagrant up`](#vagrant-up)
  - [`vagrant reload`](#vagrant-reload)
  - [`vagrant destroy`](#vagrant-destroy)
  - [`vagrant provision`](#vagrant-provision)
  - [`vagrant ssh`](#vagrant-ssh)
- [Vagrantfile](#vagrantfile)
- [Configs](#configs)
- [Provisioning](#provisioning)
- [Boxes](#boxes)
- [Share](#share)
- [References](#references)

<https://www.vagrantup.com/>

<https://app.vagrantup.com/boxes/search>

[Getting Started](https://www.vagrantup.com/intro/index.html)

[Vagrant Documentation](https://www.vagrantup.com/docs/index.html)

<https://github.com/hashicorp/vagrant>

<https://sourcegraph.com/github.com/hashicorp/vagrant>

<https://gems.ruby-china.com/gems/vagrant>

<!-- #vagrant-install -->
## Install

<https://www.vagrantup.com/intro/getting-started/install.html>

<https://www.vagrantup.com/downloads.html>

### Mac

<https://releases.hashicorp.com/vagrant/2.2.7/vagrant_2.2.7_x86_64.dmg>

> 提示：如果已经安装了旧版本，请先用脚本 `uninstall.tool` 进行卸载！

![img](https://gitee.com/mrhuangyuhui/images/raw/master/vagrant/vagrant-install-mac-1.png)

### CentOS

```bash
wget https://releases.hashicorp.com/vagrant/2.2.6/vagrant_2.2.6_x86_64.rpm

sudo rpm -ivh vagrant_2.2.6_x86_64.rpm

vagrant
```

### Ubuntu

```bash
# 下载安装包
wget https://releases.hashicorp.com/vagrant/2.2.4/vagrant_2.2.4_x86_64.deb

# 开始安装
sudo dpkg -i vagrant_2.2.4_x86_64.deb

# 检查安装结果
vagrant
```

<!-- #vagrant-tutorial -->
## Quick Start

[Getting Started](https://www.vagrantup.com/intro/getting-started/index.html)

- [Project Setup](https://www.vagrantup.com/intro/getting-started/project_setup.html)

```bash
mkdir vagrant_getting_started
cd vagrant_getting_started

# 初始化环境，生成 Vagrantfile，使用的盒子是 hashicorp/precise64。
vagrant init hashicorp/precise64
```

> 提示：`Vagrantfile` 使用的语言是 Ruby，使用方法请参考 [#Vagrantfile](#vagrantfile)。

- [Boxes](https://www.vagrantup.com/intro/getting-started/boxes.html)

```bash
# 安装盒子
vagrant box add hashicorp/bionic64
```

- [Up And SSH](https://www.vagrantup.com/intro/getting-started/up.html)

```bash
# 启动虚拟机
vagrant up

# 登录虚拟机
vagrant ssh
```

- [Synced Folders](https://www.vagrantup.com/intro/getting-started/synced_folders.html)

> By default, Vagrant shares your project directory (remember, that is the one with the `Vagrantfile`) to the `/vagrant` directory in your guest machine.

- [Provisioning](https://www.vagrantup.com/intro/getting-started/provisioning.html)

> 提示：第一次执行命令 `vagrant up` 时会自动执行用户的自定义脚本，执行命令 `vagrant reload --provision` 可进行重载。

`bootstrap.sh`

```bash
#!/usr/bin/env bash

apt-get update
apt-get install -y apache2
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi
```

`Vagrantfile`

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"
  # 指定用户的自定义脚本
  config.vm.provision :shell, path: "bootstrap.sh"
end
```

- [Networking](https://www.vagrantup.com/intro/getting-started/networking.html)

`Vagrantfile`

```bash
Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"
  config.vm.provision :shell, path: "bootstrap.sh"
  # 端口映射
  config.vm.network :forwarded_port, guest: 80, host: 4567
end
```

重载配置文件 `Vagrantfile`

```bash
vagrant reload
# 如果已经关机，直接启动即可。
vagrant up
```

- [Teardown](https://www.vagrantup.com/intro/getting-started/teardown.html)

```bash

# 暂停虚拟机
vagrant suspend

# 关闭虚拟机
vagrant halt

# 销毁虚拟机
vagrant destroy
```

```bash
# 查看虚拟机的状态
vagrant status

# 列出所有虚拟机的状态
vagrant global-status
```

<!-- #vagrant-cmd -->
## Commands

<https://www.vagrantup.com/docs/cli/>

```bash
vagrant
vagrant -h
vagrant --help

vagrant up -h
vagrant up --help
vagrant help up
```

列出全部子命令

```bash
vagrant list-commands
```

```bash
vagrant -v
```

```bash
# 启动/重启虚拟机
vagrant up

# 登录虚拟机
vagrant ssh

# 查看虚拟机状态
vagrant status

# 关闭虚拟机
vagrant halt

# 暂停虚拟机
vagrant suspend

# 关闭并重置虚拟机
vagrant destroy

# 查看所有虚拟机的状态
vagrant global-status
```

重载虚拟机配置

```bash
vagrant reload --provision
```

```bash
mkdir vagrant_getting_started
cd vagrant_getting_started

# 初始化环境
vagrant init hashicorp/precise64
```

```bash
# 安装 Box
vagrant box add hashicorp/precise64
```

### `vagrant global-status`

列出所有虚拟机的状态

```bash
vagrant global-status
```

### `vagrant box`

<https://www.vagrantup.com/intro/getting-started/boxes.html>

```bash
vagrant box -h
vagrant box --help
```

#### `vagrant box add`

安装盒子

```bash
vagrant box add -h
vagrant box add --help
```

```bash
# 安装最新版本
vagrant box add laravel/homestead --provider virtualbox
# 安装指定版本
vagrant box add laravel/homestead --provider virtualbox --box-version 9.4.0
```

#### `vagrant box list`

列出已安装的盒子

```bash
vagrant box list -h
vagrant box list --help
```

```bash
vagrant box list
```

#### `vagrant box remove`

卸载已安装的盒子

```bash
vagrant box remove -h
vagrant box remove --help
```

```bash
vagrant box remove laravel/homestead
```

### `vagrant init`

初始化 Vagrant 环境，生成 `Vagrantfile`。

```bash
cd myapp
vagrant init hashicorp/bionic64
```

### `vagrant up`

查看帮助

```bash
vagrant up -h
vagrant up --help
vagrant help up
```

### `vagrant reload`

<https://www.vagrantup.com/docs/cli/reload.html>

```bash
vagrant reload -h
vagrant reload --help
```

重载 `Vagrantfile`，相当于关机重启。

```bash
vagrant reload
# 重新执行 Provision
vagrant reload --provision
```

### `vagrant destroy`

销毁虚拟机

```bash
vagrant destroy 5eda868
```

### `vagrant provision`

[`Provisioning`](#provisioning)

```bash
vagrant provision --help
```

```bash
vagrant provision
```

### `vagrant ssh`

登录虚拟机

```bash
vagrant ssh 6b5a146
```

## Vagrantfile

[`vagrantfile.md`](vagrantfile.md)

## Configs

<https://www.vagrantup.com/intro/getting-started/boxes.html>

## Provisioning

<https://www.vagrantup.com/docs/provisioning/>

Provisioning 在以下三种情况被执行：

- 第一次执行命令 `vagrant up` 启动虚拟机
- 在运行中的虚拟机执行命令 `vagrant provision`
- 执行命令 `vagrant reload --provision`

[`config.vm.provision`](vagrantfile.md#configvmprovision)

<!-- #vagrant-box -->
## Boxes

<https://app.vagrantup.com/boxes/search>

<https://www.vagrantup.com/intro/getting-started/boxes.html>

## Share

[Vagrant Share](vagrant-share.md)

<!-- #vagrant-ref -->
## References

[Vagrantfile](https://www.vagrantup.com/docs/vagrantfile/)

[Vagrant Share](https://www.vagrantup.com/docs/share/)
