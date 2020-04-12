#-----------------------------/chapter10/ex10-2.sh------------------
#! /bin/bash

#使用正则表达式定位
result=`sed -n '/^20020017/ p' students.txt`

echo "$result"
