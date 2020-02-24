# Vagrant Manual

<https://www.vagrantup.com/>

<https://app.vagrantup.com/boxes/search>

[Getting Started](https://www.vagrantup.com/intro/index.html)

[Vagrant Documentation](https://www.vagrantup.com/docs/index.html)

## [Install](https://www.vagrantup.com/intro/getting-started/install.html)

<https://www.vagrantup.com/downloads.html>

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

## Quickstart

<https://www.vagrantup.com/intro/getting-started/index.html>

```bash
mkdir vagrant_getting_started
cd vagrant_getting_started

# 初始化环境
vagrant init hashicorp/precise64

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

## Commands

查看帮助

```bash
vagrant
vagrant -h
vagrant --help

# 列出全部子命令
vagrant list-commands

# 查看子命令的帮助
vagrant up -h
vagrant up --help
vagrant help up
```

```bash
# 查看版本信息
vagrant -v
```

```bash
mkdir vagrant_getting_started
cd vagrant_getting_started

# 初始化环境
vagrant init hashicorp/precise64

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

```bash
# 安装 Box
vagrant box add hashicorp/precise64
```

### `vagrant box`

查看帮助

```bash
vagrant box -h
vagrant box --help
```

安装盒子

```bash
vagrant box add -h

vagrant box add laravel/homestead --provider virtualbox
```

列出已安装的盒子

```bash
vagrant box list -h

vagrant box list
```

卸载已安装的盒子

#### `vagrant box remove`

```bash
vagrant box remove -h
vagrant box remove --help

vagrant box remove laravel/homestead
```

### `vagrant up`

查看帮助

```bash
vagrant up -h
vagrant up --help
vagrant help up
```

### `vagrant reload`

```bash
vagrant reload -h
vagrant reload --help
```

重载虚拟机配置

```bash
vagrant reload --provision
```

## Configs

配置虚拟机盒子

<https://www.vagrantup.com/intro/getting-started/boxes.html>

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise64"
end
```

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise64"
  config.vm.box_version = "1.1.0"
end
```

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise64"
  config.vm.box_url = "https://vagrantcloud.com/hashicorp/precise64"
end
```

配置启动脚本

```ruby
Vagrant.configure("2") do |config|
  config.vm.provision :shell, path: "bootstrap.sh"
end
```

配置端口映射

```bash
Vagrant.configure("2") do |config|
  config.vm.network :forwarded_port, guest: 80, host: 4567
end
```
