#-----------------------------/chapter7/ex7-20.sh------------------
#! /bin/bash

linux=("Debian" "RedHat" "Ubuntu" "Suse" "Fedora" "UTS" "CentOS")
#将切片结果赋给一个变量
var=${linux[@]:2:4}

echo "$var"
