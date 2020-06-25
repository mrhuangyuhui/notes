# `git submodule`

<https://git-scm.com/docs/git-submodule>

<https://git-scm.com/book/en/v2/Git-Tools-Submodules>

[Handling Dependencies with Submodules and Subtrees - GitHub Cheatsheets](https://github.github.com/training-kit/downloads/submodule-vs-subtree-cheat-sheet/)

```bash
git submodule -h

man git-submodule
git help submodule
git submodule --help
```

添加子模块

```bash
git submodule add https://github.com/chaconinc/DbConnector
```

```bash
git submodule update --init --remote
```

子模块的配置说明

<https://git-scm.com/docs/gitmodules>

```bash
man gitmodules
```

设置 `ignore`

```bash
git config --file .gitmodules submodule.<name>.ignore dirty
```
