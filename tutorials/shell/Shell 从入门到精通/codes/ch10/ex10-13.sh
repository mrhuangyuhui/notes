#-----------------------------/chapter10/ex10-15.sh------------------
#! /bin/bash

#在以200200110开头的文本行后面追加文本
result=`sed '/^200200110/ a 200200109    Tom' students.txt`

echo "$result"
