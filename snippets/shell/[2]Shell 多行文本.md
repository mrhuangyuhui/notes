# Shell 多行文本

```bash
cat > /usr/local/zookeeper/conf/zoo.cfg << EOF
tickTime=2000
dataDir=/var/lib/zookeeper
clientPort=2181
EOF
```