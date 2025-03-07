defmodule ElixirTutorial.PatternMatching do
  import MyLogger

  def pattern_matching do
    puts "***** Pattern Matching *****"
    {:ok, value} = {:ok, "Successful!"}  # tuple matches tuple
    puts "value: #{value}\n"
    # ***** Pin *****
  end
end
