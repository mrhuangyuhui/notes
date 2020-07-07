# 习题 20 函数和文件

# #ruby-file #ruby-io

input_file = ARGV.first

def print_all(f)
    puts f.read
end

def rewind(f)
    f.seek(0)
end

def print_a_line(line_count, f)
    puts "#{line_count}, #{f.gets.chomp}"
end

current_file = open(input_file)

puts "First let's print the whole file:\n"

print_all(current_file)

puts "Now let's rewind, kind of like a tape."

rewind(current_file)

puts "Let's puts three lines:"

current_line = 1
print_a_line(current_line, current_file)

current_line = current_line + 1
print_a_line(current_line, current_file)

current_line = current_line + 1
print_a_line(current_line, current_file)

=begin

```bash
$ ruby example20.rb test.txt
First let's print the whole file:
This is line 1
This is line 2
This is line 3
Now let's rewind, kind of like a tape.
Let's puts three lines:
1, This is line 1
2, This is line 2
3, This is line 3
```

=end