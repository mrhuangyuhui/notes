#-----------------------------/chapter3/ex3-9.sh------------------
#! /bin/bash

#输出脚本的参数个数
echo "the number of parameters is $#"
#输出上一个命令的退出状态码
echo "the return code of last command is $?"
#输出当前脚本名称
echo "the script name is $0"
#输出所有的参数
echo "the parameters are $*"
#输出其中的几个参数
echo "\$1=$1;\$2=$2;\$11=$11"
