def foo(*args)
    args
end

p foo(1, 2, 3)

=begin

```bash
$ ruby foo-args-1.rb 
[1, 2, 3]
```

=end