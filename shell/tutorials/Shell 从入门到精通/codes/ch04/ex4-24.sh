#-----------------------------/chapter4/ex4-24.sh------------------
#! /bin/sh

echo "Please enter a score:"

read score

if [ -z "$score" ]; then
   echo "You enter nothing.Please enter a score:"
   read score
else
   if [ "$score" -lt 0 -o "$score" -gt 100 ]; then
      echo "The score should be between 0 and 100.Please enter again:"
      read score
   else
      #如果成绩大于90
      if [ "$score" -ge 90 ]; then
         echo "The grade is A."
      #如果成绩大于80且小于90
      elif [ "$score" -ge 80 ]; then
         echo "The grade is B."
      #如果成绩大于70且小于80
      elif [ "$score" -ge 70 ]; then
         echo "The grade is C."
      #如果成绩大于60且小于70
      elif [ "$score" -ge 60 ]; then
         echo "The grade is D."
      #如果成绩小于60
      else
         echo "The grade is E."
      fi
   fi
fi
