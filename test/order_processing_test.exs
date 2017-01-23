defmodule OrderTaxCalcTest do
  import Exercises.OrderProcessing
  use ExUnit.Case

  test "get orders with taxes" do
    rates = get_tax_rates()
    orders = get_orders()

    orders |> add_tax_to_orders(rates) |> IO.inspect()
  end

  test "order processing adds tax when matching state in rate list" do
    rates = get_tax_rates()
    order = [id: 123, ship_to: :NC, net_amount: 100.0]
    expected = [id: 123, ship_to: :NC, net_amount: 100.0, total_amount: 107.5]

    order |> add_tax(rates) |> assert_equal(expected)
  end

  defp assert_equal(outcome, expected) do
    assert(outcome == expected)
  end

end