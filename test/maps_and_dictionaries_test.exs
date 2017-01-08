defmodule MapsAndDictionariesTests do
@moduledoc """
Not tests so much as illustrations...
"""

  import Exercises.MapsAndDictionaries
  use ExUnit.Case

  @tag :skip
  test "Accessing maps" do
    [car | _] = get_cars()

    IO.puts "\nMap.keys"
    IO.inspect Map.keys(car)

    IO.puts "\nMap.values"
    IO.inspect Map.values(car)

    IO.puts "\nmap[:fieldname]"
    IO.inspect car[:description]

    IO.puts "\nmap.fieldname"
    IO.inspect car.description
  end

  @tag :skip
  test "Map modifications" do
    [car | _] = get_cars()
    
    IO.puts "\nMap.drop(map, [:field_1, :field_2, :field_n])"
    IO.inspect Map.drop(car, [:make, :model, :style, :price])

    IO.puts "\nMap.put(map, :field, value)"
    IO.inspect Map.put(car, :color, "Black")

    IO.puts "\nMap.pop(map, :field)"
    IO.inspect Map.pop(car, :description)
  end

  @tag :skip
  test "Map pattern matching" do
    [car | _] = get_cars()

    # Does a given key exist?
    %{make: make} = car
    IO.inspect make
    
    # Do the given keys exist?
    %{make: _, model: _} = car

    # Does an entry with a given key exist and have a given value?
    %{make: "Chevy"} = car

    # This will fail because there is no :mileage key
    # %{make: make, mileage: mileage} = car
  end

  @tag :skip
  test "Iterating and filtering" do
    cars = get_cars()
    filtered = for car = %{price: price} <- cars, price > 30_000, do: car
    
    IO.inspect filtered
  end

  test "Updating maps" do
    # The simplest way to update a map is with this syntax:​ 
    # new_map = %{ old_map | key => value, ​…​ }
    car = Enum.at(get_cars(), 1)
    price_correction = %{car | :price => 26_500}

    IO.inspect price_correction
  end

end