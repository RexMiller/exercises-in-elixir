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

  test "can get headers from header csv" do
    header_csv = "id,ship_to,net_amount"
    header_row = parse_row(header_csv, &String.to_atom/1)
    expected = [:id, :ship_to, :net_amount]
    assert header_row == expected
  end

  test "order processing can get record from csv given headers" do
    csv = "123,:NC,100.00"
    headers = [:id, :ship_to, :net_amount]
    record = get_record_from_csv(csv, headers)
    expected = [id: 123, ship_to: :NC, net_amount: 100.0]
    assert record == expected
  end

  test "files and stuff" do
    Exercises.OrderRepository.get_all() |> IO.inspect()
  end
end