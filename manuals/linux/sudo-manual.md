# SUDO Manual

```bash
sudo -h
```

```bash
man sudo
```

```bash
# To get a file listing of an unreadable directory
$ sudo ls /usr/local/protected

# To list the home directory of user yaz on a machine where the file system holding ~yaz is not exported as root
$ sudo -u yaz ls ~yaz

# To edit the index.html file as user www
$ sudoedit -u www ~www/htdocs/index.html
```