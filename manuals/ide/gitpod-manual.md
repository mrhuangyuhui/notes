<!-- omit in toc -->
# Gitpod Manual

- [Quick Start](#quick-start)
- [Repos](#repos)
- [Commands](#commands)
- [Configs](#configs)
  - [`.gitpod.yml`](#gitpodyml)
  - [Docker Configuration](#docker-configuration)
- [Docs](#docs)
- [Guides](#guides)
- [Languages & Frameworks](#languages--frameworks)
  - [Ruby](#ruby)

<https://www.gitpod.io/>

<https://theia-ide.org/>

## Quick Start

<https://www.gitpod.io/features/>

## Repos

<https://github.com/gitpod-io/gitpod>

## Commands

<https://www.gitpod.io/docs/command-line-interface/>

创建配置文件

```bash
gp init
```

## Configs

[Configure Your Project](https://www.gitpod.io/docs/configuration/)

### `.gitpod.yml`

<https://www.gitpod.io/docs/config-gitpod-file/>

<https://github.com/gitpod-io/definitely-gp>

创建配置文件

```bash
gp init
```

[Start Tasks](https://www.gitpod.io/docs/config-start-tasks/)

### Docker Configuration

<https://www.gitpod.io/docs/config-docker/>

```yml
image: node:alpine
```

```yml
image:
  file: .gitpod.Dockerfile
```

> Note: Currently, Gitpod only supports Debian/Ubuntu or Alpine based images.

<https://hub.docker.com/u/gitpod> | [GitHub](https://github.com/gitpod-io/workspace-images)

<https://hub.docker.com/r/gitpod/workspace-full> | [GitHub](https://github.com/gitpod-io/workspace-images/tree/master/full)

## Docs

<https://www.gitpod.io/docs/>

## Guides

[Life of a Workspace](https://www.gitpod.io/docs/life-of-workspace/)

> Gitpod backs up the state of the `/workspace/` folder between workspace starts, so that you can revisit them later. Attention: Files in other locations will not be saved!

## Languages & Frameworks

### Ruby

<https://www.gitpod.io/docs/languages/ruby/>
