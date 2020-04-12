#-----------------------------/chapter9/ex9-39.sh------------------ 
#! /bin/bash 
           
#选择students.txt文件的第1列 
cut -f1 students.txt > students.tmp

#选择phones.txt文件的第2列             
cut -f2 phones.txt > phones.tmp    

#将生成的2个临时文件拼接            
paste students.tmp phones.tmp > contactinfo.txt

#输出拼接结果                                  
cat contactinfo.txt
