# 习题 10 那是什么

=begin

```bash
$ irb

# 将字符串中的双引号转义
irb(main):001:0> print "I am 6'2\" tall."
I am 6'2" tall.=> nil

# 将字符串中的单引号转义
irb(main):002:0> print 'I am 6\'2" tall.'
I am 6'2" tall.=> nil
```

=end

# 转义字符 \t
tabby_cat = "\tI'm tabbed in."
# 转义字符 \n
persian_cat = "I'm split\non a line."
# 转义字符 \\
backslash_cat = "I'm \\ a \\ cat."

# 双引号多行文本内不忽略转义字符 \t \n
fat_cat = """I'll do a list:
\t* Cat food
\t* Fishies
\t* Catnip\n\t* Grass
"""

puts tabby_cat
puts persian_cat
puts backslash_cat
puts fat_cat

=begin

```bash
$ ruby example10-1.rb 
        I'm tabbed in.
I'm split
on a line.
I'm \ a \ cat.
I'll do a list:
        * Cat food
        * Fishies
        * Catnip
        * Grass
```

=end