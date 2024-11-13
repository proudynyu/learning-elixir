defmodule Bot do
  def greet("") do
    IO.puts("None to greet")
  end

  def greet(name) do
    IO.puts("Wow, hello there #{name}")
  end
end
