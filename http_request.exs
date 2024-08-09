defmodule Content do
  defstruct [:tag, :content]
end

defmodule Request do
  def fetch(url) do
    :inets.start()
    :ssl.start()

    case :httpc.request(:get, { url, [] }, [], []) do
      {:ok, {{_protocol, status_code, reason}, _headers, body }} ->
        {:ok, %{status: status_code, reason: reason, body: to_string(body)}}

      {:error, reason} ->
        {:error, reason}
    end
  end

  def parser(html, tag) do
    regex = ~r/<#{tag}(.*?)>(.*?)<\/#{tag}>/

    case Regex.run(regex, html) do
      [content_complete, _, inside_content] -> [content_complete, inside_content]
      _ -> nil
    end
  end

  def parser_all(html, tag) do
    regex = ~r/<#{tag}(.*?)>(.*?)<\/#{tag}>/s

    Regex.scan(regex, html)
    |> Enum.map(fn [tag, _, text] -> 
      %Content{tag: tag, content: text}
    end)
  end
end

url = "https://google.com.br"
tag = "a"

case Request.fetch(url) do
  {:ok, response} -> 
      contents = Request.parser_all(response.body, tag)

      len = Enum.count(contents)
      IO.puts(len)

      Enum.each(contents, fn %{tag: html_tag, content: _} ->
        IO.puts(html_tag)
      end)
  {:error, error} -> IO.puts("Error: #{inspect(error)}")
end



