def bar(arg, *args)
    [arg, args]
end

p bar(1)
p bar(1, 2, 3)

=begin

```bash
$ ruby foo-args-2.rb 
[1, []]
[1, [2, 3]]
```

=end