#! /bin/bash

exec 4<<333
count=0

while read LINE
do
   count=`expr $count + 1`
done

exec 0<&4
echo $count
