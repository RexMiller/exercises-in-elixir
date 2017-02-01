defmodule ListComprehensionTest do
  import Exercises.OrderTaxCalculator
  alias Exercises.OrderRepository, as: Orders
  use ExUnit.Case

  @tag :skip
  test "Pattern matching in list comprehension" do
    orders = Orders.get_all("orders.txt")

    for [id: _id, ship_to: ship_to, net_amount: _net] <- orders, 
      do: IO.inspect ship_to
  end

  @tag :skip
  test "multiple lists with filters" do
    orders = Orders.get_all("orders.txt")
    tax_rates = get_tax_rates()

    # Lists only orders shipping to TX. A little contrived and 
    # probably better accomplished with filter and map but shows
    # list comprehension on multiple lists.
    for [_, ship_to: ship_to, net_amount: net] = order <- orders, 
      {state, rate} <- tax_rates,
      ship_to == state,
      state == :TX,
    do: IO.inspect Keyword.put(order, :total, net + net * rate)
  end
end