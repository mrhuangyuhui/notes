<!-- omit in toc -->
# Requests

- [Repos](#repos)
- [Docs](#docs)
- [API](#api)
- [Tutorials](#tutorials)

<https://requests.readthedocs.io/en/master/>

<https://pypi.org/project/requests/>

查看需要的 Python 版本

`tox.ini`

```ini
envlist = py27,py35,py36,py37,py38
```

列出已有的 Python 版本

> [pyenv-manual.md](/manuals/python/tools/pyenv-manual.md)

```bash
pyenv versions
```

安装缺少的 Python 版本

```bash
pyenv install 3.5.9 -v
pyenv install 3.6.10 -v
pyenv install 3.7.7 -v
```

设置需要的 Python 版本

```bash
pyenv local 3.8.2 3.7.7 3.6.10 3.5.9 2.7.17
```

安装项目依赖

> [pipenv-manual.md](/manuals/python/tools/pipenv/pipenv-manual.md)

```bash
pipenv install -d
# 使用清华镜像
pipenv install -d --pypi-mirror https://pypi.tuna.tsinghua.edu.cn/simple
```

```bash
pipenv shell
```

## Repos

<https://github.com/psf/requests> | [Gitpod](https://gitpod.io/#https://github.com/psf/requests)

<https://github.com/psf/requests/tree/v2.23.0>

```bash
git clone https://github.com/psf/requests.git
```

## Docs

<https://requests.readthedocs.io/en/latest/>

## API

<!-- api -->

## Tutorials

[Python 网络爬虫从入门到实践（第 2 版）| 微信读书](https://weread.qq.com/web/reader/b273296071879840835b067ke3e31601d5bed98199f65b9)
