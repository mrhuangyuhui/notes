# `setup.cfg`

<https://packaging.python.org/guides/distributing-packages-using-setuptools/#setup-cfg>

> `setup.cfg` is an ini file that contains option defaults for `setup.py` commands.

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
