defmodule ElixirTutorial.Functions do
  defmodule AnonymousFunctions do
    def anonymous_functions do
      import MyLogger

      puts "*** Anonymous Functions *** "
      sum = fn (a, b) -> a + b end
      puts "sum = fn (a, b) -> a + b end
          sum.(2, 3): #{sum.(2, 3)}\n"

      puts "*** & Shorthand ***"
      sum = &(&1 + &2)
      puts "sum = &(&1 + &2)
          sum.(2, 3): #{sum.(2, 3)}\n"
    end
  end
end
