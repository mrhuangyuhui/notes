class Person
    attr_accessor :name

    def initialize(name="Ruby")
        @name = name
    end

    def hi
        # 同名局部变量
        name = "Python"

        # 引用的是局部变量，不是实例变量。
        puts "Hi, I am #{name}."

        # 省略 self，必须用 @ 来引用实例变量
        puts "#{@name} said hi."
    end

    def hello
        name = "Python"

        # 用 self 引用实例变量
        puts "Hello, I am #{self.name}."
    end
end

bob = Person.new("Bob")
bob.hi
bob.hello

=begin

```bash
$ ruby Person-override-variable.rb 
Hi, I am Python.
Bob said hi.
Hello, I am Bob.
```

=end