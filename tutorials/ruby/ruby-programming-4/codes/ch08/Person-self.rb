class Person
    attr_accessor :name

    def initialize(name="Ruby")
        @name = name
    end

    def hi
        puts "Hi, I am #{self.name}!"
    end

    def hello
        puts "Hello, I am #{name}!"
    end
end

bob = Person.new("Bob")
bob.hi
bob.hello

=begin

```bash
$ ruby Person-self.rb 
Hi, I am Bob!
Hello, I am Bob!
```

=end