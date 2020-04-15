<!-- #vagrantfile -->
<!-- omit in toc -->
# Vagrantfile

- [`Vagrant.require_version`](#vagrantrequireversion)
- [`Vagrant.configure`](#vagrantconfigure)
- [`config.vm`](#configvm)
  - [`config.vm.provision`](#configvmprovision)

<https://www.vagrantup.com/docs/vagrantfile/>

## `Vagrant.require_version`

[Minimum Vagrant Version](https://www.vagrantup.com/docs/vagrantfile/vagrant_version.html)

限定 Vagrant 的程序版本

```ruby
Vagrant.require_version ">= 1.3.5"
```

## `Vagrant.configure`

[Configuration Version](https://www.vagrantup.com/docs/vagrantfile/version.html)

限定 `Vagrantfile` 的 API 版本

一个代码块内只能使用对应版本的 API

```ruby
Vagrant.configure("2") do |config|
  # v2 configs...ok!!!
  # v1 configs...error!!!
end
```

一个配置文件内同时使用不同版本的 API，必须分开写。

```ruby
Vagrant.configure("1") do |config|
  # v1 configs...
end

Vagrant.configure("2") do |config|
  # v2 configs...
end
```

## `config.vm`

[Machine Settings](https://www.vagrantup.com/docs/vagrantfile/machine_settings.html)

### `config.vm.provision`

[`config.vm.provision`](https://www.vagrantup.com/docs/vagrantfile/machine_settings.html#config-vm-provision)

[File Provisioner](https://www.vagrantup.com/docs/provisioning/file.html)

从本地上传文件或目录到虚拟机

```ruby
Vagrant.configure("2") do |config|
  config.vm.provision "file", source: "~/.gitconfig", destination: ".gitconfig"
end
```

```ruby
Vagrant.configure("2") do |config|
  config.vm.provision "file", source: "~/path/to/host/folder", destination: "$HOME/remote/newfolder"
end
```
