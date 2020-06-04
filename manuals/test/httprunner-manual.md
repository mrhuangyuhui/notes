<!-- omit in toc -->
# HttpRunner Manual

- [Quick Start](#quick-start)
- [Install](#install)
- [Repos](#repos)
- [Commands](#commands)
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

## Repos

<https://github.com/httprunner>

<https://github.com/httprunner/httprunner>

<https://github.com/httprunner/har2case>

<https://github.com/httprunner/docs>

<https://github.com/httprunner/demo-mubu>

## Commands

<https://docs.httprunner.org/run-tests/cli/>

```bash
hrun -h
hrun --help
```

```bash
hrun -V
hrun --version
```

测试单个测试用例

```bash
hrun filepath/testcase.yml
```

测试整个测试用例集

```bash
hrun testcases_folder_path
```

创建项目骨架

```bash
hrun --startproject demo
```

## Guides

[录制生成用例](https://docs.httprunner.org/prepare/record/)

[项目文件组织](https://docs.httprunner.org/prepare/project-structure/)

> 文件 `debugtalk.py` 存在时，将作为项目根目录定位标记，其所在目录即被视为项目工程根目录。

[测试用例组织](https://docs.httprunner.org/prepare/testcase-structure/)

[hook 机制](https://docs.httprunner.org/prepare/request-hook/)

[环境变量](https://docs.httprunner.org/prepare/dot-env/)

[测试用例分层](https://docs.httprunner.org/prepare/testcase-layer/)

[参数化数据驱动](https://docs.httprunner.org/prepare/parameters/)

[文件上传场景](https://docs.httprunner.org/prepare/upload-case/)

[测试报告](https://docs.httprunner.org/run-tests/report/)

[性能测试](https://docs.httprunner.org/run-tests/load-test/)

## Examples

<https://docs.httprunner.org/examples/testerhome-login/>

<https://docs.httprunner.org/examples/demo-klook/>

<https://github.com/httprunner/demo-mubu>

<https://github.com/httprunner/httprunner/tree/master/examples>
