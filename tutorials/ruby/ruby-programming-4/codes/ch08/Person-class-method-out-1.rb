# 在类的外部定义（推荐这种）
class Person
end

def Person.hello(name)
    puts "#{name} said hello."
end

Person.hello("John")

=begin

```bash
$ ruby Person-class-method-out-1.rb 
John said hello.
```

=end