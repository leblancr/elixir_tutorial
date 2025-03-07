defmodule ElixirTutorial do
  alias ElixirTutorial.Enums
  alias ElixirTutorial.Functions.AnonymousFunctions
  alias ElixirTutorial.Functions.DefaultArguments
  alias ElixirTutorial.Functions.FunctionNamingAndArity
  alias ElixirTutorial.Functions.FunctionsAndPatternMatching
  alias ElixirTutorial.Functions.Guards
  alias ElixirTutorial.Functions.NamedFunctions
  alias ElixirTutorial.Functions.PatternMatching
  alias ElixirTutorial.Functions.PrivateFunctions
  alias ElixirTutorial.ControlStructures
  alias ElixirTutorial.PipeOperator

  require MyLogger

  def main do
    import MyLogger
    Enums.enums()
    PatternMatching.pattern_matching()
    ControlStructures.control_structures()

    puts "\n***** Functions *****"
    AnonymousFunctions.anonymous_functions()
    PatternMatching.pattern_matching()

    puts "\n*** Named Functions ***"
    NamedFunctions.Greeter1.hello("Beau")
    NamedFunctions.Greeter2.hello("Beau")
    puts "Length.of []: #{NamedFunctions.Length.of([])}"
    puts "Length.of []: #{NamedFunctions.Length.of([1, 2, 3])}"

    puts "\n*** Function Naming and Arity ***"
    puts FunctionNamingAndArity.hello()
    FunctionNamingAndArity.hello("Beau")
    puts FunctionNamingAndArity.hello("Rich", "Beau")

    puts "\n*** Functions and Pattern Matching ***"
    fred = %{
      name: "Fred",
      age: "95",
      favorite_color: "Taupe"
    }
    FunctionsAndPatternMatching.hello1(fred)
    FunctionsAndPatternMatching.hello2(fred)
    FunctionsAndPatternMatching.hello3(fred)

    puts "\n*** Private Functions ***"
    PrivateFunctions.hello("Beau")

    puts "\n*** Guards ***"
    Guards.Greeter.hello ["Rich", "Beau"]

    puts "\n*** Default Arguments ***"
    DefaultArguments.Greeter1.hello("Beau", "en")
    DefaultArguments.Greeter1.hello("Beau")
    DefaultArguments.Greeter1.hello("Beau", "es")
    DefaultArguments.Greeter2.hello(["Rich", "Beau"])
    DefaultArguments.Greeter2.hello(["Rich", "Beau"], "es")

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