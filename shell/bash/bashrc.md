# `.bashrc`

<https://github.com/mrhuangyuhui/bashrc>

## `.bash_profile`

```bash
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
```

```bash
echo 'if [ -f ~/.bashrc ]; then . ~/.bashrc; fi' >> ~/.bash_profile
```

## `.bashrc.d`

[gitpod-io/workspace-images/blob/master/full/Dockerfile](https://github.com/gitpod-io/workspace-images/blob/c024b68b7f8c5c69b143c7e5429c18e7027915b4/full/Dockerfile#L48)

```bash
mkdir $HOME/.bashrc.d && \
(echo; echo "for i in \$(ls \$HOME/.bashrc.d/*); do source \$i; done"; echo) >> $HOME/.bashrc
```

## Misc

<https://blog.csdn.net/sch0120/article/details/70256318>

[6.2 Bash Startup Files - Bash Reference Manual](https://www.gnu.org/software/bash/manual/bash.html#Bash-Startup-Files)

<https://www.apt-browse.org/browse/ubuntu/trusty/main/all/bash-doc/4.3-6ubuntu1/file/usr/share/doc/bash/examples/startup-files>
