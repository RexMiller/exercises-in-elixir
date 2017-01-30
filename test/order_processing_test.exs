defmodule OrderTaxCalcTest do
  import Exercises.OrderProcessing
  use ExUnit.Case

  test "order processing adds a tax amount to each order" do
    rates = get_tax_rates()

    get_orders()
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

  test "strings and stuff" do
    order = "123,:NC,100.00"
    
  end

  defp parse_field(field) do
    
  end
  
end