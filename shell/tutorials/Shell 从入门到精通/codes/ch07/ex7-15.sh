#-----------------------------/chapter7/ex7-15.sh------------------
#! /bin/bash

#定义数组
linux[0]="Debian"
linux[1]="RedHat"
linux[2]="Ubuntu"
linux[3]="Suse"

#输出第4个元素
echo "the fourth element is ${linux[3]}"
#输出第4个元素的值
echo "the length of the fourth element is ${#linux[3]}"
#输出第1个元素的值
echo "the first element is ${linux}"
#输出第1个元素的长度
echo "the length of the first element is ${#linux}"
