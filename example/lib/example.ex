defmodule Membership do
  defstruct [:type, :price]
end

defmodule User do
  defstruct [:name, :membership]
end

defmodule Example do
  def main() do
    gold_membership = %Membership{type: :gold, price: 25}
    silver_membership = %Membership{type: :silver, price: 20}
    bronze_membership = %Membership{type: :bronze, price: 10}
    none_membership = %Membership{type: :none, price: 0}

    users = [
      %User{name: :igor, membership: gold_membership},
      %User{name: :ana, membership: silver_membership},
      %User{name: :felipe, membership: bronze_membership},
      %User{name: :john, membership: none_membership}
    ]

    Enum.each(users, fn %User{name: name, membership: membership} -> 
      IO.puts("The user #{name} has a membership #{Atom.to_string(membership.type)} and is paying #{membership.price}")
    end)
  end
end

defmodule Factorial do
  def do_it(n) do
    internal_do_it(n, 1)
  end

  defp internal_do_it(0, acc) do
    acc
  end

  defp internal_do_it(n, acc) do
    internal_do_it(n - 1, acc * n)
  end
end

defmodule GuessGame do
  def main() do
    correct = :rand.uniform(11) - 1
    guess = IO.gets("Guess the number from 0 to 10: ")
      |> String.trim()
      |> Integer.parse()


    case guess do
      {result, _} -> 
        IO.puts("parse success #{result}")

        if guess === correct do
          IO.puts("You guessed right!")
        else
          IO.puts("You missed, the correct one was #{correct}")
        end

      :error -> IO.puts("something went wrong")
    end
    
  end
end

# Example.main()
