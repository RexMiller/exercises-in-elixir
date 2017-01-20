defmodule Exercises.ListsAndRecursion do
@moduledoc """
Practicing recursion on lists
"""

  @doc """
  Sum implemented with body recursion
  """
  def sum([]), do: 0
  def sum([head | tail]),
    do: head + sum(tail)

  @doc """
  Sum implemented with tail-call recursion
  """
  def sum_tr(list), do: _sum_tr(list, 0)
  def _sum_tr([], total), do: total
  def _sum_tr([head | tail], total),
    do: _sum_tr(tail, head + total)

  @doc """
  Reduce implemented with tail-call recursion
  """
  def reduce([], accumulator, _), 
    do: accumulator
  def reduce([head | tail], accumulator, func),
   do: reduce(tail, func.(accumulator, head), func)

  @doc """
  Maps a function to each item and returns the sum of all items using tail-call recursion (?)
  """
  def mapsum(list, func), do: _mapsum(list, 0, func)
  defp _mapsum([], total, _func), do: total
  defp _mapsum([head | tail], total, func),
    do: _mapsum(tail, func.(head) + total, func)

  @doc """
  Returns the max item in a list. This was Dave Thomas' solution to the
  exercise proposed in his book. I was not clever enough to come up with
  any solution without looking at others for help.

  ## How does it work? (I have to do this to help me understand/remember)
  list = [3, 5, 2, 1]               

  max([3 | 5, 2, 1])                5 <───────────────┐
  │                                                   │
  ↓                                                   ↑
  Kernel.max(3, max([5 | 2, 1]))    5 → Kernel.max(3, 5)
  │                                 └─────────────────┐
  ↓                                                   ↑
  Kernel.max(5, max([2 | 1]))       2 → Kernel.max(5, 2)
  │                                 └─────────────────┐
  ↓                                                   ↑
  Kernel.max(2, max[1])             1 → Kernel.max(2, 1)
  ↓                                 ↑
  max([1]) ─────────────────────────┘
  """
  def max([n]), do: n
  def max([head | tail]),
    do: Kernel.max(head, max(tail))

  @doc """
  Returns the max item in a list. This was a user-submitted solution on
  forums.pragprog.com. I find this easiest of the three implementations 
  to unwind in my head.
  """
  def max1([starting_value | tail]), 
    do: _max1(tail, starting_value)
  defp _max1([head | tail], value) when head >= value, 
    do: _max1(tail, head)
  defp _max1([head | tail], value) when head < value, 
    do: _max1(tail, value)
  defp _max1([], value), do: value

  @doc """
  Returns the max item in a list. This was another user-submitted solution. 
  on forums.pragprog.com. I find this the most elegant of the three 
  implementations because it uses the head of the list as the tracking value.
  """
  def max2([max | [head | tail]]) when max >= head, 
    do: max2([max | tail])
  def max2([max | [head | tail]]) when max <  head, 
    do: max2([head | tail])
  def max2([max]), do: max

  @doc """
  Returns the max item in a list. This was another user-submitted 
  solution on forums.pragprog.com that I like because of its interesting 
  use of pattern matching on the list and tail-call recursion.
  """
  def max3([head]), do: head
  def max3([head1, head2 | tail]) when head1 > head2,
    do: max3([head1 | tail])
  def max3([_head1, head2 | tail]),
    do: max3([head2 | tail])
  
  def span(from, to),
    do: _span([from], from, to)

  defp _span([head | _], _, to) when head > to,
    do: []

  defp _span([head | tail], from, to),
    do: [head | _span([head + 1 | tail], from, to)]

  def span1(from, to) when from > to,
    do: []
  def span1(from, to),
    do: [from | span1(from + 1, to)]

  def all?(list, func), 
    do: _all(list, func, true)

  defp _all([], _func, accumulator), 
    do: accumulator

  defp _all(_list, _func, false),
     do: false

  defp _all([head | tail], func,  _accumulator),
    do: _all(tail, func, func.(head))

  def all2?([], _), do: true
  def all2?([head | tail], func) do
    if func.(head),
      do: all2?(tail, func),
      else: false
  end

  def each(list, func), do: 
    _each(list, func, [])
  
  defp _each([], _, _), do: :ok
  defp _each([head | tail], func, acc),
    do: _each(tail, func, [func.(head)] ++ acc)
  
  
  def filter(list, func), 
    do: _filter(list, func, [])

  def _filter([], _func, acc), do: acc

  def _filter([head | tail], func, acc) do
    if func.(head), 
      do: _filter(tail, func, acc ++ [head]),
      else: _filter(tail, func, acc)
  end

  def split(list, 0), 
    do: {[], list}
  def split(list, count), 
    do: _split(list, count, {[], []})

  defp _split(_list, count, { list1, _list2 } = acc)
    when length(list1) == count,
    do: acc

  defp _split(_list, count, { _list1, list2 } = acc)
    when length(list2) == -1 * count,
    do: acc

  defp _split([head | tail], count, { list1, _list2 } = _acc) do
    _split(tail, count, {list1 ++ [head], tail})
  end
end