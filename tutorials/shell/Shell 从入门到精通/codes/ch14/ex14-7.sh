#! /bin/bash

list=`ls -l | tee list.txt | awk '{print toupper($9)}'`
echo "$list"
