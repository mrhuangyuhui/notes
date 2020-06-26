#-----------------------------/chapter10/ex10-10.sh------------------
#! /bin/bash

#删除最后一行
result=`sed -e '$ d' students.txt`

echo "$result"
