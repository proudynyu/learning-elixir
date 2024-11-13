defmodule User do
  def get_name do
    name = ""
    IO.puts("What is your name? ")
    IO.gets(name)
    IO.puts("Hello there, #{name}")
  end
end

User.get_name()
