#-----------------------------/chapter8/ex8-8.sh------------------
#! /bin/bash

#筛选以字符串“ss”开头，后面跟着0或者1个s的文本行
str=`ls /etc | egrep "^sss?"`

echo "$str"
