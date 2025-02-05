defmodule ElixirTutorial.Functions.FunctionsAndPatternMatching do
  import MyLogger

  def hello1(%{name: person_name}) do
    puts "Hello, " <> person_name
  end
  def hello2(%{name: person_name} = person) do
    IO.puts "Hello, " <> person_name
    IO.inspect person
  end
  def hello3(person = %{name: person_name}) do
    IO.puts "Hello, " <> person_name
    IO.inspect person
  end
end
