#-----------------------------/chapter10/ex10-7.sh------------------
#! /bin/bash

#引用与模式相匹配的子串
result=`sed 's/string/long &/' demo1.txt`

echo "$result"
