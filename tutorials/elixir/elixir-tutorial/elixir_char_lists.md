# [Elixir - Char Lists](https://www.tutorialspoint.com/elixir/elixir_char_lists.htm)

A char list is nothing more than a list of characters. Consider the following program to understand the same.

```elixir
IO.puts('Hello') # Hello
IO.puts(is_list('Hello')) # true
```

Instead of containing bytes, a char list contains the code points of the characters between single-quotes. So while the double-quotes represent a string (i.e. a binary), singlequotes represent a char list (i.e. a list).

Char lists are used mostly when interfacing with Erlang, in particular old libraries that do not accept binaries as arguments. You can convert a char list to a string and back by using the to_string(char_list) and to_char_list(string) functions.

```elixir
IO.puts(is_list(to_char_list("hełło"))) # true
IO.puts(is_binary(to_string ('hełło'))) # true
```