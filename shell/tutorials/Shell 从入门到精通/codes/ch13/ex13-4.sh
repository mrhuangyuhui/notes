#!/bin/bash
echo "Before starting subshell"
(
   count=1
   while [ $count -le 10 ]
   do
       echo "$count"
       sleep 1
       (( count++ ))
   done
) &
echo "Finished"

