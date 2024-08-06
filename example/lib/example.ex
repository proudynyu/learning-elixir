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
  def do_it() do
    1
  end

  def do_it(n) do
    n * do_it(n - 1)
  end
end

Example.main()
