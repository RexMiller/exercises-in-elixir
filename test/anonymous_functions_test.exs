defmodule AnonymousFunctionsTest do
  import Exercises.AnonymousFunctions
  use ExUnit.Case

  test "Should double each" do
    result = double_each([2, 3])
    assert result == [4, 6]
  end

  test "Should delegate double each" do
    result = delegate_double_each([2, 3])
    assert result == [4, 6]
  end

  test "Should add to each" do
    result = add_to_each([2, 3], 2)
    assert result == [4, 5]
  end

  test "Should capture prefix" do
    your = capture_prefix("Your")
    assert your.("mom") == "Your mom"
  end
end
