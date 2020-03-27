# 习题 30 `else` 和 `if`

```py
people = 30
cars = 40
buses = 15

if cars > people:
    print "We should take the cars."
elif cars < people:
    print "We should not take the cars."
else:
    print "We can't decide."

if buses > cars:
    print "That's too many buses."
elif buses < cars:
    print "Maybe we could take the buses."
else:
    print "We still can't decide."

if people > buses:
    print "Alright, let's just take the buses."
else:
    print "Fine, let's stay home then."
```

输出结果
```
We should take the cars.
Maybe we could take the buses.
Alright, let's just take the buses.
```

**Python 的规则是，只要一行以冒号（:）结尾，它接下来的内容就应该有缩进。**