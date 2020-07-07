class Point
    # 定义存取器方法
    attr_accessor :x, :y
    # 将修改方法定义为 protected
    protected :x=, :y=

    def initialize(x=0.0, y=0.0)
        @x, @y = x, y
    end

    def swap(other)
        tmp_x, tmp_y = @x, @y
        @x, @y = other.x, other.y
        # 类的内部可以访问被定义为 protected 的修改方法 :x=
        other.x, other.y = tmp_x, tmp_y
    end
end

p0 = Point.new
p1 = Point.new(3.0, 5.0)
puts "p0: #{[p0.x, p0.y]}"
puts "p1: #{[p1.x, p1.y]}"

p0.swap(p1)
puts "p0: #{[p0.x, p0.y]}"
puts "p1: #{[p1.x, p1.y]}"

# 修改方法 :x= 被定义为 protected，外部无法访问。
p0.x = 20.0

=begin

```bash
$ ruby Point.rb 
p0: [0.0, 0.0]
p1: [3.0, 5.0]
p0: [3.0, 5.0]
p1: [0.0, 0.0]
Point.rb:29:in `<main>': protected method `x=' called for #<Point:0x007f933d1bc858 @x=3.0, @y=5.0> (NoMethodError)
```

=end