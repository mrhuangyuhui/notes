# JPS 进程信息残留

```bash
# 查看进程信息
$ jps -l | grep "CollectCardService"
13066 CollectCardService.jar

# 杀死进程
$ kill -9 13066

# 检查发现进程信息残留
$ jps -l | grep "CollectCardService"
13066 CollectCardService.jar

# 删除进程信息文件
$ rm -f /tmp/hsperfdata_www/13066

# 重新检查，删除成功。
$ jps -l | grep "CollectCardService"
```