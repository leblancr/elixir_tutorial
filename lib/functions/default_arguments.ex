defmodule DefaultArguments do
  import MyLogger

  defmodule Greeter1 do
    def hello(name, language_code \\ "en") do
      puts phrase(language_code) <> name
    end

    defp phrase("en"), do: "Hello, "
    defp phrase("es"), do: "Hola, "
  end
  defmodule Greeter2 do
    def hello(names, language_code \\ "en")

    def hello(names, language_code) when is_list(names) do
      names = Enum.join(names, ", ")

      hello(names, language_code)
    end

    def hello(name, language_code) when is_binary(name) do
      puts phrase(language_code) <> name
    end

    defp phrase("en"), do: "Hello, "
    defp phrase("es"), do: "Hola, "
  end
end

