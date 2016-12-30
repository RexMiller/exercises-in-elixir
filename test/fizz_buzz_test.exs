defmodule FizzBuzzTest do
  import Exercises.FizzBuzz
  use ExUnit.Case

  doctest Exercises.FizzBuzz

  test "Should fizz and buzz" do
    result = fizz_buzz({1, 6})
    assert result == ["1", "2", "Fizz", "4", "Buzz", "Fizz"]
  end

  test "Should FizzBuzz" do
    result = fizz_buzz({15, 15})
    assert result == ["FizzBuzz"]
  end
end