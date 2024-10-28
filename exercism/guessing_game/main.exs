defmodule GuessingGame do
  def compare(secret_number, guess) when not is_number(guess) or is_atom(guess) do
    "Make a guess"
  end

  def compare(_secret_number) do
    "Make a guess"
  end

  def compare(secret_number, guess) when guess + 1 === secret_number or guess - 1 === secret_number do
    "So close"
  end

  def compare(secret_number, guess) when secret_number === guess do
    "Correct"
  end

  def compare(secret_number, guess) when guess < secret_number do
    "Too low"
  end

  def compare(secret_number, guess) when guess > secret_number do
    "Too high"
  end
end

