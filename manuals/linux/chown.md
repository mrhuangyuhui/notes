# CHOWN

```bash
chown --help
```

修改文件的所有者

```bash
chown bin initial-setup-ks.cfg
```

同时修改文件的所有者和所属的群组

```bash
chown root:root initial-setup-ks.cfg

# 递归
chown -R nginx.nginx xadmin/
```