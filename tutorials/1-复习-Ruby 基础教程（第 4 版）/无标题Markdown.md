### Ruby基础教程第4版

在原有类的基础上添加方法
```ruby
class String
    def count_word
        ary = self.split(/\s+/)
        return ary.size
    end
end

str = "Just Another Ruby Newbie"
p str.count_word
```

类的继承与方法重写
```ruby
class RingArray < Array
    def [](i)
        idx = i % size
        super(idx)
    end
end 

ary = RingArray["one", "two", "three", "four"]
p ary[5]
p ary[9]
```

获取类的实例方法列表
```
> Object.instance_methods
> BasicObject.instance_methods
```

方法别名
```ruby
class C1
    def hello
        "Hello"
    end
end

class C2 < C1
    alias old_hello hello

    def hello
        "#{old_hello}, again"
    end
end

obj = C2.new
p obj.old_hello
p obj.hello
```

删除父类的方法
```ruby
class C1
    def hello
        "Hello"
    end
end

class C2 < C1
    undef hello
end

obj = C2.new
p obj.hello
```

单例方法
```ruby
str1 = "Ruby"
str2 = "Ruby"
class << str1
    def hello
        "Hello, #{self}!"
    end
end

p str1.hello
p str2.hello
```

调用模块的常量和方法
```ruby
p Math::PI
p Math.sqrt(2)
```

合并模块到当前命名空间
```ruby
include Math
p PI
p sqrt(2)
```

模块的定义
```ruby
module HelloModule
  Version = "1.0"

  def hello(name)
      puts "Hello, #{name}."
  end
  # 方法可以在模块内部与包含此模块的上下文中直接调用，如果要公开给外部使用，就要用到module_function方法，参数是方法名的符号名。
  module_function :hello
end

p HelloModule::Version
HelloModule.hello("Alice")

include HelloModule
p Version
hello("Alice")
```

把模块包含到类中
```ruby
module M
    def meth
        "meth"
    end
end

class C
    include M
end

c = C.new
p c.meth

# 判断类是否包含某个模块
p C.include?(M)

# 调查类的继承关系
p C.ancestors
p C.superclass
```

用extend追加对象的单例方法，把模块的功能扩展到对象。
```ruby
module Edition
  def edition(n)
      "#{self} #{n}th Version"
  end
end

str = "Ruby Programming"
str.extend(Edition)
p str.edition(4)
```

用extend追加类的类方法，用include追加类的实例方法。
```ruby
module ClassMethods
    def cmethod
        "class method"
    end
end

module InstanceMethods
    def imethod
        "instance method"
    end
end

class MyClass
    extend ClassMethods
    include InstanceMethods
end

p MyClass.cmethod
p MyClass.new.imethod
```

----

### [Ruby User's Guide](http://www.rubyist.net/~slagell/ruby/)

定义一个类
```
ruby> class Dog
    |   def speak
    |     puts "Bow Wow"
    |   end
    | end
   nil
```

创建一个实例
```
ruby> pochi = Dog.new
   #<Dog:0xbcb90>
```

调用类的实例方法
```
ruby> pochi.speak
Bow Wow
   nil
```

直接创建一个匿名实例并调用其方法
```
ruby> (Dog.new).speak   # or more commonly, Dog.new.speak
Bow Wow
   nil
```

----

定义继承关系
```
ruby> class Mammal
    |   def breathe
    |     puts "inhale and exhale"
    |   end
    | end
   nil
ruby> class Cat<Mammal
    |   def speak
    |     puts "Meow"
    |   end
    | end
   nil
```

调用父类方法
```
ruby> tama = Cat.new
   #<Cat:0xbd80e8>
ruby> tama.breathe
inhale and exhale
   nil
ruby> tama.speak
Meow
   nil
```

重写父类方法，完全替换其实现。
```
ruby> class Bird
    |   def preen
    |     puts "I am cleaning my feathers."
    |   end
    |   def fly
    |     puts "I am flying."
    |   end
    | end
   nil
ruby> class Penguin<Bird
    |   def fly
    |     fail "Sorry. I'd rather swim."
    |   end
    | end
   nil
```

----

