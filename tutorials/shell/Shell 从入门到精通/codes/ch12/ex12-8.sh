#! /bin/bash

p1=`comm -2 -3 students.txt students1.txt`

echo "These students only appear in students.txt:"
echo "$p1"

p2=`comm -1 -3 students.txt students1.txt`

echo "These students only appear in students1.txt:"
echo "$p2"

p3=`comm -1 -2 students.txt students1.txt`

echo "These students appear in both students.txt and students1.txt:"
echo "$p3"

