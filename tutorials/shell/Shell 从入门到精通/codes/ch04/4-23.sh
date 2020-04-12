#-----------------------------/chapter4/ex4-23.sh------------------
#! /bin/sh.

#输出提示信息
echo "Please enter a score:"
#读取用户输入数据
read score
#如果用户没有输入数据，则提示用户重新输入
if [ -z "$score" ]; then
   echo "You enter nothing.Please enter a score:"
   read score
else
   #如果用户输入的数据不对，则重新输入
   if [ "$score" -lt 0 -o "$score" -gt 100 ]; then
      echo "The score should be between 0 and 100.Please enter again:"
      read score
   else
   #输出级别A	
   if [ "$score" -ge 90 ]; then
      echo "The grade is A."
   else
      #输出级别B
      if [ "$score" -ge 80 ]; then
         echo "The grade is B."
      else
         #输出级别C      
         if [ "$score" -ge 70 ]; then
            echo "The grade is C."
         else
            #输出级别D
            if [ "$score" -ge 60 ]; then
               echo "The grade is D."
            else
               #输出级别E
               echo "The grade is E."
            fi
         fi
      fi
   fi
fi
