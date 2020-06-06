<!-- omit in toc -->
# Tox Configs

- [tox global settings](#tox-global-settings)
- [tox environments](#tox-environments)
- [tox environment settings](#tox-environment-settings)
- [Substitutions](#substitutions)
- [Generating environments, conditional settings](#generating-environments-conditional-settings)

[tox configuration specification](https://tox.readthedocs.io/en/latest/config.html)

## tox global settings

<https://tox.readthedocs.io/en/latest/config.html#tox-global-settings>

- [`skip_missing_interpreters`](https://tox.readthedocs.io/en/latest/config.html#conf-skip_missing_interpreters)

## tox environments

<https://tox.readthedocs.io/en/latest/config.html#tox-environments>

```ini
[testenv]
commands = ...

[testenv:NAME]
commands = ...
```

## tox environment settings

<https://tox.readthedocs.io/en/latest/config.html#tox-environment-settings>

- `basepython`
- [`deps`](https://tox.readthedocs.io/en/latest/config.html#conf-deps)
- [`ignore_outcome`](https://tox.readthedocs.io/en/latest/config.html#conf-ignore_outcome)
- [`passenv`](https://tox.readthedocs.io/en/latest/config.html#conf-passenv)
- [`skip_install`](https://tox.readthedocs.io/en/latest/config.html#conf-skip_install)

## Substitutions

<https://tox.readthedocs.io/en/latest/config.html#substitutions>

`{posargs}`

[Interactively passing positional arguments](https://tox.readthedocs.io/en/latest/example/general.html#interactively-passing-positional-arguments)

`{envtmpdir}`

## Generating environments, conditional settings

<https://tox.readthedocs.io/en/latest/config.html#generating-environments-conditional-settings>

```ini
envlist = {py27,py36}-django{15,16}

[testenv]
deps =
    pytest
    django15: Django>=1.5,<1.6
    django16: Django>=1.6,<1.7
    py36: unittest2
commands = pytest
```

[Generative envlist](https://tox.readthedocs.io/en/latest/config.html#generative-envlist)

[Factors and factor-conditional settings](https://tox.readthedocs.io/en/latest/config.html#factors-and-factor-conditional-settings)

```ini
[testenv]
deps =
    pytest
    django15: Django>=1.5,<1.6
    django16: Django>=1.6,<1.7
    py36: unittest2
```
