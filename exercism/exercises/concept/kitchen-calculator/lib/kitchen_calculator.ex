defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    {_, volume} = volume_pair
    volume
  end

  def to_milliliter(volume_pair) do
    {size, volume} = volume_pair
    case size do
      :cup -> {:milliliter, volume * 240}
      :fluid_ounce -> {:milliliter, volume * 30}
      :teaspoon -> {:milliliter, volume * 5}
      :tablespoon -> {:milliliter, volume * 15}
      _ -> volume_pair
    end
  end

  def from_milliliter(volume_pair, unit) do
    {_, volume} = volume_pair
    case unit do
      :cup -> { unit, volume / 240 }
      :fluid_ounce -> { unit, volume / 30 }
      :teaspoon -> { unit, volume / 5 }
      :tablespoon -> { unit, volume / 15 }
      _ -> volume_pair
    end
  end

  def convert(volume_pair, unit) when unit === :milimiter, do: to_milliliter(volume_pair)
  def convert(volume_pair, unit) do
    mil_pair = to_milliliter(volume_pair)
    from_milliliter(mil_pair, unit)
  end
end
