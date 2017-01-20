defmodule Car do
@moduledoc """
Used in the tests/examples below
"""
  defstruct(
    make: :unknown,
    model: :unknown,
    style: :unknown,
    price: :unknown,
    description: :unknown)
end

defmodule Shopper do
@moduledoc """
Used in the tests/examples below
"""
  defstruct(
    name: :unknown,
    age: :unknown,
    car: %Car{}
  )
end

defmodule MapsAndDictionariesTests do
@moduledoc """
Not tests so much as illustrations...
"""

  use ExUnit.Case

  @tag :skip
  test "Accessing maps" do
    car = get_car_map()

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
    car = get_car_map()

    IO.puts "\nMap.drop(map, [:field_1, :field_2, :field_n])"
    IO.inspect Map.drop(car, [:make, :model, :style, :price])

    IO.puts "\nMap.put(map, :field, value)"
    IO.inspect Map.put(car, :color, "Black")

    IO.puts "\nMap.pop(map, :field)"
    IO.inspect Map.pop(car, :description)
  end

  @tag :skip
  test "Map pattern matching" do
    car = get_car_map()

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
  test "Filtering a list of maps - works for maps and structs" do
    cars = get_cars()
    filtered = for car = %{price: price} <- cars, price > 30_000, do: car

    IO.inspect filtered, label: "Filtered maps"

    car_structs = get_car_structs()
    filtered_structs = for car = %{price: price} <- car_structs, price > 30_000, do: car

    IO.inspect filtered_structs, label: "Filtered structs"
  end

  @tag :skip
  test "Filtering a list of maps and selecting a field" do
    cars = get_cars()

    price_fn = fn (:get, data, next_fn) ->
      for row <- data do
        if row.price > 30_000, do: next_fn.(row)
      end
    end

    get_in(cars, [price_fn, :description])
    |> IO.inspect(label: "Cars over 30,000")
  end

  @tag :skip
  test "Filtering a list of maps and selecting a field - easier way" do
    get_cars() 
    |> Enum.filter(fn(row) -> row[:price] > 30_000 end)
    |> get_in([Access.all(), :description])
    |> IO.inspect(label: "Cars over 30,000")

  end

  @tag :skip
  test "Updating maps" do
    # The simplest way to update a map is with this syntax:​ 
    # new_map = %{ old_map | key => value, ​…​ }
    car = Enum.at(get_cars(), 1)
    price_correction = %{car | :price => 26_500}

    IO.inspect price_correction

    sweet_ride = %{car | :price => 27_000, :description => "Rockin' Mini-van'"}

    IO.inspect sweet_ride
  end

  @tag :skip
  test "Nested structs - accessing leaves" do
    shopper = get_shopper_struct()

    IO.inspect shopper.car.model
  end

  @tag :skip
  test "Nested maps - accessing by dynamic keys" do
    shopper = get_shopper_map()

    name = :name
    IO.inspect get_in(shopper, [name]), label: ":name"

    make = :make
    IO.inspect get_in(shopper, [:car, make]), label: "[:car, make]"

    car_make = [:car, :make]
    IO.inspect get_in(shopper, car_make), label: "car_make"

    location_state = [:car, :location, :state]
    IO.inspect get_in(shopper, location_state), label: "location_state"
  end

  @tag :skip
  test "Nested structs - updating the hard way" do
    shopper = get_shopper_struct()

    shopper_with_discount = %Shopper{
      shopper | car: %Car{
        shopper.car | price: 22_000
      }
    }

    IO.inspect shopper_with_discount, label: "shopper_with_discount"
  end

  @tag :skip
  test "Nested structs - updating the better way" do
    shopper = get_shopper_struct()

    shopper_with_discount = put_in(shopper.car.price, 22_000)

    IO.inspect shopper_with_discount
  end

  @tag :skip
  test "Nested structs - updating with function" do
    shopper = get_shopper_struct()

    shopper_with_discount = update_in(shopper.car.price, &(&1 * 0.9))

    IO.inspect shopper_with_discount
  end

  def get_car_map(),
    do: %{make: "Toyota", model: "Sienna", style: :mini_van, price: 26_000, description: "Toyota Sienna"}

  def get_car_struct(),
    do: %Car{make: "Toyota", model: "Sienna", style: :mini_van, price: 26_000, description: "Toyota Sienna"}

  def get_shopper_map(),
    do: %{
        name: "Bob",
        age: 40,
        car: %{
          make: "Infinity",
          model: "Q35",
          price: 29_000,
          location: %{
            city: "Atlanta",
            state: "GA"
          }
        }
      }

  def get_shopper_struct(),
    do: %Shopper{
        name: "Bob",
        age: 40,
        car: %Car{
          make: "Infinity",
          model: "Q35",
          price: 29_000
        }
      }

  def get_cars(),
    do: [
      %{make: "Chevy", model: "Traverse", style: :large_suv, price: 20_000, description: "Chevy Traverse"},
      %{make: "Toyota", model: "Sienna", style: :mini_van, price: 26_000, description: "Toyota Sienna"},
      %{make: "Mazda", model: "6", style: :suv, price: 27_000, description: "Mazda 6"},
      %{make: "BMW", model: "X5", style: :suv, price: 46_000, description: "BMW X5"},
      %{make: "Subaru", model: "Forester", style: :wagon, price: 32_000, description: "Subaru Forester"},
      %{make: "Chevy", model: "Sonic", style: :compact, price: 13_000, description: "Chevy Sonic"},
      %{make: "Dodge", model: "Charger", style: :full_sedan, price: 28_000, description: "Dodge Charger"}
    ]

 def get_car_structs(),
    do: [
      %Car{make: "Chevy", model: "Traverse", style: :large_suv, price: 20_000, description: "Chevy Traverse"},
      %Car{make: "Toyota", model: "Sienna", style: :mini_van, price: 26_000, description: "Toyota Sienna"},
      %Car{make: "Mazda", model: "6", style: :suv, price: 27_000, description: "Mazda 6"},
      %Car{make: "BMW", model: "X5", style: :suv, price: 46_000, description: "BMW X5"},
      %Car{make: "Subaru", model: "Forester", style: :wagon, price: 32_000, description: "Subaru Forester"},
      %Car{make: "Chevy", model: "Sonic", style: :compact, price: 13_000, description: "Chevy Sonic"},
      %Car{make: "Dodge", model: "Charger", style: :full_sedan, price: 28_000, description: "Dodge Charger"}
    ]
end
