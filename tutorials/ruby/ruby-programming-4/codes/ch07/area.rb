def area(x, y, z)
    xy = x * y
    yz = y * z
    zx = z * x
    (xy + yz + zx) * 2
end

p area(2, 3, 4)
p area(10, 20, 30)

=begin

```bash
$ ruby area.rb
52
2200
```

=end