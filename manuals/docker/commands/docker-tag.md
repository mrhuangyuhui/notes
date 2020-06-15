# `docker tag`

<https://docs.docker.com/engine/reference/commandline/tag/>

```bash
docker tag --help
```

Tag an image referenced by ID

```bash
docker tag 0e5574283393 fedora/httpd:version1.0
```

Tag an image referenced by Name

```bash
docker tag httpd fedora/httpd:version1.0
```

Tag an image referenced by Name and Tag

```bash
docker tag httpd:test fedora/httpd:version1.0.test
```
