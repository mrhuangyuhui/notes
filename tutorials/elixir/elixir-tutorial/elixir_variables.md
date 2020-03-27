# [Elixir - Variables](https://www.tutorialspoint.com/elixir/elixir_variables.htm)

## Types of Variables

- Integer

- Floats

- Boolean

- Strings

- Anonymous Functions/Lambdas

  These are functions that can be defined and assigned to a variable, which can then be used to call this function.

- Collections

## Variable Declaration

Elixir does not allow us to just declare a variable. A variable must be declared and assigned a value at the same time.

```elixir
life = 42
```

## Variable Naming

Variable names can also be started with a leading underscore but that must be used only when ignoring the variable, i.e., that variable will not be used again but is needed to be assigned to something.

## Printing Variables

```elixir
life = 42  
IO.puts life
```

```elixir
life = 42
IO.puts(life)
```