# 习题 10 那是什么

hello = "Hello"

# 单引号多行文本内忽略格式化 `#{}` 和转义字符
fat_cat = '''I\'ll do a list:
\t* Cat food
\t* Fishies
\t* Catnip\n\t* Grass
#{hello}
'''

puts fat_cat

=begin

```bash
$ ruby example10-2.rb 
I'll do a list:
\t* Cat food
\t* Fishies
\t* Catnip\n\t* Grass
#{hello}
```

=end