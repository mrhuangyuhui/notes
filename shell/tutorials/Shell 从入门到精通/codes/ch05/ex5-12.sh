#-----------------------------/chapter5/ex5-12.sh------------------
#! /bin/bash

#定义变量i
i=1
#一直循环到变量i的值为21
until [ "$i" -eq 21 ]
do
   #执行useradd命令添加用户
   useradd user$i
   #修改用户密码
   echo "password" | passwd --stdin user$i > /dev/null
   #循环变量自增
   let "i++"
done
