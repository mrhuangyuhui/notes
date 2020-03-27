# Linux - Firewall

CentOS 7

```bash
# 查看防火墙状态
systemctl status firewalld
# 关闭防火墙
systemctl stop firewalld
# 打开防火墙
systemctl start firewalld
# 关闭防火墙开机启动
systemctl disable firewalld
# 打开防火墙开机启动
systemctl enable firewalld
```