def myloop
    while true
        # 执行块
        yield
    end
end

num = 1

myloop do
    puts "num is #{num}."
    break if num > 100
    num *= 2
end

=begin

```bash
$ ruby myloop.rb 
num is 1.
num is 2.
num is 4.
num is 8.
num is 16.
num is 32.
num is 64.
num is 128.
```

=end