#-----------------------------/chapter8/ex8-5.sh------------------
#! /bin/bash

#筛选出以字符s开头，紧跟着1个字符s，任意个字符s的文件名
str=`ls /etc | grep "^sss*"`

echo "$str"
