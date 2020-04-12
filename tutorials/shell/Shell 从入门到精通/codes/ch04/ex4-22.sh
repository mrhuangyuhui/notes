#-----------------------------/chapter4/ex4-22.sh------------------
#! /bin/sh

#输出提示信息
echo "Please enter a number:"
#从键盘读取用户输入的数字
read num
#如果用户输入的数字大于10
if [ "$num" -gt 10 ]; then
		#输出大于10的提示信息
 	echo "The number is greater than 10."
#否则
else
	#输出小于或者等于10的提示信息
		echo "The number is equal to or less than 10."
fi
