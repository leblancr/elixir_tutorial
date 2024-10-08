defmodule ElixirTutorial do
  def puts(message), do: IO.puts(message) # alias IO.puts

  def main do
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
  end
end

defmodule Enums do
  import ElixirTutorial, only: [puts: 1]
  def enums do
    puts "***** Enum functions *****"
    # prints all the functions available in enum
    puts Enum.__info__(:functions) |>
           Enum.each(fn({function, arity}) ->
             IO.puts "#{function} / #{arity}"
           end)

    # check if all are true
    # each element in the list is sent to the function one by one
    res = Enum.all?(["foo", "bar", "hello"], fn(s) ->
      String.length(s) == 3  # this is applied to each element in the list
    end)

    puts "\nall?([\"foo\", \"bar\", \"hello\"], fn(s) ->
    String.length(s) == 3
    result: #{res}\n"

    #
    res = Enum.chunk_every([1, 2, 3, 4, 5, 6], 3)
    puts "chunk_every([1, 2, 3, 4, 5, 6], 3)\nresult: #{inspect(res)}\n"

    # chunk by string length
    res = Enum.chunk_by(["one", "two", "three", "four", "five"], fn(x) ->
      String.length(x) end)
    puts "chunk_by([\"one\", \"two\", \"three\", \"four\", \"five\"], fn(x) ->
      String.length(x)
    result: #{inspect(res)}\n"

    # apply a function to each item and produce a new collection
    res = Enum.map([0, 1, 2, 3], fn(x) -> x - 1 end)
    puts "map([0, 1, 2, 3], fn(x) -> x - 1 end)
    result: #{inspect(res)}\n"

    # Apply function every third item
    res = Enum.map_every([1, 2, 3, 4, 5, 6, 7, 8], 3, fn(x) ->
      x + 1000 end)  # end anonymous function
    puts "map_every([1, 2, 3, 4, 5, 6, 7, 8], 3, fn(x) ->
      x + 1000 end)
    result: #{inspect(res)}\n"

    # minimum value in list
    res = Enum.min([5, 3, 0, -1])
    puts "min([5, 3, 0, -1])
    result: #{res}\n"

    # apply a function to each element
    res = Enum.filter([1, 2, 3, 4], fn(x) -> rem(x, 2) == 0 end)
    puts "filter([1, 2, 3, 4], fn(x) -> rem(x, 2) == 0 end)
    result: #{inspect(res)}\n"

    # a list and accumulater with initial value 10
    # add each elkement to the previous result
    res = Enum.reduce([1, 2, 3, 4, 5], 1, fn(x, acc) ->
      puts "x: #{x} + acc: #{acc} = #{x + acc}"
      x + acc
    end)
    puts "reduce([1, 2, 3, 4, 5], 1, fn(x, acc) ->
      x + acc
    result: #{res}\n"

    res = Enum.reduce(["a","b","c", "d"], "1", fn(x, acc) ->
      puts "x: #{x} + acc: #{acc} = #{x <> acc}"
      x <> acc
    end)
    puts "reduce([\"a\",\"b\",\"c\", \"d\"], \"1\", fn(x, acc) ->
      x <> acc
    result: #{res}\n"

    # inspect(res) converts the list into a string
    res = Enum.sort([5, 6, 1, 3, -1, 4])
    puts "sort([5, 6, 1, 3, -1, 4])
    result: #{inspect(res)}\n"

    # old way, arrow function
    puts "Capture operator (&))"
    res = Enum.map([1,2,3], fn number -> number + 3 end)
    puts "map([1,2,3], fn number -> number + 3 end)
    result: #{inspect(res)}\n"

    # Capture operator (&)
    res = Enum.map([1,2,3], &(&1 + 3))
    puts "map([1,2,3], &(&1 + 3))
    result: #{inspect(res)}\n"

    plus_three = &(&1 + 3)
    puts "assign the prior anonymous function featuring the Capture operator to a variable
    plus_three = &(&1 + 3)"

    # assign Capture operator (&) to variable
    res = Enum.map([1,2,3], plus_three)
    puts "map([1,2,3], plus_three)
    result: #{inspect(res)}\n"

    # Using the capture operator with a named function
    defmodule Adding do
      def plus_three(number), do: number + 3
    end

    puts "defmodule Adding do"
    puts "  def plus_three(number), do: number + 3"
    puts "end
    "
    puts "Using the capture operator with a named function"
    puts "Old way, anonymous arrow function"

    # old way, anonymous arrow function
    res = Enum.map([1,2,3], fn number -> Adding.plus_three(number) end)
    puts "map([1,2,3], fn number -> Adding.plus_three(number) end)
    result: #{inspect(res)}\n"

    # use the Capture operator.
    res = Enum.map([1,2,3], &Adding.plus_three(&1))
    puts "map([1,2,3], &Adding.plus_three(&1))
    result: #{inspect(res)}\n"

    # directly call the named function without explicitly capturing the variable.
    res = Enum.map([1,2,3], &Adding.plus_three/1)
    puts "map([1,2,3], &Adding.plus_three/1)
    result: #{inspect(res)}\n"
  end
end

defmodule PatternMapping do
  import ElixirTutorial, only: [puts: 1]
  def pattern_mapping do
    puts "***** Pattern Matching *****"
    {:ok, value} = {:ok, "Successful!"}  # tuple matches tuple
    puts "value: #{value}\n"
    # ***** Pin *****
  end
end

