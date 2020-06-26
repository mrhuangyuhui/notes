#-----------------------------/chapter10/ex10-12.sh------------------
#! /bin/bash

#在第2行后面追加文本
result=`sed '2 a 200200109      Tom' students.txt`

echo "$result"
