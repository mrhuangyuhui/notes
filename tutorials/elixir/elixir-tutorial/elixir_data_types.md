# [Elixir - Data Types](https://www.tutorialspoint.com/elixir/elixir_data_types.htm)

## Numerical Types

n/a

## Atoms

Atoms are constants whose name is their value. They can be created using the color(`:`) symbol.

```elixir
:hello
```

## Booleans

Elixir supports `true` and `false` as Booleans. Both these values are in fact attached to atoms `:true` and `:false` respectively.

## Strings

```elixir
"Hello world"
```

```elixir
"""
Hello
World!
"""
```

## Binaries

Binaries are sequences of bytes enclosed in `<< >>` separated with a comma.

```elixir
<<65, 68, 75>>
```

## Lists

```elixir
[1, "Hello", :an_atom, true]
```

## Tuples

```elixir
{1, "Hello", :an_atom, true}
```

A question arises here, - why provide both lists and tuples when they both work in the same way? Well they have different implementations.

- Lists are actually stored as linked lists, so insertions, deletions are very fast in lists.

- Tuples on the other hand, are stored in contiguous memory block, which make accessing them faster but adds an additional cost on insertions and deletions.