defmodule  ElixirTutorial.PipeOperator do
  import MyLogger

  # foo(bar(baz(new_function(other_function()))))
  # other_function() |> new_function() |> baz() |> bar() |> foo()

  def examples do
    puts "Elixir rocks" |> String.split()
    puts "Elixir rocks" |> String.upcase() |> String.split()
    puts "elixir" |> String.ends_with?("ixir")
  end
end
