# 习题 16 读写文件

# #ruby-file #ruby-io

filename = ARGV.first

puts "We're going to erase #{filename}."
puts "If you don't want that, hit CTRL-C (^C)."
puts "If you do want that, hit RETURN."

$stdin.gets

puts "Opening the file..."
target = open(filename, 'w')

puts "Truncating the file. Goodbye!"
target.truncate(0)

puts "Now I'm going to ask you for three lines."

print "line 1: "
line1 = $stdin.gets.chomp

print "line 2: "
line2 = $stdin.gets.chomp

print "line 3: "
line3 = $stdin.gets.chomp

puts "I'm going to write these to the file."

target.write(line1)
target.write("\n")
target.write(line2)
target.write("\n")
target.write(line3)
target.write("\n")

puts "And finally, we close it."
target.close()

=begin

```bash
$ ruby example16.rb sample.txt
We're going to erase test.txt.
If you don't want that, hit CTRL-C (^C).
If you do want that, hit RETURN.

Opening the file...
Truncating the file. Goodbye!
Now I'm going to ask you for three lines.
line 1: I am the first line.
line 2: I am the second line.
line 3: I am the third line.
I'm going to write these to the file.
And finally, we close it.
```

```bash
$ cat sample.txt 
I am the first line.
I am the second line.
I am the third line.
```

=end