# `docker build`

<https://docs.docker.com/engine/reference/commandline/build/>

Build an image from a Dockerfile

```bash
docker build --help
docker help build
```

```bash
Usage:  docker build [OPTIONS] PATH | URL | -

Options:
  -t, --tag list                Name and optionally a tag in the 'name:tag' format
```

[`.dockerignore` file](https://docs.docker.com/engine/reference/builder/#dockerignore-file)

[Use a `.dockerignore` file](https://docs.docker.com/engine/reference/commandline/build/#use-a-dockerignore-file)

Tag an image (`-t`)

```bash
docker build -t whenry/fedora-jboss:latest -t whenry/fedora-jboss:v2.1 .
```
