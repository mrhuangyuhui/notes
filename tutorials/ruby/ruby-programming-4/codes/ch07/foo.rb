def foo(a, b = 1, c = 3)
    puts a, b, c
end

foo(10)

=begin

```bash
$ ruby foo.rb 
10
1
3
```

=end