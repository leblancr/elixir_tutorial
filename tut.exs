
defmodule ElixirTutorial do
  require MyLogger



  defmodule Modules do
    import MyLogger

    def structs do
      example_user = %Example.User{} # defaults
      puts example_user
      puts %Example.User{name: "Rich"} # One field filled in other default
      rich = %Example.User{name: "Rich", roles: [:manager]} # both fields
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

  def main do
    import MyLogger
    Enums.enums()
    PatternMapping.pattern_mapping()
    ControlStructures.control_structures()

    puts "\n***** Functions *****"
    Functions.anonymous_functions()
    Functions.pattern_patching()

    puts "\n*** Named Functions ***"
    Functions.NamedFunctions.Greeter1.hello("Beau")
    Functions.NamedFunctions.Greeter2.hello("Beau")
    puts "Length.of []: #{Functions.NamedFunctions.Length.of([])}"
    puts "Length.of []: #{Functions.NamedFunctions.Length.of([1, 2, 3])}"

    puts "\n*** Function Naming and Arity ***"
    puts Functions.FunctionNamingAndArity.hello()
    Functions.FunctionNamingAndArity.hello("Beau")
    puts Functions.FunctionNamingAndArity.hello("Rich", "Beau")

    puts "\n*** Functions and Pattern Matching ***"
    fred = %{
      name: "Fred",
      age: "95",
      favorite_color: "Taupe"
    }
    Functions.FunctionsAndPatternMatching.hello1(fred)
    Functions.FunctionsAndPatternMatching.hello2(fred)
    Functions.FunctionsAndPatternMatching.hello3(fred)

    puts "\n*** Private Functions ***"
    Functions.PrivateFunctions.hello("Beau")

    puts "\n*** Guards ***"
    Functions.Guards.Greeter.hello ["Rich", "Beau"]

    puts "\n*** Default Arguments ***"
    Functions.DefaultArguments.Greeter1.hello("Beau", "en")
    Functions.DefaultArguments.Greeter1.hello("Beau")
    Functions.DefaultArguments.Greeter1.hello("Beau", "es")
    Functions.DefaultArguments.Greeter2.hello(["Rich", "Beau"])
    Functions.DefaultArguments.Greeter2.hello(["Rich", "Beau"], "es")

    puts "\n***** Pipe Operator *****"
    PipeOperator.examples()

    puts "\n***** Modules *****"
    puts "\n*** Structs ***"
    Modules.structs()

    puts "\n*** Composition ***"
    Modules.Composition.Sayings.Greetings.basic("beau")
    Modules.Composition.Example.greeting("beau")
    Modules.Composition.Example.farewell("beau")
    Modules.Composition.Example.import_and_filtering()
    Modules.Composition.Example.hello("beau")
  end
end


ElixirTutorial.main()