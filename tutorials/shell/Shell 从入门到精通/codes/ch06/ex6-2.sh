#-----------------------------/chapter6/ex6-2.sh------------------
#! /bin/bash

#定义函数
getCurrentTime()
{
   current_time=`date`
   echo "$current_time"
}

#调用函数
getCurrentTime
