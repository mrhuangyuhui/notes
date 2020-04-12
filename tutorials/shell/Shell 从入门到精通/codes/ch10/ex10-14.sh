#-----------------------------/chapter10/ex10-14.sh------------------
#! /bin/bash

#在以200200110开头的文本行前面插入文本
result=`sed '2 i 200200109      Tom' students.txt`

echo "$result"
