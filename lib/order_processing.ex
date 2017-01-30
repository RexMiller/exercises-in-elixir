defmodule Exercises.OrderProcessing do
  @moduledoc """
  More exercises with lists
  """

  import Keyword, only: [get: 3]

  def add_tax_to_orders(orders, rate_list) do
    Enum.map(
      orders, 
      fn(o) -> 
        add_tax(o, rate_list)
      end)
  end

  def add_tax(order, rate_list) do
    [id: id, ship_to: ship_to, net_amount: net] = order
    
    rate = get(rate_list, ship_to, 0)
    total = net + net * rate
    
    [id: id, ship_to: ship_to, net_amount: net, total_amount: total]
  end

  def get_record_from_csv(csv, headers) do
    csv
    |> parse_record()
    |> format_record(headers)
  end

  defp parse_record(csv) do
    csv
    |> String.split(",")
    |> Enum.map(&parse_field/1)
  end

  defp parse_field(field) do
    cond do
      Regex.match?(~r{^\d*\.\d+$}, field) -> String.to_float(field)
      Regex.match?(~r{^\d+$}, field) -> String.to_integer(field)
      <<?: ::utf8, atom::binary>> = field -> String.to_atom(atom)
      true -> field
    end
  end

  defp format_record(record, headers) do
    Enum.zip(headers, record)
  end

  def get_tax_rates(),
    do: [NC: 0.075, TX: 0.08]

  def get_orders() do
    [
      [id: 123, ship_to: :NC, net_amount: 100.00],
      [id: 124, ship_to: :OK, net_amount: 35.50],
      [id: 125, ship_to: :TX, net_amount: 24.00],
      [id: 126, ship_to: :TX, net_amount: 44.80],
      [id: 127, ship_to: :NC, net_amount: 25.00],
      [id: 128, ship_to: :MA, net_amount: 10.00],
      [id: 129, ship_to: :CA, net_amount: 102.00],
      [id: 130, ship_to: :NC, net_amount: 50.00]
    ]
  end
  
end