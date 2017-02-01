defmodule Exercises.OrderTaxCalculator do
  @moduledoc """
  Adds taxes to orders (exercises around list processing).
  """

  @doc """
  Returns a keyword list of tax rates by state.
  """
  def get_tax_rates(),
    do: [NC: 0.075, TX: 0.08]

  @doc """
  Given a list of orders and a list of tax rates, will apply tax 
  to each order if shipping to a state in the list of tax rates.
  """
  def add_tax_to_orders(orders, rate_list) do
    Enum.map(
      orders, 
      fn(o) -> 
        add_tax(o, rate_list)
      end)
  end

  @doc """
  Given an order in the form of a list and a list of tax rates, will 
  apply tax to the order if shipping to a state in the list of tax rates.
  """  
  def add_tax(order, rate_list) do
    [id: id, ship_to: ship_to, net_amount: net] = order
    
    rate = Keyword.get(rate_list, ship_to, 0)
    total = net + net * rate
    
    [id: id, ship_to: ship_to, net_amount: net, total_amount: total]
  end

end

defmodule Exercises.OrderRepository do
@moduledoc """
Fetches orders from persistence.
"""

  @doc """
  Gets all orders from the persistence store.
  """
  def get_all(path) do
    file = File.open!(path) 
    headers = file 
    |> IO.read(:line) 
    |> parse_line(&String.to_atom/1)

    file 
    |> IO.stream(:line) 
    |> Enum.map(&(get_record_from_line(&1, headers)))
  end

  defp get_record_from_line(line, headers) do
    line
    |> parse_line(&convert_field/1)
    |> add_headers(headers)
  end

  defp parse_line(line, conversion_fn) do
    line
    |> String.strip()
    |> String.split(~r{,\s*})
    |> Enum.map(conversion_fn)
  end

  defp convert_field(field) do
    cond do
      Regex.match?(~r{^\d*\.\d+$}, field) -> String.to_float(field)
      Regex.match?(~r{^\d+$}, field) -> String.to_integer(field)
      <<?: ::utf8, atom::binary>> = field -> String.to_atom(atom)
      true -> field
    end
  end
  
  defp add_headers(line, headers) do
    Enum.zip(headers, line)
  end

end