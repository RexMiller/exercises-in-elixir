defmodule CaesarTest do
  import Exercises.Caesar
  use ExUnit.Case

  test "Ceasar shift should work" do
    result = caesar_shift('abc', 1)
    assert result == 'bcd'
  end

  test "Ceasar shift should wrap" do
    result = caesar_shift('ryvkve', 13)
    assert result == 'elixir'
  end

  test "Ceasar shift should accept uppercase" do
    result = caesar_shift('RYVKVE', 13)
    assert result == 'ELIXIR'
  end

  test "Ceasar shift should accept mixed-case" do
    result = caesar_shift('rYvKvE', 13)
    assert result == 'eLiXiR'
  end

  test "Ceasar shift-tr should work" do
    result = caesar_shift_tr('abc', 1)
    assert result == 'bcd'
  end

  test "Ceasar shift-tr should wrap" do
    result = caesar_shift_tr('ryvkve', 13)
    assert result == 'elixir'
  end

  test "Ceasar shift-tr should accept uppercase" do
    result = caesar_shift_tr('RYVKVE', 13)
    assert result == 'ELIXIR'
  end

  test "Ceasar shift-tr should accept mixed-case" do
    result = caesar_shift_tr('rYvKvE', 13)
    assert result == 'eLiXiR'
  end

  test "Ceasar shift-map should work" do
    result = caesar_shift_map('abc', 1)
    assert result == 'bcd'
  end

  test "Ceasar shift-map should wrap" do
    result = caesar_shift_map('ryvkve', 13)
    assert result == 'elixir'
  end

  test "Ceasar shift-map should accept uppercase" do
    result = caesar_shift_map('RYVKVE', 13)
    assert result == 'ELIXIR'
  end

  test "Ceasar shift-map should accept mixed-case" do
    result = caesar_shift_map('rYvKvE', 13)
    assert result == 'eLiXiR'
  end

  test "Ceasar shift-math should work" do
    result = caesar_shift_math('abc', 1)
    assert result == 'bcd'
  end

  test "Ceasar shift-math should wrap" do
    result = caesar_shift_math('ryvkve', 13)
    assert result == 'elixir'
  end

  test "Ceasar shift-math should accept uppercase" do
    result = caesar_shift_math('RYVKVE', 13)
    assert result == 'ELIXIR'
  end

  test "Ceasar shift-math should accept mixed-case" do
    result = caesar_shift_math('rYvKvE', 13)
    assert result == 'eLiXiR'
  end
  
end