# 习题 9 打印，打印，打印

days = "Mon Tue Wed Thu Fri Sat Sun"
# 转义字符 \n
months = "\nJan\nFeb\nMar\nApr\nMay\nJun\nJul\nAug"

puts "Here are the days: #{days}"
puts "Here are the months: #{months}"

# 多行文本
puts """
There's something going on here.
With the three double-quotes.
We'll be able to type as much as we like.
Even 4 lines if we want, or 5, or 6.
"""

=begin

```bash
$ ruby example09.rb 
Here are the days: Mon Tue Wed Thu Fri Sat Sun
Here are the months: 
Jan
Feb
Mar
Apr
May
Jun
Jul
Aug

There's something going on here.
With the three double-quotes.
We'll be able to type as much as we like.
Even 4 lines if we want, or 5, or 6.
```

=end