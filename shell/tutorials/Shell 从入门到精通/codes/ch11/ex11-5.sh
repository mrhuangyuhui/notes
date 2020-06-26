#-----------------------------/chapter11/ex11-5.sh------------------
#! /bin/bash

#输出以字符T开头的行
result=`awk '/^T/ { print }' scores.txt`

echo "$result"
