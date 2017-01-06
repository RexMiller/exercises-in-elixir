
defmodule Exercises.Shopper do
  
  defstruct income: 50000, family_size: 0, is_tall: false, lifestyle: :unknown

  def recommend_car(%Exercises.Shopper{family_size: family_size, income: income}) 
    when family_size > 3 and income > 100000,
    do: "Full sized SUV"

  def recommend_car(%Exercises.Shopper{family_size: family_size}) 
    when family_size > 3,
    do: "Mini-van"

  def recommend_car(%Exercises.Shopper{income: income}) 
    when income < 30000,
    do: "Compact"

  def recommend_car(%Exercises.Shopper{is_tall: is_tall})
    when is_tall == true,
    do: "Full sized sedan"

  def recommend_car(%Exercises.Shopper{lifestyle: lifestyle})
    when lifestyle == :active,
    do: "SUV with roof rack"

  def recommend_car(%Exercises.Shopper{}),
    do: "No recommendation"
end