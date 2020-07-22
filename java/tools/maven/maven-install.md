<!-- omit in toc -->
# Maven - Install

- [SDKMAN](#sdkman)
- [Mac](#mac)
- [Ubuntu](#ubuntu)
- [CentOS](#centos)

<https://maven.apache.org/install.html>

## SDKMAN

```bash
sdk list maven
sdk install maven 3.5.0
```

## Mac

下载并解压安装包到目录 `~/maven`

创建符号链接

```bash
cd ~/maven

ln -s apache-maven-3.6.3 current
```

配置环境变量

```bash
cat >> ~/.bash_profile << EOF

# Maven
export MAVEN_HOME=\$HOME/maven/current
export PATH=\$PATH:\$MAVEN_HOME/bin

EOF

source ~/.bash_profile
```

验证安装结果

```bash
tail -n 5 ~/.bash_profile
mvn -version
```

## Ubuntu

```bash
sudo apt update
apt show maven
sudo apt install maven -y
```

## CentOS

```bash
yum info maven
sudo yum install maven -y
```
