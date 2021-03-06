# Python - Packaging Python Projects

[Python Packaging User Guide](https://packaging.python.org/) | [GitHub](https://github.com/pypa/packaging.python.org)

[Software Packaging and Distribution](https://docs.python.org/3.7/library/distribution.html)

[Packaging and distributing projects](https://packaging.python.org/guides/distributing-packages-using-setuptools/)

[Single-sourcing the package version](https://packaging.python.org/guides/single-sourcing-package-version/)

[Dropping support for older Python versions](https://packaging.python.org/guides/dropping-older-python-versions/)

[Packaging namespace packages](https://packaging.python.org/guides/packaging-namespace-packages/)

[Creating and discovering plugins](https://packaging.python.org/guides/creating-and-discovering-plugins/)

[Making a PyPI-friendly README](https://packaging.python.org/guides/making-a-pypi-friendly-readme/)

[Publishing package distribution releases using GitHub Actions CI/CD workflows](https://packaging.python.org/guides/publishing-package-distribution-releases-using-github-actions-ci-cd-workflows/)

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
pip3 install setuptools wheel
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
pips install twine
```

上传

```bash
twine upload dist/*
```

## Examples

<https://github.com/pypa/sampleproject>

## Tools

<https://packaging.python.org/key_projects/>

[Installing pip/setuptools/wheel with Linux Package Managers](https://packaging.python.org/guides/installing-using-linux-tools/)

> [setuptools.md](/manuals/python/tools/setuptools.md), [wheel.md](/manuals/python/tools/wheel.md), [twine.md](/manuals/python/tools/twine.md)
