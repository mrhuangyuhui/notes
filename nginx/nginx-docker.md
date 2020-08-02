# Nginx - Docker

<https://hub.docker.com/_/nginx>

```bash
docker pull nginx:1.16.1-alpine
```

## `docker run`

```bash
docker run -d --rm -v $PWD:/usr/share/nginx/html:ro -p 8080:80 nginx:1.16.1-alpine
```
