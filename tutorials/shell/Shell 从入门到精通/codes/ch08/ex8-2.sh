#-----------------------------/chapter8/ex8-2.sh------------------
#! /bin/bash

#列出/etc目录中的以字母po开头的文件
str=`ls /etc | grep "^po"`
echo "$str"
