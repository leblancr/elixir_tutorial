defmodule ElixirTutorial.ControlStructures do
  import MyLogger

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

