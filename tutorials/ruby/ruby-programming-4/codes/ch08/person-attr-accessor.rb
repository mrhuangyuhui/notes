class Person
    attr_accessor :name

    def initialize(name="Ruby")
        @name = name
    end
end

person = Person.new("Bob")
puts person.name

person.name = "Robert"
puts person.name

=begin

```bash
$ ruby Person-attr-accessor.rb 
Bob
Robert
```

=end