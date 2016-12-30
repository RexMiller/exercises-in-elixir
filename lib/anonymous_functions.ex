defmodule Exercises.AnonymousFunctions do
@moduledoc """
Examples of different forms of anonymous functions and function capture.
"""

  @doc """
  Passes an anonymous function as a parameter
  """
  def double_each(list),
    do: Enum.map list, fn (e) -> e * 2 end

  @doc """
  Passes an anonymous function as a parameter using & notation
  """
  def add_to_each(list, n),
    do: Enum.map list, &(&1 + n)

  @doc """
  Passes a function parameter by name/arity
  """
  def delegate_double_each(list), 
    do: Enum.map list, &double/1

  defp double(value),
    do: value * 2
  
  @doc """
  Captures a parameter in a closure and return a function that operates on the captured parameter
  """
  def capture_prefix(prefix),
    do: fn(subject) -> "#{prefix} #{subject}" end

end
