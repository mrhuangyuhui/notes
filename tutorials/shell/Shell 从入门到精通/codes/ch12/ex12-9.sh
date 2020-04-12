#! /bin/bash

q1=`comm -2 -3 students.txt students1.txt | wc -l`

echo "These are $q1 students only appear in students.txt."

q2=`comm -1 -3 students.txt students1.txt | wc -l`

echo "These are $q2 students only appear in students1.txt."

q3=`comm -1 -2 students.txt students1.txt | wc -l`

echo "These are $q3 students appear in both students.txt and students1.txt."

