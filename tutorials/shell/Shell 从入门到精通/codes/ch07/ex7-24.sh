#-----------------------------/chapter7/ex7-24.sh------------------
#! /bin/bash

linux=("Debian" "RedHat" "Ubuntu" "Suse" "Fedora" "UTS" "CentOS")
输出原始数组长度
echo "the length of original array is ${#linux[@]}"
#输出数组的原始值
echo "the old array is ${linux[@]}"
#删除下标为3的元素
unset linux[3]
输出新的数组的长度
echo "the length of new array is ${#linux[@]}"
#输出新的数组的值
echo "the new array is ${linux[@]}"
