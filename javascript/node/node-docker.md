<!-- #node-docker -->
<!-- omit in toc -->
# Node Docker

- [Images](#images)
  - [12](#12)
  - [10](#10)
- [Examples](#examples)
- [Issues](#issues)

<https://hub.docker.com/_/node> | [GitHub](https://github.com/nodejs/docker-node)

[Docker and Node.js Best Practices](https://github.com/nodejs/docker-node/blob/master/docs/BestPractices.md)

## Images

### 12

<https://github.com/nodejs/docker-node/tree/master/12/stretch>

[Dockerfile](https://github.com/nodejs/docker-node/blob/master/12/stretch/Dockerfile)

```bash
docker pull node:12.18.1-stretch

docker run -it node:12.18.1-stretch bash
```

### 10

<https://github.com/nodejs/docker-node/tree/master/10>

## Examples

[Dockerizing a Node.js web app](https://nodejs.org/en/docs/guides/nodejs-docker-webapp/)

[Using Docker Compose for NodeJS Development - via @codeship](https://rollout.io/blog/using-docker-compose-for-nodejs-development/)

[Using Docker for Node.js in Development and Production - DEV](https://dev.to/alex_barashkov/using-docker-for-nodejs-in-development-and-production-3cgp)

<https://github.com/mrcoles/node-react-docker-compose>

## Issues

[node.js - Docker-compose: node_modules not present in a volume after npm install succeeds - Stack Overflow](https://stackoverflow.com/questions/30043872/docker-compose-node-modules-not-present-in-a-volume-after-npm-install-succeeds)
