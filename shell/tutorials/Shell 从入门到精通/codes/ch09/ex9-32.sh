#-----------------------------/chapter9/ex9-32.sh------------------ 
#! /bin/bash

#统计/etc目录下面有多少个以conf为扩展名的文件
count=`find /etc -name "*.conf" | wc -l`

echo "$count files have been found."
