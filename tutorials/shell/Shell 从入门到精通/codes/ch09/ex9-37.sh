#-----------------------------/chapter9/ex9-37.sh------------------ 
#! /bin/bash

#拼接2个文件，并输出到磁盘文件
paste students.txt phones.txt > contactinfo.txt

#显示拼接结果
cat contactinfo.txt
