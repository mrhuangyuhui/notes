#-----------------------------/chapter7/ex7-22.sh------------------
#! /bin/bash

linux=("Debian" "RedHat" "Ubuntu" "Suse" "Fedora" "UTS" "CentOS")
#对数组元素切片
str=(${linux[4]:2:4})
#输出切片结果
echo "$str"
