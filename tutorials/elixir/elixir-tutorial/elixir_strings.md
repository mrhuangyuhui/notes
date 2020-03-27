# [Elixir - Strings](https://www.tutorialspoint.com/elixir/elixir_strings.htm)

## Create a String

```elixir
str = "Hello world"
IO.puts(str)
```

## Empty Strings

```elixir
a = ""
if String.length(a) === 0 do
   IO.puts("a is an empty string")
end
```

## String Interpolation

```elixir
x = "Apocalypse"
y = "X-men #{x}"
IO.puts(y) # X-men Apocalypse
```

## String Concatenation

```elixir
x = "Dark"
y = "Knight"
z = x <> " " <> y
IO.puts(z) # Dark Knight
```

## String Length

```elixir
IO.puts(String.length("Hello"))
```

## Reversing a String

```elixir
IO.puts(String.reverse("Elixir"))
```

## String Comparison

```elixir
var_1 = "Hello world"
var_2 = "Hello Elixir"
if var_1 === var_2 do
   IO.puts("#{var_1} and #{var_2} are the same")
else
   IO.puts("#{var_1} and #{var_2} are not the same")
end
```

## String Matching

```elixir
IO.puts(String.match?("foo", ~r/foo/)) # true
IO.puts("foo" =~ ~r/foo/) # true

IO.puts(String.match?("bar", ~r/foo/)) # false
IO.puts("bar" =~ ~r/foo/) # false
```