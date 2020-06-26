#-----------------------------/chapter6/ex6-8.sh------------------
#! /bin/bash

#全局变量
var="Hello world"

func()
{
   #局部变量
   local var="Orange Apple Banana"
   echo "$var"
   #局部变量
   local var2="Hello John"
}
echo "$var"
func
echo "$var"
echo "$var2"
