#-----------------------------/chapter8/ex8-18.sh------------------
#! /bin/bash

#筛选以4个数字结尾的文本行
str=`egrep "[[:digit:]]{4}$" demo5.txt`

echo "$str"
