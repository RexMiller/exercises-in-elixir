defmodule ListsAndRecursionTest do
  import Exercises.ListsAndRecursion
  use ExUnit.Case

  test "Should sum" do
    result = sum([1, 2, 3])
    assert result == 6
  end

  test "Should sum via tail recursion" do
    result = sum_tr([1, 2, 3])
    assert result == 6
  end

  test "Should reduce to sum" do
    result = reduce([1, 2, 3], 0, fn(item, total) -> item + total end)
    assert result == 6
  end

  test "Should map func and sum results" do
    result = mapsum([1, 2, 3], &(&1 * &1))
    assert result == 14
  end

  test "max should return max in list" do
    result = max([2, 4, 7, 5])
    assert result == 7
  end

  test "max should return max in list that includes negative numbers" do
    result = max([2, 4, -7, 5])
    assert result == 5
  end

  test "max should return max in non-numeric list" do
    result = max([[2, 3, 4], :ok, { :red, "blue" }, "elixir"])
    assert result == "elixir"
  end

  test "max1 should return max in a list" do
    result = max1([2, 4, 7, 5])
    assert result == 7
  end

  test "max1 should return max in list that includes negative numbers" do
    result = max1([2, 4, -7, 5])
    assert result == 5
  end

  test "max1 should return max in non-numeric list" do
    result = max1([[2, 3, 4], :ok, { :red, "blue" }, "elixir"])
    assert result == "elixir"
  end

  test "max2 should return max in a list" do
    result = max2([2, 4, 7, 5])
    assert result == 7
  end

  test "max2 should return max in list that includes negative numbers" do
    result = max2([2, 4, -7, 5])
    assert result == 5
  end

  test "max2 should return max in non-numeric list" do
    result = max2([[2, 3, 4], :ok, { :red, "blue" }, "elixir"])
    assert result == "elixir"
  end

  test "max3 should return max in a list" do
    result = max3([2, 4, 4, 7, 7, 5])
    assert result == 7
  end

  test "max3 should return max in list that includes negative numbers" do
    result = max3([2, 4, -7, 5])
    assert result == 5
  end

  test "max3 should return max in non-numeric list" do
    result = max3([[2, 3, 4], :ok, { :red, "blue" }, "elixir"])
    assert result == "elixir"
  end

  test "span should return a list of numbers from start to end" do
    result = span(10, 20)
    assert(length(result) == 11)
    assert(List.first(result) == 10)
    assert(List.last(result) == 20)
  end

  test "span1 should return a list of numbers from start to end" do
    result = span1(10, 20)
    assert(length(result) == 11)
    assert(List.first(result) == 10)
    assert(List.last(result) == 20)
  end

end