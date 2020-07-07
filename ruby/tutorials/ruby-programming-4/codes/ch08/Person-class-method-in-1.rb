# 在类的内部定义（推荐这种）
class Person
    def self.hello(name)
        puts "#{name} said hello."
    end
end

Person.hello("John")

=begin

```bash
$ ruby Person-class-method-in-1.rb 
John said hello.
```

=end