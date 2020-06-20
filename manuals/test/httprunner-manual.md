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

<https://gitpod.io/#https://github.com/mrhuangyuhui/httprunner-quick-start>

```bash
# 安装 Python 依赖
pipenv install

# 激活 Python 虚拟环境
pipenv shell

# 启动用于测试的后端程序
export FLASK_APP=docs/data/api_server.py && \
export FLASK_ENV=development && \
flask run
```

启动另一个终端，按学习步骤执行以下命令。

```bash
# 启动新终端后，注意要激活 Python 虚拟环境
pipenv shell

hrun docs/data/demo-quickstart-0.yml

hrun docs/data/demo-quickstart-1.yml

hrun docs/data/demo-quickstart-2.yml

hrun docs/data/demo-quickstart-3.yml

hrun docs/data/demo-quickstart-4.yml

hrun docs/data/demo-quickstart-5.yml

hrun docs/data/demo-quickstart-6.yml

hrun docs/data/demo-quickstart-7.yml
```

> 提示：每次修改测试文件后，需要重启 Flask！

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

创建项目骨架

```bash
hrun --startproject demo
```

将抓包数据转化为 YAML 格式的测试用例

```bash
har2case docs/data/demo-quickstart.har -2y
```

测试单个测试用例

```bash
hrun filepath/testcase.yml
```

测试整个测试用例集

```bash
hrun testcases_folder_path
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
