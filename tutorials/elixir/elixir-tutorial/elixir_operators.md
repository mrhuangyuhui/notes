# [Elixir - Operators](https://www.tutorialspoint.com/elixir/elixir_operators.htm)

## Arithmetic Operators

```elixir
a = 10
b = 20

IO.puts("Addition " <> to_string(a + b))

IO.puts("Subtraction " <> to_string(a - b))

IO.puts("Multiplication " <> to_string(a * b))

IO.puts("Division " <> to_string(a / b))

IO.puts("Integer division " <> to_string(div(a, b)))

IO.puts("Modulo " <> to_string(rem(a, b)))
```

```bash
$ elixir main.exs
Addition 30
Subtraction -10
Multiplication 200
Division 0.5
Integer division 0
Modulo 10
```

## Comparison Operators

```elixir
a = 10
b = 20

IO.puts("a == b " <> to_string(a == b))

IO.puts("a != b " <> to_string(a != b))

IO.puts("a === b " <> to_string(a === b))

IO.puts("a !== b" <> to_string(a !== b))

IO.puts("a > b " <> to_string(a > b))

IO.puts("a < b " <> to_string(a < b))

IO.puts("a >= b " <> to_string(a >= b))

IO.puts("a <= b " <> to_string(a <= b))
```

```bash
$ elixir main.exs
a == b false
a != b true
a === b false
a !== btrue
a > b false
a < b true
a >= b false
a <= b true
```

## Logical Operators

```elixir
a = true
b = 20

IO.puts("a and b " <> to_string(a and b))

IO.puts("a or b " <> to_string(a or b))

IO.puts("not a " <> to_string(not a))

IO.puts("b && a " <> to_string(b && a))

IO.puts("b || a " <> to_string(b || a))

IO.puts("!a " <> to_string(!a))
```

```bash
$ elixir main.exs
a and b 20
a or b true
not a false
b && a true
b || a 20
!a false
```