defmodule ControlStructures do
  import ElixirTutorial, only: [puts: 1]
  def control_structures do
    puts "***** Control Structures *****"
    if "Hello" do
      puts "Valid string!"
    else
      puts "Invalid string."
    end

    # unless = like if not, like if is true
    unless is_integer("hello") do
      puts "Not an Int"
    end

    # case, ok matches and string is assigned to variable
    res = case {:ok, "Hello World"} do
      {:ok, result} -> result
      {:error, _reason} -> "Uh oh!"
      _ -> "Catch all" # _ as the else that will match “everything else”.
    end
    puts "result: #{inspect(res)}\n"

    # error matches and string is assigned to variable
    result = case {:error, "Something went wrong"} do
      {:ok, result} -> result
      {:error, reason} -> reason # This will match now
      _ -> "Catch all"
    end
    puts result

    # ^ pin operator means
    pie = 3.14

    # pin (^) keeps original value, does not match or reassign
    # "cherry pie" goes into pie variable
    result = case "cherry pie" do
      ^pie -> "Not so tasty"
      pie -> "I bet #{pie} is tasty"
    end
    puts result

    input = {1, 6, 3}
    # with guard
    result = case input do
      {1, x, 3} when x > 5 ->
        "Will match"
      _ ->
        "Won't match"
    end
    puts result

    #
    result = cond do
      2 + 2 == 5 ->
        "This will not be true"
      2 * 2 == 3 ->
        "Nor this"
      1 + 1 == 2 ->
        "But this will"
    end
    puts result

    # with
    user = %{first: "Sean", last: "Callan"}
    result = with {:ok, first} <- Map.fetch(user, :first),
                  {:ok, last} <- Map.fetch(user, :last),
                  do: last <> ", " <> first
    puts result
  end
end

defmodule Functions do
  import ElixirTutorial, only: [puts: 1]
  def anonymous_functions do
    puts "*** Anonymous Functions *** "
    sum = fn (a, b) -> a + b end
    puts "sum = fn (a, b) -> a + b end
    sum.(2, 3): #{sum.(2, 3)}\n"

    puts "*** & Shorthand ***"
    sum = &(&1 + &2)
    puts "sum = &(&1 + &2)
    sum.(2, 3): #{sum.(2, 3)}\n"
  end

  def pattern_patching do
    puts "*** Pattern Matching for functions ***"
    result = 1

    handle_result = fn
      {:ok, ^result} -> puts "Handling result (#{result})..."
      {:ok, _} -> puts "This would be never run as previous will be matched beforehand."
      {:error} -> puts "An error has occurred!"
    end

    some_result = 1
    puts "some_result = 1"

    puts "handle_result = fn
      {:ok, ^result} -> puts \"Handling result (#{result})...\"
      {:ok, _} -> puts \"This would be never run as previous will be matched beforehand.\"
      {:error} -> puts \"An error has occurred!\"
    end

    some_result = 1
    handle_result.({:ok, some_result})"
    puts handle_result.({:ok, some_result})
    puts "handle_result.({:error})"
    puts handle_result.({:error})
  end

  defmodule NamedFunctions do
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

  defmodule FunctionNamingAndArity do
    puts "*** Function Naming and Arity ***"
    def hello(), do: "Hello, anonymous person! (hello/0)" # hello/0
    def hello(name), do: puts "Hello, " <> name # hello/1
    def hello(name1, name2), do: "Hello, #{name1} and #{name2}" # hello/2
  end

  defmodule FunctionsAndPatternMatching do
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

  defmodule PrivateFunctions do
    def hello(name), do: puts phrase() <> name
    defp phrase, do: "Hello, "
  end

  defmodule Guards do
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

  defmodule DefaultArguments do
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

  #  # hello/1 with guard
#  def hello(name) when is_binary(name) do
#    puts "hello/1 with guard"
#    puts phrase() <> name
#  end
#
#  # The clause def hello(%{name: person_name}) matches any map that has
#  # at least the key :name, regardless of additional keys.
#  def hello1(input) do
#    case input do
#      # if map has this key do this
#      %{name: person_name} ->
#        puts "Received a map with name: #{inspect(person_name)}"
#        puts "Hello1, " <> person_name
#      name when is_binary(name) ->
#        puts "Hello1, " <> name
#      _ ->
#        puts "Hello1, anonymous person!"
#    end
#  end
#
#  # new_person_map is a new variable from matching
#  # 1. entire passed in map goes into new_person_map
#  # 2. value associated with name: goes into person_name next
#  # new_person_map = passed in map (first)
#  # Functions pattern-match the data passed in to each of its arguments independently.
#  def hello2(new_person_map = %{name: person_name}) do
#    puts "Hello2, " <> person_name
#    IO.inspect new_person_map
#  end
#
#  def hello(name, language_code \\ "en") do
#    puts phrase(language_code) <> name
#  end
#
#  defp phrase("en"), do: "Hello, "
#  defp phrase("es"), do: "Hola, "
#
#  def hello3(name), do: puts phrase() <> name
#  defp phrase, do: "Hellop, "
#
#  def hello(name1, name2), do: "Hello/2, #{name1} and #{name2}"  # hello/2
#
#  def hellol(names) when is_list(names) do
#    names = Enum.join(names, ", ")
#    hello(names) # hello/1 with is_binary guard
#  end
#
#  # recursion using named functions:
#  def of([]), do: 0
#  def of([_ | tail]), do: 1 + of(tail)
#
#  def functions do
#    # hello("Beau")
#
#    puts "Length.of [] " <> Integer.to_string(of([]))
#    puts "Length.of [1, 2, 3] " <> Integer.to_string(of([1, 2, 3]))
#    puts "Length.of [] #{of([])}"
#    puts "Length.of [1, 2, 3] #{of([1, 2, 3])}"
#
#    puts "# *** Default Arguments ***"
#    hello("beau", "en")
#    hello("beau")
#    hello("beau", "es")
#  end

end

ElixirTutorial.main()