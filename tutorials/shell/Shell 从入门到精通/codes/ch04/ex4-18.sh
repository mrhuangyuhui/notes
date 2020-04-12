#-----------------------------/chapter4/ex4-18.sh------------------
#! /bin/sh
#使用条件测试判断/bin/bash是否是一个常规文件
if [ -f /bin/bash ]
   then echo "/bin/bash is a file"
fi
