# 习题 15 读取文件

#ruby-file

# ./sample.txt
filename = ARGV.first

txt = open(filename)

puts "Here's your file #{filename}!"
print txt.read

print "Type the filename again: "
file_again = $stdin.gets.chomp

txt_again = open(file_again)

print txt_again.read

=begin

输出结果：
```
$ ruby example15.rb sample.txt
Here's your file sample.txt!
This is stuff I typed into a file.
It is really cool stuff.
Lots and lots of fun to have in here.
Type the filename again: sample.txt
This is stuff I typed into a file.
It is really cool stuff.
Lots and lots of fun to have in here.
```

=end