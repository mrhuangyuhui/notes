#-----------------------------/chapter8/ex8-7.sh------------------
#! /bin/bash

#筛选以字符串“ss”开头，后面至少紧跟着1个字符“s”的文本行
str=`ls /etc | egrep "^sss+"`

echo "$str"
