<!-- omit in toc -->
# Flask Manual

- [Quick Start](#quick-start)
- [Install](#install)
- [Repos](#repos)
- [API](#api)
- [Tutorials](#tutorials)
- [IDE](#ide)

<https://flask.palletsprojects.com>

## Quick Start

<https://flask.palletsprojects.com/en/1.1.x/quickstart/>

`index.py`

```py
from flask import Flask
app = Flask(__name__)

@app.route('/')
def index():
    return 'Hello, World!'
```

启动服务

```bash
# 默认 127.0.0.1:5000
export FLASK_APP=index.py && \
export FLASK_ENV=development && \
flask run
```

其他启动选项

```bash
# 对外提供服务
flask run --host=0.0.0.0

# 调试模式
export FLASK_DEBUG=1
```

## Install

<https://flask.palletsprojects.com/en/1.1.x/installation/>

<https://pypi.org/project/Flask/>

```bash
pip install Flask
```

## Repos

<https://github.com/pallets/flask/>

<https://gitee.com/mrhuangyuhui/flask>

## API

<https://flask.palletsprojects.com/en/1.1.x/api/>

## Tutorials

[Quickstart](https://flask.palletsprojects.com/en/1.1.x/quickstart/)

官方教程 <https://flask.palletsprojects.com/en/1.1.x/tutorial/>

[Flask Tutorial](https://www.tutorialspoint.com/flask/index.htm)

## IDE

<https://www.jetbrains.com/pycharm/>

<https://www.jetbrains.com/help/pycharm/flask.html>
