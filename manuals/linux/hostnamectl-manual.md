# HOSTNAMECTL MANUAL

## CentOS 7

```bash
hostnamectl -h
man hostnamectl
```

设置主机名

```bash
$ hostnamectl set-hostname host1
# 验证
$ hostnamectl
   Static hostname: host1
$ hostname
host1
$ cat /etc/hostname
host1
```