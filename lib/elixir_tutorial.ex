defmodule ElixirTutorial do
  require MyLogger
  alias ElixirTutorial.{Enums, PatternMatching, ControlStructures, PipeOperator, Functions}

  def main do
    Enums.enums()
    PatternMatching.pattern_matching()
    ControlStructures.control_structures()

    MyLogger.puts "\n***** Functions *****"
    Functions.AnonymousFunctions.anonymous_functions()
    Functions.PatternMatching.pattern_matching()

    MyLogger.puts "\n*** Named Functions ***"
    Functions.NamedFunctions.Greeter1.hello("Beau")
    Functions.NamedFunctions.Greeter2.hello("Beau")
    MyLogger.puts "Length.of []: #{Functions.NamedFunctions.Length.of([])}"
    MyLogger.puts "Length.of [1, 2, 3]: #{Functions.NamedFunctions.Length.of([1, 2, 3])}"

    MyLogger.puts "\n*** Function Naming and Arity ***"
    MyLogger.puts Functions.FunctionNamingAndArity.hello()
    Functions.FunctionNamingAndArity.hello("Beau")
    MyLogger.puts Functions.FunctionNamingAndArity.hello("Rich", "Beau")

    MyLogger.puts "\n*** Functions and Pattern Matching ***"
    fred = %{name: "Fred", age: "95", favorite_color: "Taupe"}
    Functions.FunctionsAndPatternMatching.hello1(fred)
    Functions.FunctionsAndPatternMatching.hello2(fred)
    Functions.FunctionsAndPatternMatching.hello3(fred)

    MyLogger.puts "\n*** Private Functions ***"
    Functions.PrivateFunctions.hello("Beau")

    MyLogger.puts "\n*** Guards ***"
    Functions.Guards.Greeter.hello(["Rich", "Beau"])

    MyLogger.puts "\n***** Pipe Operator *****"
    PipeOperator.examples()
  end
end

ElixirTutorial.main()