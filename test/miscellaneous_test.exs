defmodule MiscTest do
  import Exercises.Misc
  use ExUnit.Case

  test "Should subtotal by matching a tuple element" do
    result = subtotal(2, {"Item", "Description", 2.99})
    assert result == 5.98
  end
  
end