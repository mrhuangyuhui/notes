class RingArray < Array # 指定父类
  def [](i) # 重定义运算符 []
    idx = i % size # 计算新索引值
    super(idx) # 调用父类中同名的方法
  end
end

wday = RingArray["日", "月", "火", "水", "木", "金", "土"]
p wday[6] #=> "土"
p wday[11] #=> "木"
p wday[15] #=> "月"
p wday[-1] #=> "土"

=begin

```bash
$ ruby ring_array.rb
"土"
"木"
"月"
"土"
```

=end