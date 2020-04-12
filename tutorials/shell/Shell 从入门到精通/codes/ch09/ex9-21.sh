#-----------------------------/chapter9/ex9-21.sh------------------
#! /bin/bash

#根据第4列的第14~15个字符排序，并输出到文件
sort -t ' ' -n -k 4.14,4.15 demo7.txt > sorted_log

cat sorted_log
