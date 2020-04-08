# 习题 7 更多打印

=begin

注意：`#{}` 在双引号里会被替换成变量的值，而在单引号不会这样做，它会忽略字符串里的变量。

```bash
$ irb
irb(main):001:0> var = 'snow'
=> "snow"

# 单引号不替换
irb(main):002:0> 'Its fleece was white as #{var}.'
=> "Its fleece was white as \#{var}."

# 双引号替换
irb(main):003:0> "Its fleece was white as #{var}."
=> "Its fleece was white as snow."
```

=end

puts "Mary had a little lamb."
puts "Its fleece was white as #{'snow'}."
puts "." * 10

end1 = "C"
end2 = "h"
end3 = "e"
end4 = "e"
end5 = "s"
end6 = "e"
end7 = "B"
end8 = "u"
end9 = "r"
end10 = "g"
end11 = "e"
end12 = "r"

# 不换行
print end1 + end2 + end3 + end4 + end5 + end6
# 换行
puts end7 + end8 + end9 + end10 + end11 + end12

=begin

```bash
$ ruby example07.rb 
Mary had a little lamb.
Its fleece was white as snow.
..........
CheeseBurger
```

=end