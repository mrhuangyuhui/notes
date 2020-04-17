<!-- #vagrantfile -->
<!-- omit in toc -->
# Vagrantfile

- [`Vagrant.configure`](#vagrantconfigure)
- [`Vagrant.require_version`](#vagrantrequireversion)
- [`config.vm`](#configvm)
  - [`config.vm.box`](#configvmbox)
  - [`config.vm.box_version`](#configvmboxversion)
  - [`config.vm.define`](#configvmdefine)
  - [`config.vm.hostname`](#configvmhostname)
  - [`config.vm.provision`](#configvmprovision)
  - [`config.vm.synced_folder`](#configvmsyncedfolder)

<https://www.vagrantup.com/docs/vagrantfile/>

> 提示：文档没列出的 API 可以搜索 <https://sourcegraph.com/github.com/hashicorp/vagrant>

[![img](https://gitee.com/mrhuangyuhui/images/raw/master/vagrant/vagrant-sourcegraph-1.png)](https://sourcegraph.com/github.com/hashicorp/vagrant)

## `Vagrant.configure`

限定 `Vagrantfile` 的 API 版本

[Configuration Version](https://www.vagrantup.com/docs/vagrantfile/version.html)

[repo:^github\.com/laravel/homestead$ Vagrant.configure - Sourcegraph](https://sourcegraph.com/search?q=repo:%5Egithub%5C.com/laravel/homestead%24+Vagrant.configure&patternType=structural)

## `Vagrant.require_version`

限定 Vagrant 的程序版本

[Minimum Vagrant Version](https://www.vagrantup.com/docs/vagrantfile/vagrant_version.html)

[repo:^github\.com/laravel/homestead$ Vagrant.require_version - Sourcegraph](https://sourcegraph.com/search?q=repo:%5Egithub%5C.com/laravel/homestead%24+Vagrant.require_version&patternType=structural)

## `config.vm`

设置虚拟机

[Machine Settings](https://www.vagrantup.com/docs/vagrantfile/machine_settings.html)

### `config.vm.box`

设置虚拟机的盒子

<https://www.vagrantup.com/docs/vagrantfile/machine_settings.html#config-vm-box>

[repo:^github\.com/laravel/homestead$ config.vm.box - Sourcegraph](https://sourcegraph.com/search?q=repo:%5Egithub%5C.com/laravel/homestead%24+config.vm.box&patternType=structural)

### `config.vm.box_version`

设置虚拟机的盒子版本

<https://www.vagrantup.com/docs/vagrantfile/machine_settings.html#config-vm-box_version>

[repo:^github\.com/laravel/homestead$ config.vm.box_version - Sourcegraph](https://sourcegraph.com/search?q=repo:%5Egithub%5C.com/laravel/homestead%24+config.vm.box_version&patternType=structural)

### `config.vm.define`

设置虚拟机的名称

<https://sourcegraph.com/github.com/hashicorp/vagrant/-/blob/plugins/kernel_v2/config/vm.rb#L393:1-393:7>

[repo:^github\.com/laravel/homestead$ config.vm.define - Sourcegraph](https://sourcegraph.com/search?q=repo:%5Egithub%5C.com/laravel/homestead%24+config.vm.define&patternType=structural)

### `config.vm.hostname`

设置虚拟机的主机名

<https://www.vagrantup.com/docs/vagrantfile/machine_settings.html#config-vm-hostname>

[repo:^github\.com/laravel/homestead$ config.vm.hostname - Sourcegraph](https://sourcegraph.com/search?q=repo:%5Egithub%5C.com/laravel/homestead%24+config.vm.hostname&patternType=structural)

### `config.vm.provision`

设置虚拟机的 Provision

<https://www.vagrantup.com/docs/vagrantfile/machine_settings.html#config-vm-provision>

[repo:^github\.com/laravel/homestead$ config.vm.provision - Sourcegraph](https://sourcegraph.com/search?q=repo:%5Egithub%5C.com/laravel/homestead%24+config.vm.provision&patternType=structural)

- [File Provisioner](https://www.vagrantup.com/docs/provisioning/file.html)
- [Shell Provisioner](https://www.vagrantup.com/docs/provisioning/shell.html)

### `config.vm.synced_folder`

设置虚拟机的共享目录

<https://www.vagrantup.com/docs/synced-folders/>

<https://www.vagrantup.com/docs/vagrantfile/machine_settings.html#config-vm-synced_folder>

[repo:^github\.com/laravel/homestead$ config.vm.synced_folder - Sourcegraph](https://sourcegraph.com/search?q=repo:%5Egithub%5C.com/laravel/homestead%24+config.vm.synced_folder&patternType=structural)
