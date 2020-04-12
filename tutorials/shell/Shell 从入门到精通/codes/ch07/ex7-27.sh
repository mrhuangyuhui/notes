#-----------------------------/chapter7/ex7-27.sh------------------
#! /bin/bash

#定义2个数组
linux=("Debian" "RedHat" "Ubuntu" "Suse" "Fedora" "UTS" "CentOS")
shell=("bash" "csh" "ksh" "rsh" "sh" "rc" "tcsh")

#连接数组
linuxshell=("${linux[@]}" "${shell[@]}")

#输出合并后的数组
echo "the new array is ${linuxshell[@]}"
#输出新的数组的长度
echo "the length of new array is ${#linuxshell[@]}"
