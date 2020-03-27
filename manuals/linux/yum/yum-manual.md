# YUM Manual

## Commands

Show help message
```
$ yum -h|--help
```

Display details about a package or group of packages
```
$ yum info zlib-devel
```

List a package's dependencies
```
$ yum deplist zlib-devel
```

List the available groups
```
$ yum group list
```

Give the description and package list of a group
```
yum groupinfo 'Development Tools'
```

安装软件包套件

```bash
yum groupinstall -y 'Development Tools'
```

安装epel源
yum install epel-release -y
官方指南：https://fedoraproject.org/wiki/EPEL/zh-cn

安装yum工具包
yum install yum-utils -y

查看软件信息
yum info httpd

搜索软件
yum search httpd

列出服务器上全部软件
yum list

列出可升级的软件
yum list updates

列出匹配模式的软件
yum list httpd*

查看二进制程序对应的软件包
yum provides httpd
yum whatprovides httpd

安装软件
yum install httpd

安装指定仓库的软件
yum --enablerepo=epel install httpd

升级指定软件
yum update httpd

升级全部软件
yum update

移除软件
yum remove httpd

列出全部软件仓库
yum repolist all

清除已下载的软件包
yum clean all

移除软件组
yum groupremove "Scientific Support"