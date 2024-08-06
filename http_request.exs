defmodule Request do
  def get_url(url) do
    :inets.start()

    case :httpc.request(:get, {"https://google.com", []}, [], []) do
      {:ok, value} ->
        IO.puts(value)
      {:error, error} ->
        IO.puts(error)
  end
end
