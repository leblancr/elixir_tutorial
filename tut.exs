# prints all the functions available in enum
IO.puts Enum.__info__(:functions) |>
          Enum.each(fn({function, arity}) ->
            IO.puts "#{function} / #{arity}"
          end)

# check if all are true
# each element in the list is sent to the function one by one
res = Enum.all?(["foo", "bar", "hello"], fn(s) ->
  String.length(s) == 3  # this is applied to each element in the list
end)

IO.puts "all?([\"foo\", \"bar\", \"hello\"], fn(s) ->
  String.length(s) == 3
result: #{res}\n"

#
res = Enum.chunk_every([1, 2, 3, 4, 5, 6], 3)
IO.puts "chunk_every([1, 2, 3, 4, 5, 6], 3)\nresult: #{inspect(res)}\n"

# chunk by string length
res = Enum.chunk_by(["one", "two", "three", "four", "five"], fn(x) ->
  String.length(x) end)
IO.puts "chunk_by([\"one\", \"two\", \"three\", \"four\", \"five\"], fn(x) ->
  String.length(x)
result: #{inspect(res)}\n"

# apply a function to each item and produce a new collection
res = Enum.map([0, 1, 2, 3], fn(x) -> x - 1 end)
  IO.puts "map([0, 1, 2, 3], fn(x) -> x - 1 end)
result: #{inspect(res)}\n"

# Apply function every third item
res = Enum.map_every([1, 2, 3, 4, 5, 6, 7, 8], 3, fn(x) ->
  x + 1000 end)  # end anonymous function
IO.puts "map_every([1, 2, 3, 4, 5, 6, 7, 8], 3, fn(x) ->
  x + 1000 end)
result: #{inspect(res)}\n"

# minimum value in list
res = Enum.min([5, 3, 0, -1])
  IO.puts "min([5, 3, 0, -1])
result: #{res}\n"

# apply a function to each element
res = Enum.filter([1, 2, 3, 4], fn(x) -> rem(x, 2) == 0 end)
  IO.puts "filter([1, 2, 3, 4], fn(x) -> rem(x, 2) == 0 end)
result: #{inspect(res)}\n"

# a list and accumulater with initial value 10
# add each elkement to the previous result
res = Enum.reduce([1, 2, 3, 4, 5], 1, fn(x, acc) ->
  IO.puts "x: #{x} + acc: #{acc} = #{x + acc}"
  x + acc
end)
IO.puts "reduce([1, 2, 3, 4, 5], 1, fn(x, acc) ->
  x + acc
result: #{res}\n"

res = Enum.reduce(["a","b","c", "d"], "1", fn(x, acc) ->
  IO.puts "x: #{x} + acc: #{acc} = #{x <> acc}"
  x <> acc
end)
IO.puts "reduce([\"a\",\"b\",\"c\", \"d\"], \"1\", fn(x, acc) ->
  x <> acc
result: #{res}\n"

# inspect(res) converts the list into a string
res = Enum.sort([5, 6, 1, 3, -1, 4])
  IO.puts "sort([5, 6, 1, 3, -1, 4])
result: #{inspect(res)}\n"

# old way, arrow function
IO.puts "Capture operator (&))"
res = Enum.map([1,2,3], fn number -> number + 3 end)
  IO.puts "map([1,2,3], fn number -> number + 3 end)
result: #{inspect(res)}\n"

# Capture operator (&)
res = Enum.map([1,2,3], &(&1 + 3))
IO.puts "map([1,2,3], &(&1 + 3))
result: #{inspect(res)}\n"

plus_three = &(&1 + 3)
IO.puts "assign the prior anonymous function featuring the Capture operator to a variable
plus_three = &(&1 + 3)"

# assign Capture operator (&) to variable
res = Enum.map([1,2,3], plus_three)
IO.puts "map([1,2,3], plus_three)
result: #{inspect(res)}\n"

# Using the capture operator with a named function
defmodule Adding do
  def plus_three(number), do: number + 3
end

IO.puts "defmodule Adding do"
IO.puts "  def plus_three(number), do: number + 3"
IO.puts "end
"
IO.puts "Using the capture operator with a named function"
IO.puts "Old way, anonymous arrow function"

# old way, anonymous arrow function
res = Enum.map([1,2,3], fn number -> Adding.plus_three(number) end)
IO.puts "map([1,2,3], fn number -> Adding.plus_three(number) end)
result: #{inspect(res)}\n"

# use the Capture operator.
res = Enum.map([1,2,3], &Adding.plus_three(&1))
IO.puts "map([1,2,3], &Adding.plus_three(&1))
result: #{inspect(res)}\n"

# directly call the named function without explicitly capturing the variable.
res = Enum.map([1,2,3], &Adding.plus_three/1)
IO.puts "map([1,2,3], &Adding.plus_three/1)
result: #{inspect(res)}\n"

#
if "Hello" do
  IO.puts "Valid string!"
else
  IO.puts "Invalid string."
end

# unless = like if not, like if is true
unless is_integer("hello") do
  IO.puts "Not an Int"
end

# case, ok matches and string is assigned to variable
res = case {:ok, "Hello World"} do
  {:ok, result} -> result
  {:error, _reason} -> "Uh oh!"
  _ -> "Catch all" # _ as the else that will match “everything else”.
end
IO.puts "result: #{inspect(res)}\n"

# error matches and string is assigned to variable
result = case {:error, "Something went wrong"} do
  {:ok, result} -> result
  {:error, reason} -> reason <> "re" # This will match now
  _ -> "Catch all"
end
IO.puts result

# ^ pin operator means
pie = 3.14
3.14

# pin (^) keeps original value, does not match or reassign
result = case "cherry pie" do
  ^pie -> "Not so tasty"
  pie -> "I bet #{pie} is tasty"
end
IO.puts result

# with guard
result = case {1, 2, 3} do
  {1, x, 3} when x > 5 ->
    "Will match"
  _ ->
    "Won't match"
end
IO.puts result

#
result = cond do
  2 + 2 == 5 ->
    "This will not be true"
  2 * 2 == 3 ->
    "Nor this"
  1 + 1 == 2 ->
    "But this will"
end
IO.puts result

# with
user = %{first: "Sean", last: "Callan"}
result = with {:ok, first} <- Map.fetch(user, :first),
              {:ok, last} <- Map.fetch(user, :last),
              do: last <> ", " <> first
IO.puts result