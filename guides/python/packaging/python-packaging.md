# Python - Packaging

[Python Packaging User Guide](https://packaging.python.org/) | [GitHub](https://github.com/pypa/packaging.python.org)

[Installing Packages](https://packaging.python.org/tutorials/installing-packages/)

[Software Packaging and Distribution](https://docs.python.org/3.7/library/distribution.html)

[Packaging and distributing projects](https://packaging.python.org/guides/distributing-packages-using-setuptools/)

<https://packaging.python.org/glossary/>

## Quick Start

[Packaging Python Projects](https://packaging.python.org/tutorials/packaging-projects/)

> `setup.py` is the build script for [setuptools](https://packaging.python.org/key_projects/#setuptools).

目录结构

```bash
packaging_tutorial
├── LICENSE
├── README.md
├── example_pkg
│   └── __init__.py
├── setup.py
└── tests
```

安装打包工具

```bash
python3 -m pip install --user --upgrade setuptools wheel
```

打包

```bash
python3 setup.py sdist bdist_wheel

# 打包结果
dist/
  example_pkg_YOUR_USERNAME_HERE-0.0.1-py3-none-any.whl
  example_pkg_YOUR_USERNAME_HERE-0.0.1.tar.gz
```

安装上传工具

```bash
python3 -m pip install --user --upgrade twine
```

上传

```bash
python3 -m twine upload dist/*
# 或
twine upload dist/*
```

## Examples

<https://github.com/pypa/sampleproject>

## Tools

<https://packaging.python.org/key_projects/>

[setuptools.md](/manuals/python/tools/setuptools.md)

[wheel.md](/manuals/python/tools/wheel.md)

[twine.md](/manuals/python/tools/twine.md)
