<!-- omit in toc -->
# HttpRunner Manual

- [Quick Start](#quick-start)
- [Install](#install)
- [Guides](#guides)
- [Examples](#examples)

<https://docs.httprunner.org/>

<https://github.com/HttpRunner/HttpRunner>

## Quick Start

<https://docs.httprunner.org/quickstart/>

安装 HttpRunner

> 提示：为了避免错误，HttpRunner 的版本要与文档中的保持一致！

```bash
pip install httprunner==2.4.1
```

安装 Flask

> 提示：每次修改测试文件后，需要重启 Flask！

```bash
pip install Flask
```

## Install

<https://docs.httprunner.org/Installation/>

```bash
# 最新稳定版
pip install httprunner

# 最新开发版
pip install git+https://github.com/HttpRunner/HttpRunner.git@master
```

验证安装结果

```bash
hrun -V
```

## Guides

- [录制生成用例](https://docs.httprunner.org/prepare/record/)

- [项目文件组织](https://docs.httprunner.org/prepare/project-structure/)

> 文件 `debugtalk.py` 存在时，将作为项目根目录定位标记，其所在目录即被视为项目工程根目录。

推荐的项目文件目录结构示例如下：

```bash
$ tree demo -a
demo
├── .env
├── debugtalk.py
├── reports
├── testcase1.yml
└── testcase2.json
```

## Examples

<https://docs.httprunner.org/examples/testerhome-login/>

<https://docs.httprunner.org/examples/demo-klook/>
