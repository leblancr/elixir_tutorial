defmodule ElixirTutorial.Functions.PrivateFunctions do
  import MyLogger

  def hello(name), do: puts phrase() <> name
    defp phrase, do: "Hello, "
end
