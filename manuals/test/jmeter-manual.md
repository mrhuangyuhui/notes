<!-- omit in toc -->
# JMeter Manual

- [Install](#install)
  - [Mac](#mac)
- [Downloads](#downloads)
- [Repos](#repos)
- [Guides](#guides)
- [References](#references)
- [Examples](#examples)
- [Tutorials](#tutorials)
- [API](#api)

<https://jmeter.apache.org/>

<https://github.com/topics/jmeter>

## Install

### Mac

```bash
mkdir ~/jmeter && cd ~/jmeter
```

下载并解压安装包 [apache-jmeter-5.3.tgz](https://mirrors.tuna.tsinghua.edu.cn/apache/jmeter/binaries/apache-jmeter-5.3.tgz) 到目录 `~/jmeter`

创建符号链接

```bash
ln -s apache-jmeter-5.3 current
```

配置 `PATH`

```bash
cat >> ~/.bash_profile << EOF
# JMeter
export JMETER_HOME=\$HOME/jmeter/current
export PATH=\${PATH}:\${JMETER_HOME}/bin
EOF

tail -n 3 ~/.bash_profile

source ~/.bash_profile
```

验证安装结果

```bash
jmeter --version
```

启动 GUI

```bash
jmeter
```

## Downloads

<https://jmeter.apache.org/download_jmeter.cgi>

<https://archive.apache.org/dist/jmeter/>

<https://mirrors.tuna.tsinghua.edu.cn/apache/jmeter/>

<https://archive.apache.org/dist/jakarta/jmeter/>

## Repos

<https://github.com/apache/jmeter>

## Guides

[User Manual](https://jmeter.apache.org/usermanual/index.html)

[Best Practices](https://jmeter.apache.org/usermanual/best-practices.html)

## References

[Component Reference](https://jmeter.apache.org/usermanual/component_reference.html)

[Functions Reference](https://jmeter.apache.org/usermanual/functions.html)

[Properties Reference](https://jmeter.apache.org/usermanual/properties_reference.html)

## Examples

<http://jmeter.apache.org/demos/> | [GitHub](https://github.com/apache/jmeter/tree/master/xdocs/demos)

## Tutorials

<https://github.com/aliesbelik/awesome-jmeter>

[JMeter 性能测试实战（第 2 版）| 微信读书](https://weread.qq.com/web/reader/c3d3202071b1ee37c3d55e4)

[第 12 章 JMeter 接口测试应用 - Python 自动化测试实战 | 微信读书](https://weread.qq.com/web/reader/51f32ee07184553651ffe52k98f3284021498f137082c2e)

[Learn JMeter](https://www.tutorialspoint.com/jmeter/index.htm)

## API

<https://jmeter.apache.org/api/index.html>
