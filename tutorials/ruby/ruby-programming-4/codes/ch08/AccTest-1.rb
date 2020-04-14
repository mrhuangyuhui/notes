class AccTest
    def pub
        puts "pub is a public method."
    end
    # 单独定义一个方法
    public :pub

    def priv
        puts "priv is a private method."
    end

    private :priv
end

acc = AccTest.new
# 可以在外部调用
acc.pub
# 不可以在外部调用，会报错。
acc.priv

=begin

```bash
$ ruby AccTest-1.rb 
pub is a public method.
AccTest-1.rb:19:in `<main>': private method `priv' called for #<AccTest:0x007fef9b289ca8> (NoMethodError)
```

=end