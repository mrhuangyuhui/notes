# Jetty Manual

<https://www.eclipse.org/jetty/>

<https://www.eclipse.org/jetty/documentation/>

<https://github.com/eclipse/jetty.project>

## Installation

下载

<https://www.eclipse.org/jetty/download.html>

设置路径

```bash
# 主目录 Mac
echo 'export JETTY_HOME=~/jetty/current' >> ~/.bash_profile
cd $JETTY_HOME
# 符号变量
ln -s jetty-distribution-9.4.11.v20180605 current
```

启动

<https://www.eclipse.org/jetty/documentation/9.4.11.v20180605/quickstart-running-jetty.html>

```bash
cd $JETTY_HOME/demo-base/
java -jar ../start.jar
```

## Commands

```bash
java -jar $JETTY_HOME/start.jar --help
```

查看配置

```bash
cd $JETTY_HOME/demo-base/
# 列出所有可用的模块
java -jar $JETTY_HOME/start.jar --list-modules
# 显示运行环境和配置信息
java -jar $JETTY_HOME/start.jar --list-config
```

创建一个新的基目录

```bash
JETTY_BASE=/tmp/mybase
mkdir $JETTY_BASE
cd $JETTY_BASE
# 为当前基目录添加标准文件及文件夹
java -jar $JETTY_HOME/start.jar --add-to-startd=http,deploy
# 拷贝一个应用到新的基目录进行测试
cp $JETTY_HOME/demo-base/webapps/async-rest.war webapps/ROOT.war
# 启动
java -jar $JETTY_HOME/start.jar
```

设置端口号

```bash
cd $JETTY_BASE
java -jar $JETTY_HOME/start.jar jetty.http.port=8081
```

## References

<https://www.eclipse.org/jetty/javadoc/>

## Tutorials

<https://www.cnblogs.com/yiwangzhibujian/category/876335.html>

## Examples

<https://github.com/eclipse/jetty.project/tree/master/examples>

## Tools

<https://www.eclipse.org/jetty/documentation/current/jetty-maven-plugin.html>