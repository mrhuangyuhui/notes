# Ubuntu Manual

查看版本信息

```bash
$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 16.04.6 LTS
Release:        16.04
Codename:       xenial

$ cat /etc/issue
Ubuntu 16.04.6 LTS \n \l
```

查看 IP 地址

```bash
ifconfig
```

安装软件

```bash
dpkg -i vagrant_2.2.4_x86_64.deb
```

开启远程 SSH 登录

```bash
# 更新软件源
sudo apt-get update
# 安装 SSH 服务端
sudo apt-get install openssh-server
# 查看 SSH 服务是否启动
sudo ps -e | grep ssh
# 启动 SSH 服务
sudo service ssh start
```
