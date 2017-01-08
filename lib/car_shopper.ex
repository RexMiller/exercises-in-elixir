defmodule Exercises.Car do
@moduledoc """
An example struct
"""
  defstruct(
    make: :unknown, 
    model: :unknown,
    style: :unknown,
    price: :unknown,
    description: ""
  )
end

defmodule Exercises.CarShopper do
@moduledoc """
Playing around with structs. This one has behavior. See corresponding tests.
"""
  defstruct(
    name: :unknown,
    income: 50_000, 
    family_size: 1, 
    height_inches: 68, 
    lifestyle: :unknown, 
    pti: 0.5,
    # a list of functions to evaluate shopper's preferences
    preferences: [
      &Exercises.CarShopper.can_afford/2, 
      &Exercises.CarShopper.fits_life/2, 
      &Exercises.CarShopper.fits_driver/2, 
      &Exercises.CarShopper.fits_family/2
    ])

  def recommend_cars(shopper, car_data),
    do: Enum.filter(car_data, fn(car) -> matches_car(shopper, car) end)

  @doc """
  Returns true if a car matches all of the preferences of this shopper
  """
  def matches_car(%Exercises.CarShopper{preferences: preferences} = shopper, car) do
    Enum.all?(preferences, fn(pref) -> pref.(shopper, car) end)
  end

  @doc "A function for affordability preference"
  def can_afford(%Exercises.CarShopper{income: income, pti: pti}, %Exercises.Car{price: price}),
    do: price == :unknown or (income * pti) >= price
  
  @doc "A function for family size preference"
  def fits_family(%Exercises.CarShopper{family_size: family_size}, %Exercises.Car{style: style})
    when family_size > 5,
    do: style in [:mini_van, :large_suv]

  @doc "A function for family size preference"
  def fits_family(%Exercises.CarShopper{family_size: family_size}, %Exercises.Car{style: style})
    when family_size > 3,
    do: style in [:mini_van, :suv, :large_suv, :wagon]

  @doc "A function for family size preference, matches when no other conditions match"
  def fits_family(%Exercises.CarShopper{}, %Exercises.Car{}),
    do: true
  
  @doc "A function for driver height preference"
  def fits_driver(%Exercises.CarShopper{height_inches: height}, %Exercises.Car{style: style})
    when height > 72,
    do: style in [:large_suv, :full_sedan]
  
  @doc "A function for driver height preference, matches when no other conditions match"
  def fits_driver(%Exercises.CarShopper{}, %Exercises.Car{}),
    do: true

  @doc "A function for affordability preference"
  def fits_life(%Exercises.CarShopper{lifestyle: life}, %Exercises.Car{style: style})
    when life == :active,
    do: style in [:large_suv, :suv, :pickup]

  @doc "A function for affordability preference"
  def fits_life(%Exercises.CarShopper{}, %Exercises.Car{}),
    do: true
end