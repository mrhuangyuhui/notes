#-----------------------------/chapter9/ex9-13.sh------------------
#! /bin/bash

#指定行长度
str=`fmt -c -w 80 demo2.txt`
echo "$str"
