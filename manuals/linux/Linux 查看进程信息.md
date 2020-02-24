# Linux 查看进程信息

```bash
$ ps -ef | grep nginx | grep -v grep
root      1334     1  0 11:59 ?        00:00:00 nginx: master process nginx
nginx     1440  1334  0 12:22 ?        00:00:00 nginx: worker process
```