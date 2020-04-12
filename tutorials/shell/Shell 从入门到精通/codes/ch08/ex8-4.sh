#-----------------------------/chapter8/ex8-4.sh------------------
#! /bin/bash

#列出所有的包含字符串“samba”的文件名
str=`ls /etc | grep "samba"`

echo "$str"

echo "==============================="

#列出包含字符串samba以及另外一个字符的文件名
str=`ls /etc | grep "samba."`

echo "$str"
