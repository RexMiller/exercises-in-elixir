defmodule Exercises.Misc do
@moduledoc """
Reminders for me about various Elixir language features
"""
  
  @doc """
  Pattern matching for fun and profit
  """
  def subtotal(quantity, {_, _, price}) do
    quantity * price
  end

  @doc """
  Added this to demonstrate piping for a curious onlooker.
  """
  def piping() do
    add(2, 2) |> double() |> multiply(3) # <— 24 
  end

  def add(n1, n2) do
    n1 + n2
  end

  def double(n1) do
    n1 * 2
  end

  def multiply(n1, n2) do
    n1 * n2
  end

end