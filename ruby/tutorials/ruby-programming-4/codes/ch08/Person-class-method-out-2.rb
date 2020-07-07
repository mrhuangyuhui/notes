# 在类的外部定义
class Person
end

class << Person
    def hello(name)
        puts "#{name} said hello."
    end
end

Person.hello("John")

=begin

```bash
$ ruby Person-class-method-out-2.rb 
John said hello.
```

=end