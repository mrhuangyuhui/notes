# `ip`

<http://kernel.org/pub/linux/utils/net/iproute2/>

<https://man.linuxde.net/ip>

## Installation

```bash
yum install iproute
```

```bash
$ yum info ip
Name        : iproute
Summary     : Advanced IP routing and network device configuration tools
URL         : http://kernel.org/pub/linux/utils/net/iproute2/
Description : The iproute package contains networking utilities (ip and rtmon, for example)
            : which are designed to use the advanced networking capabilities of the Linux
            : 2.4.x and 2.6.x kernel.
```

## Commands

```bash
ip help
man ip
# 查看子命令帮助信息
ip address help
```

命令行选项 | 简要说明
---|---
-4 | IPv4
-6 | IPv6
-d | 输出详细信息
-s | 输出统计数据，s 重复两次或更多（如 ip -s -s link），数据相应增加。

### `ip address`

```bash
ip a help
# 其他写法
ip addr help
ip address help

man ip-address
```

列出所有网络接口的 IP 地址

```bash
ip a
# 其他写法
ip a show
ip a list

# 只列出 IPv4 地址
ip -4 a
```

查看指定网络接口的 IP 地址

```bash
ip address show dev eth0
```

获取 IP 地址

```bash
ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1 -d '/'
# 或
ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | awk -F"/" '{print $1}'
```

### `ip link`

```bash
ip link help
# 其他写法
ip l help

man ip-link
```

列出所有网络设备

```bash
ip link

# 其他写法
ip link show
ip link list
ip l

# 输出统计数据
ip -s link

# 输出更多统计数据
$ ip -s -s link
```

查看指定网络设备

```bash
ip link show eth0
```

### `ip route list`

```bash
ip route help
```

显示路由表

```bash
ip route list
```
