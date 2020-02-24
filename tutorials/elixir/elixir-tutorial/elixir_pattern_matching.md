# [Elixir - Pattern Matching](https://www.tutorialspoint.com/elixir/elixir_pattern_matching.htm)

```elixir
[var_1, _unused_var, var_2] = [{"First variable"}, 25, "Second variable" ]
IO.inspect(var_1) # {"First variable"}
IO.puts(var_2) # Second variable
```

```elixir
[_, [_, {a}]] = ["Random string", [:an_atom, {24}]]
IO.puts(a) # 24
```