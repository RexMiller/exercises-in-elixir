defmodule ShopperTest do
  use ExUnit.Case

  defp _is_car(%Exercises.Car{}), do: true
  defp _is_car(_), do: false

  defp _get_cars(), 
    do: [
      %Exercises.Car{make: "Chevy", model: "Traverse", style: :large_suv, price: 20_000, description: "Chevy Traverse"},
      %Exercises.Car{make: "Toyota", model: "Sienna", style: :mini_van, price: 27_000, description: "Toyota Sienna"},
      %Exercises.Car{make: "Mazda", model: "6", style: :suv, price: 26_000, description: "Mazda 6"},
      %Exercises.Car{make: "BMW", model: "X5", style: :suv, price: 46_000, description: "BMW X5"},
      %Exercises.Car{make: "Subaru", model: "Forester", style: :wagon, price: 32_000, description: "Subaru Forester"},
      %Exercises.Car{make: "Chevy", model: "Sonic", style: :compact, price: 13_000, description: "Chevy Sonic"},
      %Exercises.Car{make: "Toyota", model: "Camry", style: :full_sedan, price: 26_000, description: "Toyota Camry"},
      %Exercises.Car{make: "Ford", model: "F150", style: :pickup, price: 24_000, description: "Ford F150 Pickup"}
    ]

  @tag :skip
  test "should match some cars" do
    cars = _get_cars()
    shopper = %Exercises.CarShopper{ income: 75_000, family_size: 4 }

    matches = Exercises.CarShopper.recommend_cars(shopper, cars)

    matches |> Enum.any?() |> assert()
    matches |> Enum.all?(&(_is_car(&1))) |> assert()
  end

  @tag :skip
  test "should recommend cars for each" do
    cars = _get_cars()
    shoppers = [
      %Exercises.CarShopper{name: "Middle Class Family", income: 110_000, family_size: 4},
      %Exercises.CarShopper{name: "Lower Income", income: 30_000},
      %Exercises.CarShopper{name: "Medium Family", family_size: 4},
      %Exercises.CarShopper{name: "Tall Guy", income: 80_000, height_inches: 73},
      %Exercises.CarShopper{name: "Outdoorsy", lifestyle: :active}
    ]

    get_matches = fn(s) -> 
      recommended = Exercises.CarShopper.recommend_cars(s, cars) 
      %{name: s.name, likes: Enum.map(recommended, &(&1.description))}
    end

    matches = Enum.map(shoppers, get_matches)

    IO.inspect matches
  end
end