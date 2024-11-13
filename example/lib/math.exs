defmodule Math do
  def sum(a, b), do: a + b
  def sub(a, b), do: a - b
  
  def print_result(f) do
    IO.puts f.()
  end
end

defmodule MoreMath do
  import Math

  def add_and_sub(a, b, c) do
    sub(sum(a, b), c)
  end
end

