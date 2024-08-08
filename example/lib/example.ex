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

defmodule Grades do
  def even(n) do
    if rem(n, 2) == 0 do
      IO.puts(n)
    end
  end

  def sum_and_average(numbers) do
    sum = Enum.sum(numbers)
    average = sum / Enum.count(numbers)
    {sum, average}
  end

  def print_numbers(numbers) do
    numbers |> Enum.join(" ") |> IO.puts()
  end

  def get_number_from_user do
    IO.puts("Enter the numbers: ")
    user_input = IO.gets("") |> String.trim()
    String.split(user_input, " ") |> Enum.map(&String.to_integer/1)
  end

  def main() do
    grades = [25, 50, 75, 100]

    new = for n <- grades, do: n + 5
    IO.inspect(new)

    final = [5 | new]

    even = for n <- final, rem(n, 2) == 0, do: n
    odd = for n <- final, rem(n, 2) == 1, do: n
    IO.inspect(even)
    IO.inspect(odd)

    Enum.each(final, fn num -> even(num) end)
    nums = ["1", "2", "3"]

    result = Enum.map(nums, &String.to_integer/1)
    IO.inspect(result)

    user_numbers = get_number_from_user()
    {sum, average} = sum_and_average(user_numbers)
    IO.puts("the sum is #{sum} and the average is #{average}")
  end
end

# Example.main()
Grades.main()
