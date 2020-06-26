#-----------------------------/chapter9/ex9-14.sh------------------
#! /bin/bash

#不合并不足指定行宽的行
str=`fmt -s -c -w 80 demo2.txt`
echo "$str"
