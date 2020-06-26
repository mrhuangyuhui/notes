#-----------------------------/chapter8/ex8-10.sh------------------
#! /bin/bash

#筛选以字符串rc开头，紧跟着一个数字的问本行
str=`ls /etc | grep -P "^rc\d"`

echo "$str"
