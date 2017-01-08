defmodule Exercises.MapsAndDictionaries do
@moduledoc """
Generates lists of maps for playing with map features. See the corresponding tests.
"""
  @doc """
  A list of flat maps
  """
  def get_cars(),
    do: [
      %{make: "Chevy", model: "Traverse", style: :large_suv, price: 20_000, description: "Chevy Traverse"},
      %{make: "Toyota", model: "Sienna", style: :mini_van, price: 26_000, description: "Toyota Sienna"},
      %{make: "Mazda", model: "6", style: :suv, price: 26_000, description: "Mazda 6"},
      %{make: "BMW", model: "X5", style: :suv, price: 46_000, description: "BMW X5"},
      %{make: "Subaru", model: "Forester", style: :wagon, price: 32_000, description: "Subaru Forester"},
      %{make: "Chevy", model: "Sonic", style: :compact, price: 13_000, description: "Chevy Sonic"},
      %{make: "Dodge", model: "Charger", style: :full_sedan, price: 28_000, description: "Dodge Charger"}
    ]

  @doc """
  A list of nested maps
  """
  def get_shoppers(),
    do: [
      %{ 
        name: "Bob",
        age: 40,
        car: %{
          make: "Infinity",
          model: "Q35",
          price: 29_000
        } 
      },
      %{ 
        name: "Dave",
        age: 50,
        car: %{
          make: "BMW",
          model: "525i",
          price: 37_000
        } 
      }      
    ]
end