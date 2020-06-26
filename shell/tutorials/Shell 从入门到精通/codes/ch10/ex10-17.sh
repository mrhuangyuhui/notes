#-----------------------------/chapter10/ex10-17.sh------------------
#! /bin/bash

#×éºÏÃüÁî
result=`sed -n '1,5 {
  s/e/E/g
  s/a/A/g
  2 i 201303009 Tom
  p
}' students.txt`

echo "$result"
