# [Quickstart](https://flask.palletsprojects.com/en/1.1.x/quickstart/)

## A Minimal Application

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

`myproject/hello.py`

```py
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'
```

## Routing

`myproject/hello.py`

```py
from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    return 'Index Page'

@app.route('/hello')
def hello():
    return 'Hello, World'
```

### Variable Rules

`myproject/hello.py`

```py
from flask import Flask
from re import escape

app = Flask(__name__)

@app.route('/user/<username>')
def show_user_profile(username):
    # show the user profile for that user
    return 'User %s' % escape(username)

@app.route('/post/<int:post_id>')
def show_post(post_id):
    # show the post with the given id, the id is an integer
    return 'Post %d' % post_id


@app.route('/path/<path:subpath>')
def show_subpath(subpath):
    # show the subpath after /path/
    return 'Subpath %s' % escape(subpath)

```

### Unique URLs / Redirection Behavior

```py
from flask import Flask
from re import escape

app = Flask(__name__)

@app.route('/projects/')
def projects():
    return 'The project page'

@app.route('/about')
def about():
    return 'The about page'
```

### URL Building

```py
from flask import Flask, escape, url_for

app = Flask(__name__)

@app.route('/')
def index():
    return 'index'

@app.route('/login')
def login():
    return 'login'

@app.route('/user/<username>')
def profile(username):
    return '{}\'s profile'.format(escape(username))

with app.test_request_context():
    print(url_for('index'))
    print(url_for('login'))
    print(url_for('login', next='/'))
    print(url_for('profile', username='John Doe'))
```
