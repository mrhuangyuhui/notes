class Person
    def initialize(name="Ruby")
        @name = name
    end
    # Getter 方法
    def name
        @name
    end
    # Setter 方法
    def name=(name)
        @name = name
    end
end

person = Person.new("Bob")
# 读取实例变量
puts person.name

# 修改实例变量
person.name = "Robert"
puts person.name

=begin

```bash
$ ruby person-custom-accessor.rb 
Bob
Robert
```

=end