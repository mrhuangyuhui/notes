# Linux - PATH

CentOS 7

```bash
echo 'export REDIS_HOME=/usr/local/redis/current' >> /etc/profile.d/redis.sh
echo "export PATH=\${PATH}:\${REDIS_HOME}/bin" >> /etc/profile.d/redis.sh
```