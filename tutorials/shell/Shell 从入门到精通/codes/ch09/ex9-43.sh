#-----------------------------/chapter9/ex9-43.sh------------------
#! /bin/bash

#左联接文件
result=`join -a 1 students.txt phones.txt > contactinfo.txt`

cat contactinfo.txt
