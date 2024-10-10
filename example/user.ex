defmodule Example.User do
  @derive {Inspect, only: [:name]} # only name included in output
  # @derive {Inspect, except: [:roles]} same
  defstruct name: nil, roles: [] # predefined keys

  # Implement String.Chars protocol
  defimpl String.Chars do
    def to_string(%Example.User{name: name, roles: roles}) do
      "User(name: #{name}, roles: #{inspect(roles)})"
    end
  end
end
