<!-- omit in toc -->
# RVM - Install

- [CentOS](#centos)
- [Mac](#mac)

<http://rvm.io/rvm/install>

## CentOS

```bash
## CentOS 7.3

gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

# Install RVM stable with ruby:
curl -sSL https://get.rvm.io | bash -s stable --ruby

source /usr/local/rvm/scripts/rvm
```

验证安装结果

```bash
rvm
rvm list known

ruby -v
which ruby
```

## Mac

```bash
curl -sSL https://get.rvm.io | bash
```

验证安装结果

```bash
rvm
rvm list known

ruby -v
which ruby
```
