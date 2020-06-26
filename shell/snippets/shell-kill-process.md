# Shell 杀死进程

```bash
kill -9 `ps -ef | grep "name" | grep -v grep | awk '{print $2}'`
# 或
ps -ef | grep member.war | grep -v grep | awk '{print "kill -9 "$2}' | sh
```