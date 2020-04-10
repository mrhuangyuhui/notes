# 习题 17 更多文件操作

# #ruby-file #ruby-io

from_file, to_file = ARGV

puts "Copying from #{from_file} to #{to_file}"

in_file = open(from_file)
indata = in_file.read

puts "The input file is #{indata.length} bytes long"

puts "Does the output file exist? #{File.exist?(to_file)}"
puts "Ready, hit RETURN to continue, CTRL-C to abort."
$stdin.gets

out_file = open(to_file, 'w')
out_file.write(indata)

puts "Alright, all done."

out_file.close
in_file.close

=begin

```bash
$ ruby example17.rb input.txt output.txt
Copying from input.txt to output.txt
The input file is 20 bytes long
Does the output file exist? false
Ready, hit RETURN to continue, CTRL-C to abort.

Alright, all done.
```

```bash
$ cat output.txt 
This is a test file.
```

=end