完全替换父类方法的实现
```
ruby> class Human
    |   def identify
    |     puts "I'm a person."
    |   end
    |   def train_toll(age)
    |     if age < 12
    |       puts "Reduced fare.";
    |     else
    |       puts "Normal fare.";
    |     end
    |   end
    | end
   nil
ruby> Human.new.identify
I'm a person.
   nil
ruby> class Student1<Human
    |   def identify
    |     puts "I'm a student."
    |   end
    | end
   nil
ruby> Student1.new.identify
I'm a student.
   nil
```

调用父类方法的实现，并且进行拓展。
```
ruby> class Student2<Human
    |   def identify
    |     super
    |     puts "I'm a student too."
    |   end
    | end
   nil
ruby> Student2.new.identify
I'm a person.
I'm a student too.
   nil
```

调用父类方法的实现，传入自己的参数。
```
ruby> class Dishonest<Human
    |   def train_toll(age)
    |     super(11) # we want a cheap fare.
    |   end
    | end
   nil
ruby> Dishonest.new.train_toll(25)
Reduced fare. 
   nil

ruby> class Honest<Human
    |   def train_toll(age)
    |     super(age) # pass the argument we were given
    |   end
    | end
   nil
ruby> Honest.new.train_toll(25)
Normal fare. 
   nil
```

----

将方法设为私有，只允许类的内部访问。
```
ruby> class Test
    |   def times_two(a)
    |     puts "#{a} times two is #{engine(a)}"
    |   end
    |   def engine(b)
    |     b*2
    |   end
    |   private:engine  # this hides engine from users
    | end
   Test
ruby> test = Test.new
   #<Test:0x4017181c>
ruby> test.engine(6)
ERR: (eval):1: private method `engine' called for #<Test:0x4017181c>
ruby> test.times_two(6)
6 times two is 12.
   nil
```

----

定义单例方法，该方法只属于某一个实例。
```
ruby> class SingletonTest
    |   def size
    |     25
    |   end
    | end
   nil
ruby> test1 = SingletonTest.new
   #<SingletonTest:0xbc468>
ruby> test2 = SingletonTest.new
   #<SingletonTest:0xbae20>
ruby> def test2.size
    |    10
    | end
   nil
ruby> test1.size
   25
ruby> test2.size
   10
```

----

显式定义访问器方法
```
ruby> class Fruit
    |   def kind=(k)
    |     @kind = k
    |   end
    |   def kind
    |     @kind
    |   end
    | end
   nil
ruby> f2 = Fruit.new
   #<Fruit:0xfd7e7c8c>
ruby> f2.kind = "banana"
   "banana"
ruby> f2.kind
   "banana"
```

用访问器标记来定义访问器方法
```
ruby> class Fruit
    |   attr_accessor :condition
    |   def inspect
    |     "a #{@condition} #{@kind}"
    |   end
    | end
   nil
ruby> f2.condition = "ripe"
   "ripe"
ruby> f2
   "a ripe banana"
```

可用的访问器标记

| Shortcut	            | Effect                             |
| --------------------- | ---------------------------------- |
| attr_reader :v        | def v; @v; end
| attr_writer :v        | def v=(value); @v=value; end       |
| attr_accessor :v      | attr_reader :v; attr_writer :v     |
| attr_accessor :v, :w  | attr_accessor :v; attr_accessor :w |

----

无参数的初始化方法
```
ruby> class Fruit
    |   def initialize
    |     @kind = "apple"
    |     @condition = "ripe"
    |   end
    | end
   nil
ruby> f4 = Fruit.new
   "a ripe apple"
```

有一个参数的初始化方法
```
ruby> class Fruit
    |   def initialize( k )
    |     @kind = k
    |     @condition = "ripe"
    |   end
    | end
   nil
ruby> f5 = Fruit.new "mango"
   "a ripe mango"
ruby> f6 = Fruit.new
ERR: (eval):1:in `initialize': wrong # of arguments(0 for 1)
```

指定默认参数的初始化方法
```
ruby> class Fruit
    |   def initialize( k="apple" )
    |     @kind = k
    |     @condition = "ripe"
    |   end
    | end
   nil
ruby> f5 = Fruit.new "mango"
   "a ripe mango"
ruby> f6 = Fruit.new
   "a ripe apple"
```