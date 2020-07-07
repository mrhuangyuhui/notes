def func(a, *b, c)
    [a, b, c]
end

p func(1, 2, 3, 4, 5)
p func(1, 2)

=begin

```bash
$ ruby func.rb 
[1, [2, 3, 4], 5]
[1, [], 2]
```

=end