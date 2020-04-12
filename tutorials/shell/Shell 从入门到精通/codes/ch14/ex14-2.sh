#! /bin/bash

while :
do
   read x
   if [ $x == "exit" ]; then
      exit 0
   else
      echo "$x"
   fi
done
