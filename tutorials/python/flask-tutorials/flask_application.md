# [Flask – Application](https://www.tutorialspoint.com/flask/flask_application.htm)

`myapp/Hello.py`

```py
from flask import Flask

app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello World'


if __name__ == '__main__':
    app.run(debug=True)

```

启动服务

```bash
python Hello.py
```

发起请求

```bash
$ curl http://localhost:5000/
Hello World
```
