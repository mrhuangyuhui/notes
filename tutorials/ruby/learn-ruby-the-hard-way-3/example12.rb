# 习题 12 提示用户输入数

print "Give me a number: "
# 接收到的用户输入默认为字符串，如果要进行数学计算，需要先转换为整数。
number = gets.chomp.to_i

bigger = number * 100
puts "A bigger number is #{bigger}."

print "Give me another number: "
another = gets.chomp
number = another.to_i

smaller = number / 100
puts "A smaller number is #{smaller}."

=begin

```bash
$ ruby example12.rb
Give me a number: 10
A bigger number is 1000.
Give me another number: 200
A smaller number is 2.
```

=end