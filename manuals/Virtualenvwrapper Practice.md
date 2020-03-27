# Virtualenvwrapper Practice

http://virtualenvwrapper.readthedocs.io/en/stable/

https://bitbucket.org/virtualenvwrapper/virtualenvwrapper

## [Installation](http://virtualenvwrapper.readthedocs.io/en/stable/install.html)

### Basic Installation
```
$ pip install virtualenvwrapper
```

### Shell Startup File
```
$ echo 'export WORKON_HOME=$HOME/.virtualenvs' >> ~/.bash_profile
$ echo 'export PROJECT_HOME=$HOME/Devel' >> ~/.bash_profile
$ echo 'source /usr/local/bin/virtualenvwrapper.sh' >> ~/.bash_profile
$ source ~/.bash_profile
```
Notice: If `virtualenvwrapper.sh` does not exist in /usr/local/bin/, download it from https://bitbucket.org/virtualenvwrapper/virtualenvwrapper/. 

### Quick-Start
Show help message
```
$ virtualenvwrapper
```

List environments
```
$ workon
```

Create and activate a new environment `temp`
```
$ mkvirtualenv temp
```

## [Command Reference](http://virtualenvwrapper.readthedocs.io/en/stable/command_ref.html)

[mkvirtualenv](http://virtualenvwrapper.readthedocs.io/en/stable/command_ref.html#mkvirtualenv)

[rmvirtualenv](http://virtualenvwrapper.readthedocs.io/en/stable/command_ref.html#rmvirtualenv)

[workon](http://virtualenvwrapper.readthedocs.io/en/stable/command_ref.html#workon)

[deactivate](http://virtualenvwrapper.readthedocs.io/en/stable/command_ref.html#deactivate)

[mkproject](http://virtualenvwrapper.readthedocs.io/en/stable/command_ref.html#mkproject)