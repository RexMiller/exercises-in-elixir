defmodule WeatherData.RepositoryTests do
  import Exercises.WeatherData.Repository
  use ExUnit.Case

  test "Should return a tuple of OK and list of node data" do
    { :ok, data } = get_station_data()

    assert is_list data
  end
end