#-----------------------------/chapter11/ex11-6.sh------------------
#! /bin/bash

#输出以Tom或者Kon开头的行
result=`awk '/^(Tom|Kon)/ { print }' scores.txt`

echo "$result"
