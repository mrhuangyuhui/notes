#-----------------------------/chapter5/ex5-13.sh------------------
#! /bin/bash

i=1
until [ "$i" -eq 21 ]
do
   #ÒÀ´ÎÉ¾³ıÓÃ»§
   userdel -r user$i
   let "i++"
done
