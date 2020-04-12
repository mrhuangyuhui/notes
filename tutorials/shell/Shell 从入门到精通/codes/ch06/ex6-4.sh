#-----------------------------/chapter6/ex6-4.sh------------------
#! /bin/bash

#定义函数john()
john()
{
   echo "Hello, this is John."
}

#定义函数alice()
alice()
{
   echo "Hello, this is Alice."
}
#定义函数sayhello()
sayhello()
{
   john
   alice
}
#调用函数sayhello()
sayhello
