#-----------------------------/chapter9/ex9-30.sh------------------   
#! /bin/bash

echo -n "Please input a name:"
#读取用户输入数据
read name

while [ $name != "e" ]
do
   #统计含有用户输入数据的行数
   quantity=`grep -c "$name" demo5.txt`
   echo "$quantity records contains $name."
   echo -n "Please input a name:"
   read name
done
