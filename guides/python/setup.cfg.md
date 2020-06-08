# `setup.cfg`

<https://packaging.python.org/guides/distributing-packages-using-setuptools/#setup-cfg>

> `setup.cfg` is an ini file that contains option defaults for `setup.py` commands.

## `metadata`

[Including license files in the generated wheel file](https://wheel.readthedocs.io/en/stable/user_guide.html#including-license-files-in-the-generated-wheel-file)

## Examples

[`setup.cfg`](https://github.com/psf/requests/blob/master/setup.cfg)

```bash
[bdist_wheel]
universal = 1
```

```bash
$ python setup.py bdist_wheel --help
...
  --universal       make a universal wheel (default: false)
```
