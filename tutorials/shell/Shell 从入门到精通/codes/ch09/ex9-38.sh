#-----------------------------/chapter9/ex9-38.sh------------------
#! /bin/bash

#自定义列分隔符
paste -d "," students.txt phones.txt > contactinfo.txt

cat contactinfo.txt
