#-----------------------------/chapter6/ex6-17.sh------------------
#! /bin/bash

#载入函数库
. ex6-22.sh

#定义变量
msg="the file is not found."
#调用函数库中的函数
error $msg
