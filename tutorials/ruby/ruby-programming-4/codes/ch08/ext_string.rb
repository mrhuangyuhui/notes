class String
  def count_word
    ary = self.split(/\s+/) # 用空格分割接收者
    return ary.size # 返回分割后的数组的元素总数
  end
end

str = "Just Another Ruby Newbie"
p str.count_word #=> 4

=begin

```bash
$ ruby ext_string.rb
4
```

=end