#-----------------------------/chapter9/ex9-51.sh------------------
#! /bin/bash

#使用补集删除某些字符
result=`tr -cs "[a-z][A-Z]" "[\n*]" < demo11.txt`

echo "$result"
