# Sphinx

<http://www.sphinx-doc.org>

<https://github.com/sphinx-doc/sphinx>

<https://pypi.org/project/Sphinx/>

## [Install](http://www.sphinx-doc.org/en/master/usage/installation.html)

```bash
pip install -U sphinx
```

验证安装结果

```bash
sphinx-build --version
```

## Quickstart

以 Flask 源码为例

```bash
git clone https://github.com/pallets/flask.git

cd flask

mkdir mydocs

cd mydocs

# 创建 Sphinx 项目
sphinx-quickstart

# 配置 mydocs/conf.py

# 从源码生成 rst 文件
sphinx-apidoc -o . ../src

# 清理旧的输出文件
make clean

# 生成 HTML 文档
make html

# 打开 mydocs/_build/html/index.html
```

`mydocs/conf.py`

```py
# ...

import os
import sys
sys.path.insert(0, os.path.abspath('../src'))

# ...

extensions = [
    'sphinx.ext.autodoc'
]

# ...
```

## [Docs](http://www.sphinx-doc.org/en/master/contents.html)

[Getting Started](http://www.sphinx-doc.org/en/master/usage/quickstart.html)
