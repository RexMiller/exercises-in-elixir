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

end