#-----------------------------/chapter8/ex8-3.sh------------------
#! /bin/bash

#列出/etc目录中以conf结尾的文件名
str=`ls /etc | grep "conf$"`

echo "$str"
