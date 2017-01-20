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

  test "all should return true when all are true" do
    list = [2, 4, 6]

    all?(list, fn(e) -> rem(e, 2) == 0 end)
    # |> IO.inspect(label: "\nall? should return true")
    |> assert()
  end

  test "all should return false when one is false" do
    list = [2, 4, 5, 6]

    all?(list, fn(e) -> rem(e, 2) == 0 end)
    # |> IO.inspect(label: "\nall? should return false")
    |> refute()
  end

  test "all2 should return true when all are true" do
    list = [2, 4, 6]

    all2?(list, fn(e) -> rem(e, 2) == 0 end)
    # |> IO.inspect(label: "\nall2? should return true")
    |> assert()
  end

  test "all2 should return false when one is false" do
    list = [2, 4, 5, 6]

    all2?(list, fn(e) -> rem(e, 2) == 0 end)
    # |> IO.inspect(label: "\nall2? should return false")
    |> refute()
  end

  @tag :skip # <- noisy test
  test "each should apply to each" do
    result = each([2, 4, 6], fn(e) -> IO.puts("\neach:#{e}") end)
    
    assert(result == :ok)
  end

  test "filter should return only evens" do
    list = [2, 4, 5]

    filtered = filter(list, fn(e) -> rem(e, 2) == 0 end)
    # |> IO.inspect(label: "\nfilter should return only evens")
    
    assert(filtered == [2, 4])
  end

  test "filter should return only words with x" do
    list = ["jax", "hacks", "trax"]

    filtered = filter(list, fn(e) -> String.contains?(e, "x") end)
    # |> IO.inspect(label: "\nfilter should return only words with x")
    
    assert(filtered == ["jax", "trax"])
  end

  test "Split gonna split" do
    [1, 2, 3, 4]
    |> split(2)
    |> _assert_equal({[1, 2], [3, 4]})
  end

  test "Split gonna split backwards" do
    [1, 2, 3, 4, 5]
    |> split(-3)
    |> _assert_equal({[1, 2], [3, 4, 5]})
  end

  @tag :skip
  test "Split gonna split at zero" do
    [1, 2, 3]
    |> split(0)
    |> _assert_equal({[], [1, 2, 3]})
  end

  defp _assert_equal(val1, val2) do
    assert(val1 == val2)
  end
end