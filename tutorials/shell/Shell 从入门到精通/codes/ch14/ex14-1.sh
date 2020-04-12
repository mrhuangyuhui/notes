#! /bin/bash

n=1
while [[ $n -le 5 ]];
do
   echo "the numberis $n."
   let "n+=1"
done

