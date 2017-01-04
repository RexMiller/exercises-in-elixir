defmodule Exercises.WeatherData.SearchTest do
  import Exercises.WeatherData.Search
  use ExUnit.Case

  test "Search results should be a non_empty list" do
    search_location(27)
    |> Enum.any?()
    |> assert()
  end

  test "Should include only searched location" do
    search_location(27)
    |> Enum.all?(_location_is(27))
    |> assert()
  end
    
  defp _location_is(value),
    do: fn (datum) -> _get_location(datum) == value end

  defp _get_location([_, location, _, _]), 
    do: location

end