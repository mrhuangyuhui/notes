# [Elixir - Keyword Lists](https://www.tutorialspoint.com/elixir/elixir_keyword_lists.htm)

```elixir
list_1 = [{:a, 1}, {:b, 2}]
list_2 = [a: 1, b: 2]
IO.puts(list_1 == list_2) # true
```

```elixir
list = [a: 1, b: 2]
IO.puts(list[:a]) # 1
```

## Accessing a key

```elixir
kl = [a: 1, a: 2, b: 3]
IO.puts(Keyword.get(kl, :a))           # 1
IO.inspect(Keyword.get_values(kl, :a)) # [1, 2]
```

## Inserting a key

```elixir
kl = [a: 1, a: 2, b: 3]
kl_new = Keyword.put_new(kl, :c, 5)
IO.puts(Keyword.get(kl_new, :c)) # 5
```

## Deleting a key

```elixir
kl = [a: 1, a: 2, b: 3, b: 4, c: 0]
kl = Keyword.delete_first(kl, :b)
kl = Keyword.delete(kl, :a)

IO.inspect(Keyword.get(kl, :a)) # nil
IO.inspect(Keyword.get(kl, :b)) # 4
IO.inspect(Keyword.get(kl, :c)) # 0
```