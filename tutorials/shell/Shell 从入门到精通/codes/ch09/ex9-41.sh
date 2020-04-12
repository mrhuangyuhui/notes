#-----------------------------/chapter9/ex9-41.sh------------------
#! /bin/bash

#使用默认选项联接2个文件
result=`join students.txt phones.txt > contactinfo.txt`

cat contactinfo.txt
