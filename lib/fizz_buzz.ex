defmodule Exercises.FizzBuzz do
@moduledoc """  
Implements FizzBuzz using pattern matching and recursion.
"""
  defp match(0, 0, _), do: "FizzBuzz"
  defp match(0, _, _), do: "Fizz"
  defp match(_, 0, _), do: "Buzz"
  defp match(_, _, n), do: "#{n}"

  defp evaluate(n), 
    do: match(rem(n, 3), rem(n, 5), n) 

  defp fizz_buzzer(accumulation, {last, last}), 
    do: accumulation ++ [evaluate(last)]

  defp fizz_buzzer(accumulation, {first, last}) do
    accumulation ++ [evaluate(first)]
    |> fizz_buzzer({first + 1, last})
  end

  @doc """
  Given a tuple with a starting number and an ending number will evaluate all numbers in the range for fizz-buzzyness.

  ## Example
  iex> Exercises.FizzBuzz.fizz_buzz({1, 3})
  ["1", "2", "Fizz"]
  """
  def fizz_buzz({first, last}), 
    do: fizz_buzzer([], {first, last})

end