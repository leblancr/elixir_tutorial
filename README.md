# elixer_tutorial

To get shell run iex:
~/projects/elixer/elixer_tutorial git:[main]
iex
Erlang/OTP 27 [erts-15.0.1] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [jit:ns]

Interactive Elixir (1.17.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)>

compile all before running:
elixirc lib/*.ex lib/**/*.ex
rm -f *.beam - to get rid of warnings
elixir -pa build tut.exs # -pa option stands for "path add"

Steps to Convert Your Current Project to a Mix Project:
1. Create a mix.exs file: 
  mix new elixir_tutorial --module ElixirTutorial  

2. Move your existing files into the lib/ directory: 

3. Compile and run using Mix:
  cd elixir_tutorial
  mix compile



