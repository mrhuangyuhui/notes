#-----------------------------/chapter11/ex11-4.sh------------------
#! /bin/bash

#打印第2列的成绩超过80的行
result=`awk '$2 > 80 { print }' scores.txt`

echo "$result"
