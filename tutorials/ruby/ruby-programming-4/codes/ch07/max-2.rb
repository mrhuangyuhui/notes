def max(a, b)
    if a > b
        return a
    else
        return b
    end
    # 这一行代码不会执行
    puts "Hello World"
end

p max(10, 5)

=begin

```bash
$ ruby max-2.rb 
10
```

=end