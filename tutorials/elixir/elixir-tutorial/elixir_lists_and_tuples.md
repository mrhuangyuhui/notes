# [Elixir - Lists and Tuples](https://www.tutorialspoint.com/elixir/elixir_lists_and_tuples.htm)

## (Linked) Lists

```elixir
[1, 2, true, 3]
```

```elixir
IO.puts([104, 101, 108, 108, 111])    # hello
IO.inspect([104, 101, 108, 108, 111]) # 'hello'
```

```elixir
IO.puts(is_list('Hello')) # true
IO.puts(is_list("Hello")) # false
```

### Length of a List

```elixir
IO.puts(length([1, 2, :true, "str"])) # 4
```

### Concatenation and Subtraction

```elixir
IO.inspect([1, 2, 3] ++ [4, 5, 6]) # [1, 2, 3, 4, 5, 6]
IO.inspect([1, true, 2, false, 3, true] -- [true, false]) # [1, 2, 3, true]
```

### Head and Tail of a List

```elixir
list = [1, 2, 3]
IO.inspect(hd(list)) # 1
IO.inspect(tl(list)) # [2, 3]
```

## Tuples

```elixir
IO.inspect({:ok, "hello"}) # {:ok, "hello"}
```

### Length of a Tuple

```elixir
IO.puts(tuple_size({:ok, "hello"})) # 2
```

### Appending a Value

```elixir
tuple = {:ok, "Hello"}
new_tuple = Tuple.append(tuple, :world)
IO.inspect(tuple)     # {:ok, "Hello"}
IO.inspect(new_tuple) # {:ok, "Hello", :world}
```

### Inserting a Value

```elixir
tuple = {:bar, :baz}
new_tuple_1 = Tuple.insert_at(tuple, 0, :foo)
new_tuple_2 = put_elem(tuple, 1, :foobar)
IO.inspect(tuple)       # {:bar, :baz}
IO.inspect(new_tuple_1) # {:foo, :bar, :baz}
IO.inspect(new_tuple_2) # {:bar, :foobar}
```