# Shell 获取进程 ID

```bash
ps -ef | grep "name" | grep -v grep | awk '{print $2}'
```