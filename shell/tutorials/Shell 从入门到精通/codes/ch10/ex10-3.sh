#-----------------------------/chapter10/ex10-3.sh------------------
#! /bin/bash

echo "substitute the first pattern."
#只将每行中第1次出现的小写字母e替换为大写字母E
result=`sed 's/e/E/' students.txt`

echo "$result"

echo "substitute all the patterns."
#将每一处的小写字母e都替换为大写字母E
result=`sed 's/e/E/g' students.txt`

echo "$result"
