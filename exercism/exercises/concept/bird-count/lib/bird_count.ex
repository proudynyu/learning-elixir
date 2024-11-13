defmodule BirdCount do
  def today([]), do: nil

  def today(list) do
    hd list
  end

  def increment_day_count([]), do: [1]
  def increment_day_count(list) do
   [(hd list) + 1 | tl list]
  end

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?(list) do
    list
    |> Enum.filter(fn x -> x === 0 end)
    |> length > 0
  end

  def has_day_without_birds?([]), do: 0
  def total(list) do
    list
    |> Enum.sum()
  end

  def busy_days([]), do: 0
  def busy_days(list) do
    list
    |> Enum.filter(fn x -> x >= 5 end)
    |> length
  end
end
