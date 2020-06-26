#-----------------------------/chapter9/ex9-26.sh------------------ 
#! /bin/bash

#自定义分隔符
result=`sort -t : -k3n,3 /etc/passwd`

echo "$result"
