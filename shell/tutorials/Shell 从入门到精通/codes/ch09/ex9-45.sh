#-----------------------------/chapter9/ex9-45.sh------------------ 
#! /bin/bash

#全联接文本文件
result=`join -a 1 -a 2 students.txt phones.txt > contactinfo.txt`

cat contactinfo.txt
