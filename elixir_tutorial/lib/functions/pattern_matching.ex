defmodule ElixirTutorial.Functions.PatternMatching do
  def pattern_matching do
    import MyLogger

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
end