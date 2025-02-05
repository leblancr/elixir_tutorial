defmodule ElixirTutorial.Functions.FunctionNamingAndArity do
  import MyLogger

  puts "*** Function Naming and Arity ***"
  def hello(), do: "Hello, anonymous person! (hello/0)" # hello/0
  def hello(name), do: puts "Hello, " <> name # hello/1
  def hello(name1, name2), do: "Hello, #{name1} and #{name2}" # hello/2
end
