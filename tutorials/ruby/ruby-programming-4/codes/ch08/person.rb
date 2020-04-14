# 类定义
class Person
    # 初始化方法
    def initialize(name="Ruby")
        # 初始化实例变量
        @name = name
    end

    # 实例方法
    def sayHello
        # 在方法内引用实例变量
        puts "Hello, I am #{@name}!"
    end
end

# 创建实例对象
bob = Person.new("Bob");

# 调用实例对象的方法
bob.sayHello

alice = Person.new("Alice");
alice.sayHello

# new 方法省略参数
ruby = Person.new
ruby.sayHello

=begin

```bash
$ ruby person.rb 
Hello, I am Bob!
Hello, I am Alice!
Hello, I am Ruby!
```

=end