defmodule Exercises.BottleSong.One do
  defp next_bottle(1), do: "1 bottle"
  defp next_bottle(n), do: "#{n} bottles"

  defp sing_verse(0) do
    IO.puts("no bottles left")
  end
  defp sing_verse(n) do
    IO.puts("#{next_bottle(n)} left, take 1 down, #{next_bottle(n - 1)} left")
  end

  def sing(first..last) when first <= last, do: sing_verse (first)

  def sing(first..last) do
     sing_verse(first)
     sing((first - 1)..last)
  end
end

defmodule Exercises.BottleSong.Two do
  defp next_bottle(1), do: "1 bottle"
  defp next_bottle(n), do: "#{n} bottles" 

  defp sing_verse(n) when n == 0 do
    IO.puts("#{next_bottle(n)} left")
  end
  defp sing_verse(n) do
    IO.puts("#{next_bottle(n)} left, take 1 down, #{next_bottle(n-1)} left")
  end

  def sing(n) when n == 0, do: sing_verse(0)
  def sing(n) do
    sing_verse (n)
    sing(n - 1)
  end
end

defmodule Exercises.BottleSong.Three do
@moduledoc """
Demonstrate recursion, matching, guard clauses, and control flow with the bottle song.
"""
  
  defp next_bottle(number) do
    if number === 2, 
      do: "1 bottle",
      else: "#{number - 1} bottles"
  end

  defp get_verse(2) do
    """
    1 bottle left. Take it down, no bottles left.
    """
  end
  defp get_verse(1) do
    "No bottles left."
  end
  defp get_verse(number) do
    """
    #{number - 1} bottles left. Take 1 down, #{next_bottle(number-1)} left.
    """
  end

  def sing_verses, do: IO.puts(sing(10..1))

  def sing(first..last) when first <= last,
    do: get_verse(first)

  @doc """
  Given a range like will produce verses to the song.
  """
  def sing(first..last),
    do: get_verse(first) <> sing(first - 1..last)
end