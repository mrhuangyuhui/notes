#! /bin/bash

export DEBUG=true

DEBUG()
{
   if [ "$DEBUG" == "true" ];then
      $@
   fi
}

a=1
DEBUG echo "a=$a"

if [ "$a" -eq 1 ]
then
     b=2
else
     b=1
fi
DEBUG echo "b=$b"
c=3
DEBUG echo "c=$c"
