#-----------------------------/chapter7/ex7-16.sh------------------
#! /bin/bash                       
                                   
#定义数组                          
array=(Mon Tue Wed Thu Fri Sat Sun)
#通过下标访问数组                  
for i in {0..6}                    
do                                 
   echo "${array[$i]}"             
done                               