# `.nvmrc`

<https://github.com/nvm-sh/nvm#nvmrc>

You can create a `.nvmrc` file containing a node version number (or any other string that `nvm` understands; see `nvm --help` for details) in the project root directory (or any parent directory). Afterwards, `nvm use`, `nvm install`, `nvm exec`, `nvm run`, and `nvm which` will use the version specified in the `.nvmrc` file if no version is supplied on the command line.

```bash
echo "5.9" > .nvmrc

uvm use
```
