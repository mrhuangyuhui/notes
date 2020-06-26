# Shell 杀死进程

https://github.com/apache/kafka/blob/trunk/bin/kafka-server-stop.sh
```bash
SIGNAL=${SIGNAL:-TERM}
PIDS=$(ps ax | grep -i 'kafka\.Kafka' | grep java | grep -v grep | awk '{print $1}')

if [ -z "$PIDS" ]; then
  echo "No kafka server to stop"
  exit 1
else
  kill -s $SIGNAL $PIDS
fi
```
