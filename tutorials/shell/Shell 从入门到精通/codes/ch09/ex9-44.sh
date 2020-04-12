#-----------------------------/chapter9/ex9-44.sh------------------
#! /bin/bash

#右联接文件
result=`join -a 2 students.txt phones.txt > contactinfo.txt`

cat contactinfo.txt
