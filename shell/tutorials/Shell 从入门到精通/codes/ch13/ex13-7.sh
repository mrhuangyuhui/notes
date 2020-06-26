#! /bin/bash

if [ ! -e fifo ];then
   mkfifo fifo
fi

(
   x=500
   echo "$x" > fifo
)&

read y <fifo

echo "$y"
