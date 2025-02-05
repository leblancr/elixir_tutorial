defmodule ElixirTutorial.Functions.NamedFunctions do
  import MyLogger

  defmodule Greeter1 do
    def hello(name) do
      puts("Hello, " <> name)
    end
  end

  defmodule Greeter2 do
    def hello(name), do: puts "Hello, " <> name
  end

  defmodule Length do
    def of([]), do: 0
    def of([_ | tail]), do: 1 + of(tail)
  end
end

