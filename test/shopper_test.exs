defmodule ShopperTest do
  import Exercises.Shopper
  use ExUnit.Case

  test "should recommend mini-van" do
    recommend_car(%Exercises.Shopper{family_size: 4}) 
    |> assert("Mini-van")
  end

  test "should recommend full sized SUV" do
    recommend_car(%Exercises.Shopper{family_size: 4}) 
    |> assert("Full sized SUV")
  end

  @tag :skip
  test "should recommend cars for each" do
    shoppers = [
      %Exercises.Shopper{ income: 110000, family_size: 4 },
      %Exercises.Shopper{ income: 30000 },
      %Exercises.Shopper{ family_size: 4 },
      %Exercises.Shopper{ is_tall: true },
      %Exercises.Shopper{ lifestyle: :active }
    ]

    print_rec = fn (e) -> 
      IO.puts(Exercises.Shopper.recommend_car(e))
    end

    shoppers 
    |> Enum.each(&(print_rec.(&1)))
  end
end