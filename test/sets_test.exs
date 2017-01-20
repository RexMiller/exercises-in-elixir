defmodule SetsTests do
  use ExUnit.Case

  @tag :skip
  test "Creating a MapSet" do
    1..5 
    |> Enum.into(MapSet.new)
    |> IO.inspect(label: "MapSet.new")
  end

  @tag :skip
  test "MapSet Membership" do
    set = 1..5
    |> Enum.into(MapSet.new)

    MapSet.member? set, 3
    |> IO.inspect(label: "MapSet.member?")
  end

  @tag :skip
  test "MapSet Union" do
    set1 = 1..5 |> Enum.into(MapSet.new)
    set2 = 3..8 |> Enum.into(MapSet.new)
    
    MapSet.union(set1, set2)
    |> IO.inspect(label: "MapSet.union")
  end

  @tag :skip
  test "MapSet Difference" do
    set1 = 1..5 |> Enum.into(MapSet.new)
    set2 = 3..8 |> Enum.into(MapSet.new)

    MapSet.difference(set1, set2)
    |> IO.inspect(label: "MapSet.difference(set1, set2)")

    MapSet.difference(set2, set1)
    |> IO.inspect(label: "MapSet.difference(set2, set1)")
  end

  test "MapSet Intersection" do
    set1 = 1..5 |> Enum.into(MapSet.new)
    set2 = 3..8 |> Enum.into(MapSet.new)

    MapSet.intersection(set1, set2)
    |> IO.inspect(label: "MapSet.intersection")
  end

end