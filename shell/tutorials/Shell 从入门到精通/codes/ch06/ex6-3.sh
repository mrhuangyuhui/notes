#-----------------------------/chapter6/ex6-3.sh------------------
#! /bin/bash

#定义函数john()
john()
{
   echo "Hello, this is John."
}
#定义函数alice
alice()
{
   #调用函数john
   john
   echo "Hello, this is Alice."
}
#调用函数alice
alice
