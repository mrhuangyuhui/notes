#-----------------------------/chapter7/ex7-5.sh------------------
#! /bin/bash

#定义数组
array=([1]=one [4]=four)
#输出数组长度
echo "the size of the array is  ${#array[@]}"
#输出索引为4的元素的值
echo "the fourth element is ${array[4]}"
