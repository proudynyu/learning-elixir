defmodule TakeANumber do
  def start() do
    spawn(fn -> loop(0) end)
  end

  def loop(n) do
    receive do
      {:report_state, sender} ->
        send(sender, n)
        loop(n)

      {:take_a_number, sender} -> 
        s = n + 1
        send(sender, s)
        loop(s)

      :stop -> nil

      _ -> loop(n)
    end
  end
end
