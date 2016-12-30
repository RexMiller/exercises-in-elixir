defmodule BottleSongTest do
  import Exercises.BottleSong.Three
  use ExUnit.Case

  doctest Exercises.BottleSong.Three

  test "Should sing a verse" do
    result = sing(100..99)
    assert result == 
"""
99 bottles left. Take 1 down, 98 bottles left.
98 bottles left. Take 1 down, 97 bottles left.
"""
  end

  test "Should sing verse for 2 bottles" do
    result = sing(3..2)
    assert result == 
"""
2 bottles left. Take 1 down, 1 bottle left.
1 bottle left. Take it down, no bottles left.
"""
  end
  
end