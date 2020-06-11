<!-- omit in toc -->
# `setup.py`

- [Commands](#commands)
- [API](#api)
  - [`setup()`](#setup)
    - [`install_requires`](#install_requires)
    - [`extras_require`](#extras_require)
    - [`include_package_data`, `package_data`, `exclude_package_data`](#include_package_data-package_data-exclude_package_data)
    - [`entry_points`](#entry_points)
    - [`cmdclass`](#cmdclass)
- [Examples](#examples)

> [python-packaging.md](/guides/python/packaging/python-packaging.md)

[What is setup.py?](https://stackoverflow.com/questions/1471994/what-is-setup-py)

[Pipfile vs setup.py](https://pipenv.pypa.io/en/latest/advanced/#pipfile-vs-setuppy)

<https://packaging.python.org/guides/distributing-packages-using-setuptools/#setup-args>

## Commands

```bash
python setup.py --help-commands
python setup.py --help sdist
python setup.py sdist --help
```

## API

### `setup()`

[New and Changed `setup()` Keywords](https://setuptools.readthedocs.io/en/latest/setuptools.html#new-and-changed-setup-keywords)

[`setup()` | Sourcegraph](https://sourcegraph.com/github.com/pypa/setuptools/-/blob/setuptools/__init__.py#L158)

#### `install_requires`

[Declaring Dependencies](https://setuptools.readthedocs.io/en/latest/setuptools.html#declaring-dependencies)

#### `extras_require`

[Declaring “Extras” (optional features with their own dependencies)](https://setuptools.readthedocs.io/en/latest/setuptools.html#declaring-dependencies)

#### `include_package_data`, `package_data`, `exclude_package_data`

[Including Data Files](https://setuptools.readthedocs.io/en/latest/setuptools.html#including-data-files)

#### `entry_points`

[Automatic Script Creation](https://setuptools.readthedocs.io/en/latest/setuptools.html#automatic-script-creation)

#### `cmdclass`

A dictionary providing a mapping of command names to `Command` subclasses.

自定义 `setup.py` 命令的实现

<https://github.com/psf/requests/blob/c7e0fc087ceeadb8b4c84a0953a422c474093d6d/setup.py#L102>

<https://jichu4n.com/posts/how-to-add-custom-build-steps-and-commands-to-setuppy/>

## Examples

<https://github.com/navdeep-G/setup.py>

<https://github.com/pypa/sampleproject/blob/master/setup.py>
