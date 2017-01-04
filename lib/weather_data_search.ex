defmodule Exercises.WeatherData.Search do
  alias Exercises.WeatherData.Repository, as: WeatherData;
  
  def search_location(location) do
    WeatherData.get_station_data() 
    |> (fn
        {:ok, data} -> _filter_by_location(data, location)
        {:error, _} -> raise "error reading weather data"
    end).()
  end

  def _filter_by_location([], _location), do: []
  
  def _filter_by_location([head = [_, location, _, _] | tail], location),
    do: [ head | _filter_by_location(tail, location)]
  
  def _filter_by_location([_head | tail], location), 
    do: _filter_by_location(tail, location)

end