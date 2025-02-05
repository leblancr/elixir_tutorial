defmodule ElixirTutorial.Functions.Guards do
  import MyLogger

  defmodule Greeter do
    def hello(names) when is_list(names) do
      names = Enum.join(names, ", ")

      hello(names)
    end

    def hello(name) when is_binary(name) do
      puts phrase() <> name
    end

    defp phrase, do: "Hello, "
  end
end
