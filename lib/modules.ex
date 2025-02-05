defmodule ElixirTutorial.Modules do
  @moduledoc false

  # Structs and Modules
  import MyLogger

  # Define the User struct
  defmodule User do
    defstruct name: "Sean", roles: []
  end

  def structs do
    defstruct name: "Sean", roles: []
    example_user = %User{name: "Rich", roles: [:manager]} # defaults
    puts example_user
    puts %User{name: "Rich"} # One field filled in other default
    rich = %User{name: "Rich", roles: [:manager]} # both fields
    puts rich # rich is a struct
    sean = %{rich | name: "Sean"}  # new struct, copy with one field changed, rich still exists
    puts sean
    puts %{name: "Sean"} = sean # match map against struct
    puts inspect(sean)
  end

  defmodule Composition do
    defmodule Sayings.Greetings do
      def basic(name), do: puts "Hi, #{name}"
    end

    defmodule Sayings.Farewells do
      def basic(name), do: puts "By, #{name}"
    end

    # use
    defmodule Hello do
      defmacro __using__(opts) do
        greeting = Keyword.get(opts, :greeting, "Hi")

        quote do
          def hello(name), do: puts unquote(greeting) <> ", " <> name
        end
      end
    end

    defmodule Example do
      use Hello, greeting: "Hola"
      alias Sayings.{Greetings, Farewells}
      def greeting(name), do: Greetings.basic(name)
      def farewell(name), do: Farewells.basic(name)

      #        # Without alias
      #        defmodule Example do
      #          def greeting(name), do: Sayings.Greetings.basic(name)
      #        end

      def import_and_filtering do
        import List
        puts first([1, 2, 3])
        puts last([1, 2, 3])
      end

      import List, only: :functions
      import List, only: :macros
    end
  end
end

