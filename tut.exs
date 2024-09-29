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

# Apply function every three items
res = Enum.map_every([1, 2, 3, 4, 5, 6, 7, 8], 3, fn(x) ->
  x + 1000 end)  # end anonymous function
IO.puts "map_every([1, 2, 3, 4, 5, 6, 7, 8], 3, fn(x) ->
  x + 1000 end)
result: #{inspect(res)}\n"

#
res = Enum.min([5, 3, 0, -1])
IO.puts "result: #{res}\n"

# apply a function to each element
res = Enum.filter([1, 2, 3, 4], fn(x) -> rem(x, 2) == 0 end)
IO.puts "result: #{inspect(res)}\n"

# a list and accumulater with initial value 10
# add each elkement to the previous result
res = Enum.reduce([1, 2, 3, 4, 5], 1, fn(x, acc) ->
  IO.puts "x: #{x} + acc: #{acc} = #{x + acc}"
  x + acc
end)
IO.puts "result: #{res}\n"

Enum.reduce(["a","b","c", "d"], "1", fn(x, acc) ->
  IO.puts "x: #{x} + acc: #{acc} = #{x <> acc}"
  x <> acc
end)







