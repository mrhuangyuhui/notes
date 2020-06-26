#-----------------------------/chapter6/ex6-12.sh------------------
#! /bin/bash

#定义函数
func()
{
   #逐个接收选项及其参数
   while getopts "a:b:c" arg
   do
      #当指定了-a选项时
      case "$arg" in
         a)
            #输出-a选项的参数值
            echo "a's argument is $OPTARG"
            ;;
         b)
            echo "b's argument is $OPTARG."
            ;;
         c)
            echo "c"
            ;;
         ?)
            #未知选项
            echo "unkown argument."
            exit 1
            ;;
      esac
   done
}
#调用函数
func -a hello -b world
