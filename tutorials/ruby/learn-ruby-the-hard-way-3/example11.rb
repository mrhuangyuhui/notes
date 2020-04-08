# 习题 11 提问

print "How old are you? "
age = gets.chomp
print "How tall are you? "
height = gets.chomp
print "How much do you weight? "
weight = gets.chomp

puts "So, you're #{age} old, #{height} tall and #{weight} heavy."

=begin

```bash
$ ruby example11.rb
How old are you? 34
How tall are you? 175cm
How much do you weight? 70kg
So, you're 34 old, 175cm tall and 70kg heavy.
```

接收到的用户输入默认为字符串，如果要进行数学计算，需要先转换为整数。

```bash
$ irb
irb(main):001:0> x = gets.chomp.to_i
12
=> 12
irb(main):002:0> y = gets.chomp.to_i
13
=> 13
irb(main):003:0> x + y
=> 25
```

http://ruby-doc.org/core-2.4.2/IO.html#method-i-gets

http://ruby-doc.org/core-2.4.2/String.html#method-i-chomp

=end