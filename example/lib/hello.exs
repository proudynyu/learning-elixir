defmodule MyMath do
  def test(a, b) do
    a + b
  end
end



i = MyMath.test(1, 2)
IO.puts i
