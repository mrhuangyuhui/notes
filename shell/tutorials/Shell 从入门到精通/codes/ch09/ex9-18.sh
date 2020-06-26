#-----------------------------/chapter9/ex9-18.sh------------------
#! /bin/bash

#使用默认选项对文件排序
result=`sort demo5.txt`
#将输出结果保存到文件
echo "$result" > sorted_default.txt
#显示排序结果
cat sorted_default.txt
