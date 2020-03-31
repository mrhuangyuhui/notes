[TOC]

# 第12章　Keepalived高可用集群应用实践

## 12.1　Keepalived高可用软件

### 12.1.1　Keepalived介绍

n/a

### 12.1.2　Keepalived服务的三个重要功能

n/a

### 12.1.3　Keepalived高可用故障切换转移原理

n/a

## 12.2　Keepalived高可用服务搭建准备

安装软件
```bash
yum install keepalived -y
```

启动服务
```bash
systemctl start keepalived
```

检查：启动后会有三个进程
```
$ ps -ef | grep keepalived | grep -v grep
root      1239     1  0 02:46 ?        00:00:00 /usr/sbin/keepalived -D
root      1240  1239  0 02:46 ?        00:00:00 /usr/sbin/keepalived -D
root      1241  1239  0 02:46 ?        00:00:00 /usr/sbin/keepalived -D
```

检查：启动后会有三个虚拟 IP 地址
```
$ ip add|grep 192.168
    inet 192.168.200.16/32 scope global eth0
    inet 192.168.200.17/32 scope global eth0
    inet 192.168.200.18/32 scope global eth0
```

## 12.3　Keepalived高可用服务单实例实战

在 DigitalOcean 云主机上练习高可用参考以下文章：

https://www.digitalocean.com/community/tutorials/how-to-set-up-highly-available-web-servers-with-keepalived-and-floating-ips-on-ubuntu-14-04

以下是关键步骤：

- 安装 nginx

主机 lb01/lb02
```bash
yum install -y epel-release && yum install -y nginx && nginx -v && nginx && ps -ax | grep nginx
```

- 安装 keepalived

主机 lb01/lb02
```bash
yum install -y keepalived
```

- 查询私有 IP 地址

主机 lb01/lb02
```bash
ip a
```

- 生成 DigitalOcean 的 API Token

在网站上操作

- 创建 Floating IP

在网站上操作

- 下载迁移 Floating IP 的可执行脚本

主机 lb01/lb02
```bash
cd /usr/local/bin
sudo curl -LO http://do.co/assign-ip
```

- 创建 keepalived 主备节点角色交换时的执行脚本

主机 lb01/lb02 `/etc/keepalived/master.conf`
```bash
export DO_TOKEN='6a2672c98fdbf704fddfc490ee5d05bc7c6d95d387934ae12a08316a215f2c4f'
IP='159.89.210.109'
ID=$(curl -s http://169.254.169.254/metadata/v1/id)
HAS_FLOATING_IP=$(curl -s http://169.254.169.254/metadata/v1/floating_ip/ipv4/active)

if [ $HAS_FLOATING_IP = "false" ]; then
    n=0
    while [ $n -lt 10 ]
    do
        python /usr/local/bin/assign-ip $IP $ID && break
        n=$((n+1))
        sleep 3
    done
fi
```

- 创建 keepalived 配置文件

主机 lb01 `/etc/keepalived/keepalived.conf`
```
vrrp_script chk_nginx {
    script "pidof nginx"
    interval 2
}

vrrp_instance VI_1 {
    state MASTER
    interface eth1
    virtual_router_id 51
    priority 100
    authentication {
        auth_type PASS
        auth_pass 1111
    }
    unicast_src_ip 10.130.5.137
    unicast_peer {
        10.130.23.24
    }

    track_script {
        chk_nginx
    }
    notify_master /etc/keepalived/master.sh
}
```

主机 lb02 `/etc/keepalived/keepalived.conf`
```
vrrp_script chk_nginx {
    script "pidof nginx"
    interval 2
}

vrrp_instance VI_1 {
    state BACKUP
    interface eth1
    virtual_router_id 51
    priority 50
    authentication {
        auth_type PASS
        auth_pass 1111
    }
    unicast_src_ip 10.130.23.24
    unicast_peer {
        10.130.5.137
    }
    track_script {
        chk_nginx
    } 
    notify_master /etc/keepalived/master.sh
}
```

## 12.4　Keepalived高可用服务器的“裂脑”问题

n/a

## 12.5　Keepalived双实例双主模式配置

参考 12.3 节

## 12.6　Nginx负载均衡配合Keepalived服务案例实战

参考 12.3 节

## 12.7　解决服务监听的网卡上不存在IP地址问题

n/a

## 12.8　解决高可用服务只针对物理服务器的问题

n/a

## 12.9　解决多组Keepalived服务器在一个局域网的冲突问题

n/a

## 12.10　配置指定文件接收Keepalived服务日志

跳过

## 12.11　开发监测Keepalived裂脑的脚本

n/a