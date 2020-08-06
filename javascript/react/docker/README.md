<!-- omit in toc -->
# React Docker

- [Repos](#repos)
- [Articles](#articles)
- [Issues](#issues)

## Repos

<https://github.com/dashsaurabh/docker-react-application>

<https://github.com/StephenGrider/docker-react>

<https://github.com/mrcoles/node-react-docker-compose>

<https://github.com/switch120/sample-react-docker>

## Articles

[Docker Local Development Workflow for React Application](http://progressivecoder.com/docker-local-development-workflow-for-react-application/)

[Docker Multi Stage Build for running React Application on Nginx Server](http://progressivecoder.com/docker-multi-stage-build-for-running-react-application-on-nginx-server/)

[How to Docker with create-react-app - RWieruch](https://www.robinwieruch.de/docker-create-react-app-development)

[How to Docker Compose - RWieruch](https://www.robinwieruch.de/docker-compose)

[Dockerizing a React App](https://mherman.org/blog/dockerizing-a-react-app/)

[React + Docker with Security in 10 Minutes ― Scotch.io](https://scotch.io/tutorials/react-docker-with-security-in-10-minutes)

> [react docker site:github.com - Google 搜索](https://www.google.com.hk/search?as_q=react+docker&as_epq=&as_oq=&as_eq=&as_nlo=&as_nhi=&lr=&cr=&as_qdr=all&as_sitesearch=github.com&as_occt=any&safe=active&as_filetype=&tbs=)

## Issues

`react-scripts@3.4.1` 在 `docker-compose.yml` 下报错 `"exited with code 0"` 的解决办法：

<https://github.com/facebook/create-react-app/issues/8688>

在 `docker-compose.yml` 中添加以下配置

```yml
tty: true
# 或
stdin_open: true
# 或
environment:
  - CI=true
```

3.4.0 没有问题，可以在 `package.json` 中修改 `react-scripts` 的版本

```json
"react-scripts": "3.4.0"
```

> [react docker compose "exited with code 0" - Google 搜索](https://www.google.com.hk/search?as_q=react+docker+compose&as_epq=exited+with+code+0&as_oq=&as_eq=&as_nlo=&as_nhi=&lr=&cr=&as_qdr=all&as_sitesearch=&as_occt=any&safe=active&as_filetype=&tbs=)
