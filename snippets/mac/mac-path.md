# Mac - PATH

```bash
# 注意：要用单引号，而不是双引号，因为双引号会解析全局变量 PATH 的值。
echo 'export PATH=${PATH}:~/zookeeper/current/bin' >> ~/.bash_profile
```

Mongodb

```bash
echo 'export MONGODB_HOME=~/mongodb/current' >> ~/.bash_profile
echo 'export PATH=${PATH}:${MONGODB_HOME}/bin' >> ~/.bash_profile
```

Yarn

```bash
# 注意：要用单引号，而不是双引号，因为双引号会解析全局变量 PATH 的值。
echo 'export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"' >> ~/.bash_profile
```

Node

```bash
# 注意：要用单引号，而不是双引号，因为双引号会解析全局变量 PATH 的值。
echo 'export PATH=${PATH}:~/node/current/bin' >> ~/.bash_profile
```

## Dart

```bash
cat >> ~/.bash_profile << EOF

# Dart
export DART_HOME=\$HOME/dart/current
export PATH=\$PATH:\$DART_HOME/bin

EOF

source ~/.bash_profile
```

## Flutter

```bash
cat >> ~/.bash_profile << EOF

# Flutter
export FLUTTER_HOME=\$HOME/flutter/current
export PATH=\$PATH:\$FLUTTER_HOME/bin

EOF

source ~/.bash_profile
```

## Maven

```bash
cat >> ~/.bash_profile << EOF

# Maven
export MAVEN_HOME=\$HOME/maven/current
export PATH=\$PATH:\$MAVEN_HOME/bin

EOF

source ~/.bash_profile
```
