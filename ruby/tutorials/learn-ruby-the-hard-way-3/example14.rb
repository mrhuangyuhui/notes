# 习题 14 提示和传递

user_name = ARGV.first
prompt = '> '

puts "Hi #{user_name}."
puts "I'd like to ask you a few questions."
puts "Do you like me #{user_name}?", prompt
likes = $stdin.gets.chomp

puts "Where do you live #{user_name}?"
lives = $stdin.gets.chomp

puts "What kind of computer do you have?"
computer = $stdin.gets.chomp

puts """
Alright, so you said #{likes} about liking me.
You live in #{lives}. Not sure where that is.
And you have a #{computer} computer. Nice.
"""

=begin

```bash
$ ruby example14.rb Zed
Hi Zed.
I'd like to ask you a few questions.
Do you like me Zed?
>
Yes
Where do you live Zed?
San Francisco
What kind of computer do you have?
Tandy

Alright, so you said Yes about liking me.
You live in San Francisco. Not sure where that is.
And you have a Tandy computer. Nice.
```

http://ruby-doc.org/core-2.4.2/doc/globals_rdoc.html#$stdin

=end