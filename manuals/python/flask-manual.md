# Flask Manual

- [Flask Manual](#flask-manual)
  - [Install](#install)
  - [Repos](#repos)
  - [Docs](#docs)
    - [API](#api)
  - [Tutorials](#tutorials)
  - [IDEs](#ides)

<https://flask.palletsprojects.com>

## Install

> 注意：Python 2 要先安装虚拟环境工具 [virtualenv](https://virtualenv.pypa.io/)，Python 3 自带该工具。
>
> [Install virtualenv](https://flask.palletsprojects.com/en/1.1.x/installation/#install-virtualenv)

<https://flask.palletsprojects.com/en/1.1.x/installation/>

```bash
mkdir myproject

cd myproject

# 创建虚拟环境
python3 -m venv venv

# 激活虚拟环境
. venv/bin/activate

# 安装 Flask
pip install Flask

# 启动服务
export FLASK_APP=hello.py && \
export FLASK_ENV=development && \
flask run

# 对外提供服务
flask run --host=0.0.0.0

# 开发环境
export FLASK_ENV=development

# 调试模式
export FLASK_DEBUG=1
```

[Quickstart](https://flask.palletsprojects.com/en/1.1.x/quickstart/)

`myproject/hello.py`

```py
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'
```

## Repos

<https://github.com/pallets/flask/>

<https://gitee.com/mrhuangyuhui/flask>

## Docs

### API

<https://flask.palletsprojects.com/en/1.1.x/api/>

## Tutorials

[Quickstart](https://flask.palletsprojects.com/en/1.1.x/quickstart/)

官方教程 <https://flask.palletsprojects.com/en/1.1.x/tutorial/>

[Flask Tutorial](https://www.tutorialspoint.com/flask/index.htm)

## IDEs

<https://www.jetbrains.com/pycharm/>

<https://www.jetbrains.com/help/pycharm/flask.html>
