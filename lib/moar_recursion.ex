defmodule Exercises.MoarRecursion do
@moduledoc """
Practicing recursion and matching strategies with various implementations of functions over enumerables
"""
  import Kernel, except: [length: 1]

  @doc """
  Demonstrates pattern matching on the head and tail of a list or on an empty list  
  """
  def first([]), do: nil
  def first([head | _]), do: head

  @doc """
  Finds the length of a list using body recursion. This implemention is not
  tail-call recursive because the function's final operation is to add 1 to_string/1
  the result of the recursive call and return the result.
  """
  def length([]), 
    do: 0
  def length([_ | tail]), 
    do: 1 + length(tail)

  @doc """
  Finds the length of a list using tail-call recursion, which does not add a new 
  frame to the stack for every call. Tail-call recursion only occurs when the final 
  operation of the function is to return the pure recursive call.
  """
  def length_tr(list), 
    do: length_tr(list, 0)
  def length_tr([], len), 
    do: len
  def length_tr([_head | tail], len), 
    do: length_tr(tail, len + 1)


  @doc """
  Reverses a list using recursion.
  
  ## How does this work?
  list = [3, 2, 1]
  
  The first call passes in the list, which is matched to a head and a tail, and an 
  empty list as the starting result accumlator.
  reverse([3 | [2, 1]], []) 
  |
  | The next call passes the current tail ([2, 1]) as the new list, and the current
  | head plus the empty accumlated result ([3 | []]) as the new accumulated result.
  --reverse([2 | [1]], [3 | []])
    |
    | The next call passes the current tail ([1]) as the new list, and the current head
    | plus the previously accumlated result ([2 | [3]]) as the new accumulated result.
    --reverse([1 | []], [2 | [3]])
      |
      | The next call passes the current tail ([]) as the new list, and the current head
      | plus the previously accumlated result ([1 | [2 , 3]]) as the new accumulated result.
      --reverse([], [1 | [2, 3]])
          This call matches the function head whose parameters are an empty list and the
          accumulated result so it returns the accumulated result:
          ——> [1, 2, 3]
  """
  def reverse(list),
    do: reverse(list, [])
  def reverse([], result),
    do: result
  def reverse([head | tail], result),
    do: reverse(tail, [head | result])

  @doc """
  Implements map with body recursion.
  """
  def map([], _), 
    do: []
  def map([head | tail], func),
    do: [func.(head) | map(tail, func)]

  @doc """
  Implements map with tail-call recursion
  """
  def map_tr([head | tail], func), 
    do: map_tr(tail, func, [func.(head)])
  def map_tr([], _func, result), 
    do: result
  def map_tr([head | tail], func, result) do
    map_tr(tail, func, [func.(head) | result])
  end

  @doc """
  Maps a function to each member of a list while maintaining an accumulator 
  equal to the length of the list, similar to `Enum.map_reduce/3`
  """
  def map_accumulate([], _, _), 
    do: []
  def map_accumulate([head|tail], len, func) do
    [func.(head, len) | map_accumulate(tail, len + 1, func)]
  end
  
  @doc """
  For each element in a list, raises it to the power of its  position in the list.

  ## Example
  iex>Exercises.MoarRecursion.each_to_power_of_position([2, 2, 2])
  {[2.0, 4.0, 8.0], 3}
  """
  def each_to_power_of_position(list) do
    Enum.map_reduce(list, 0, &({:math.pow(&1, &2 + 1), &2 + 1}))
  end

end