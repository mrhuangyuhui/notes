# Ansible - SSH

在 Ansible 主机（控制）上配置客户机（被控制）

```bash
[root@ansible ~]$ hostname
ansible
# 创建公钥和私钥
[root@ansible ~]$ ssh-keygen
# 验证创建结果
[root@ansible ~]$ ls .ssh
id_rsa  id_rsa.pub
# 复制公钥到客户机 Host1
[root@ansible ~]$ ssh-copy-id root@192.168.31.119

# 登录客户机 Host1
[root@ansible ~]$ ssh 'root@192.168.31.119'
# 登录成功
[root@host1 ~]$ hostname
host1
```