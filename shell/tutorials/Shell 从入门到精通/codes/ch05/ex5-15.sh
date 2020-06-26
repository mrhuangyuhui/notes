#-----------------------------/chapter5/ex5-15.sh------------------
#! /bin/bash

#提示用户输入数字
echo "Please enter a number between 1 and 10.Enter 0 to exit."
#读取用户输入的数字
read var
#while循环开始
while [[ "$var" != 0 ]]
do
   #提示用户输入数字太小
   if [ "$var" -lt 5 ]
   then
      echo "Too small. Try again."
      read var
   #提示用户输入数字太大
   elif [ "$var" -gt 5 ]
   then
      echo "Too big. Try again."
      read var;
    else
       echo "Congratulation! You are right."
       exit 0;
    fi
done
