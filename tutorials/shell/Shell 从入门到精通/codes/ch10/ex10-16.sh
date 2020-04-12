#-----------------------------/chapter10/ex10-16.sh------------------
#! /bin/bash

#使用分号隔开多个子命令
result=`sed -e 's/e/E/g;2 i 200100001    Ellen' students.txt`

echo "$result"
