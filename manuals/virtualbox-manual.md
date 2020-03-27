# VirtualBox Manual

<https://www.virtualbox.org/>

## Install

<https://www.virtualbox.org/wiki/Linux_Downloads>

### CentOS

```bash
# 添加软件源
sudo wget https://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo -P /etc/yum.repos.d/

# 安装软件
sudo yum install VirtualBox-6.1 -y
```

### Ubuntu

```bash
# 查看 Codename
$ lsb_release -a
Codename:       xenial

# 添加软件源
sudo echo "deb https://download.virtualbox.org/virtualbox/debian xenial contrib" >> /etc/apt/sources.list

# 安装签名文件
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -

# 安装软件
sudo apt-get update
sudo apt-get install virtualbox-6.1 -y
```

18.04

```bash
# 查看 Codename
$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 18.04.3 LTS
Release:        18.04
Codename:       bionic

# 添加软件源
sudo echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian bionic contrib" >> /etc/apt/sources.list

# 安装签名文件
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -

# 安装软件
sudo apt-get update
sudo apt-get install virtualbox-6.1
```
