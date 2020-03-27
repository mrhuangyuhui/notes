# HAProxy Manual

<http://www.haproxy.org/>

<https://hub.docker.com/_/haproxy>

## [Install](http://www.haproxy.org/#down)

### Docker

安装（配合 Shadowsocks）

```bash
wget https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/haproxy.sh

bash haproxy.sh
```

### YUM

```bash
# 1.5.18
yum install -y haproxy
# 查看安装文件
$ rpm -ql haproxy
/etc/haproxy/haproxy.cfg # 配置文件
# 启动
haproxy -f /etc/haproxy/haproxy.cfg
# 关闭
killall -9 haproxy
```

### [Debian/Ubuntu packages](https://haproxy.debian.net/)

### [RHEL-based Docker images](https://gitlab.com/aleks001/haproxy)

### [Alpine-based Docker images](https://hub.docker.com/_/haproxy/)

## Commands

帮助

```bash
# 快速帮助
haproxy
# 使用手册
man haproxy
```

```bash
# 启动
haproxy -f /etc/haproxy/haproxy.cfg
# 关闭
killall -9 haproxy
# 重载配置文件
sudo /etc/init.d/haproxy reload
```

## [Configurations](http://www.haproxy.org/#docs)

<http://cbonte.github.io/haproxy-dconv/>

## Tutorials

- [循序渐进 Linux（第 2 版）](http://mrhuangyuhui.gitee.io/books/a8xhlJ.html)
  - [第 20 章 负载均衡集群 LVS 与 HAProxy](http://mrhuangyuhui.gitee.io/books/a8xhlJ_files/text/part0029.html)