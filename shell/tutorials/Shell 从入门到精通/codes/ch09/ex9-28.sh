#-----------------------------/chapter9/ex9-28.sh------------------
#! /bin/bash

#合并文件并输出磁盘文件
result=`sort demo5.txt demo6.txt > result.txt`

cat result.txt
