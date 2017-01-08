defmodule Exercises.WeatherData.Search do
@moduledoc """
Functions for searching collections of contrived measurements from 
made-up weather stations, where each element is a list like
[time, station_id, temp, rainfall].
"""
  alias Exercises.WeatherData.Repository, as: WeatherData;
  
  @doc """
  Given a location Id will return only the elements where 
  the location of the element matches.
  """
  def search_location(location) do
    WeatherData.get_station_data() 
    |> (fn
        {:ok, data} -> _filter_by_location(data, location)
        {:error, _} -> raise "error reading weather data"
    end).()
  end

  # function head for an empty list, necessary so that
  # recursion will end when the list has been processed
  # (as well as for calls made against and empty list
  def _filter_by_location([], _location), do: []
  
  # This deconstructs the list into a head and a tail where the head
  # matches rows whose second element matches the location parameter 
  # of the function call. In other words this head will only be invoked,
  # and thus accumulated results on the stack, for rows that match
  # our location criterion.
  def _filter_by_location([head = [_, location, _, _] | tail], location),
    # accumulates the return value on the stack as the head (which is)
    # a matching row and a recursive call to the tail which will either
    # match this function again or fall through to the other one. 
    do: [head | _filter_by_location(tail, location)]
  
  # This continues the call recursion without accumulating
  # a result when a row does not match the search pattern.
  def _filter_by_location([_head | tail], location), 
    do: _filter_by_location(tail, location)

end
