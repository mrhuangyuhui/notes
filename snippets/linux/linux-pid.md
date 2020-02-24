# Linux - PID

获取 PID

```bash
$ ps aux | grep 'rsyslogd' | grep -v 'grep'| awk '{print $2}'
977
```