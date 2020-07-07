class Person
    @@HELLO_COUNT = 0
 
    def Person.HELLO_COUNT
        @@HELLO_COUNT
    end
 
    def initialize(name="Ruby")
        @name = name
    end
 
    def hello
        @@HELLO_COUNT += 1
        puts "Hello, I am #{@name}!\n"
    end
 end
 
 puts Person.HELLO_COUNT
 
 bob = Person.new("Bob")
 bob.hello
 bob.hello
 bob.hello
 
 puts Person.HELLO_COUNT

=begin

```bash
$ ruby Person-class-variable.rb 
0
Hello, I am Bob!
Hello, I am Bob!
Hello, I am Bob!
3
```

=end