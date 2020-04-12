#-----------------------------/chapter9/ex9-40.sh------------------
#! /bin/bash

#先将2个文件拼接
paste students.txt phones.txt > contactinfo.tmp
#再从拼接结果中选择第1和3列
cut -f1,3 contactinfo.tmp > contactinfo.txt
#输出拼接结果
cat contactinfo.txt
