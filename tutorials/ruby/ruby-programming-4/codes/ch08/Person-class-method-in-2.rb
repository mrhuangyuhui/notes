# 在类的内部定义
class Person
    class << self
        def hello(name)
            puts "#{name} said hello."
        end
    end
end

Person.hello("John")

=begin

```bash
$ ruby Person-class-method-in-2.rb 
John said hello.
```

=end