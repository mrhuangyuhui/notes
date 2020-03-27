# Ubuntu - SSH

启动远程登录服务

```bash
# 查看是否安装了 SSH 相关软件
dpkg -l | grep ssh

# 安装 openssh-server
sudo apt-get install openssh-server

# 确认 SSH 服务是否启动
ps -e | grep ssh

# SSH 服务的几种操作
sudo service sshd status
sudo service sshd start
sudo service sshd restart
sudo service sshd stop

# 远程登录
ssh root@192.168.31.23
```
