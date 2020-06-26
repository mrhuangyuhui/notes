<!-- #shell-io -->
# Shell - EOF

将多行文本写入文件

```bash
# >> 是追加到文件末尾
cat >> /usr/local/zookeeper/conf/zoo.cfg << EOF
tickTime=2000
dataDir=/var/lib/zookeeper
clientPort=2181
EOF
```
