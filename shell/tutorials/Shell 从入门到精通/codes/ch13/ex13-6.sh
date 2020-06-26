#! /bin/bash

(
   x=500
   echo "$x" >tmp
)

echo "$x"

read b <tmp

echo "$b"
