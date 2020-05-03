# Nginx - Docker

<https://hub.docker.com/_/nginx>

```bash
docker pull nginx:1.16.1-alpine
```

## `docker run`

```bash
docker run -v `pwd`:/usr/share/nginx/html:ro -p 8080:80 -d --rm nginx:1.16.1-alpine
```
