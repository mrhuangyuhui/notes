# MySQL Docker

<https://hub.docker.com/_/mysql>

<https://github.com/docker-library/mysql>

```bash
docker pull mysql:5.7.31
```

```bash
docker network create mysql-network

docker run --name mysql-server --network mysql-network -d --rm -e MYSQL_ROOT_PASSWORD=123456 mysql:5.7.31

docker run --name mysql-client --network mysql-network -it --rm mysql:5.7.31 mysql -hmysql-server -uroot -p
```
