class AccTest
    # 统一定义多个方法
    public

    def pub
        puts "pub is a public method."
    end

    private

    def priv
        puts "priv is a private method."
    end
end

acc = AccTest.new
acc.pub
acc.priv

=begin

```bash
$ ruby AccTest-2.rb 
pub is a public method.
AccTest-2.rb:18:in `<main>': private method `priv' called for #<AccTest:0x007ff769aaddc8> (NoMethodError)
```

=end