# `docker network`

`docker network`

<https://docs.docker.com/engine/reference/commandline/network/>

```bash
docker network --help
```

#### [`docker network connect`](https://docs.docker.com/engine/reference/commandline/network_connect/)

```bash
docker network connect my-net my-nginx
```

#### [`docker network create`](https://docs.docker.com/engine/reference/commandline/network_create/)

```bash
docker network create my-net

docker network create --driver bridge alpine-net
```

#### [`docker network disconnect`](https://docs.docker.com/engine/reference/commandline/network_disconnect/)

```bash
docker network disconnect my-net my-nginx
```

#### [`docker network inspect`](https://docs.docker.com/engine/reference/commandline/network_inspect/)

```bash
docker network inspect bridge
docker network inspect alpine-net
```

#### [`docker network rm`](https://docs.docker.com/engine/reference/commandline/network_rm/)

```bash
docker network rm my-net
```
