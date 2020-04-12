#-----------------------------/chapter10/ex10-4.sh------------------
#! /bin/bash

#替换第1~3行中的所有的小写字母e为大写字母E
result=`sed '1,3 s/e/E/g' students.txt`

echo "$result"
