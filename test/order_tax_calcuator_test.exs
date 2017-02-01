defmodule OrderTaxCalculatorTest do
  import Exercises.OrderTaxCalculator
  alias Exercises.OrderRepository, as: Orders
  use ExUnit.Case

  test "order processing adds a tax amount to each order" do
    rates = get_tax_rates()

    Orders.get_all("orders.csv")
    |> add_tax_to_orders(rates) 
    |> Enum.each(fn(e) -> 
      assert(Keyword.has_key?(e, :total_amount))
    end)
  end

  test "order processing adds tax when matching state in rate list" do
    rates = get_tax_rates()
    order = [id: 123, ship_to: :NC, net_amount: 100.0]
    expected = [id: 123, ship_to: :NC, net_amount: 100.0, total_amount: 107.5]
    total_order = add_tax(order, rates)
    assert(expected == total_order)
  end
end