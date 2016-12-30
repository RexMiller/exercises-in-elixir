defmodule Exercises.Caesar do

  @doc """
  My favorite implementation—not mine, but submitted by a user on forums.pragprog.com.
  I added handling for upper and mixed case.
  """
  def caesar_shift_math([], _shift), do: []
  def caesar_shift_math([head | tail], shift), 
    do: [_shift_by_rem(head, shift) | caesar_shift_math(tail, shift)]

  def _shift_by_rem(char, shift)
    when char in (?a..?z),
    do: rem(char - ?a + shift, 26) + ?a 

  def _shift_by_rem(char, shift)
    when char in (?A..?Z),
    do: rem(char - ?A + shift, 26) + ?A 

  @doc """
  My caesar shift implementation using tail-call recursion. Handles wrapping for 
  upper, lower, and mixed case but I wish I had come up with a more elegant/functional
  way to do that.
  """
  def caesar_shift_tr(list, shift), 
    do: _caesar_shift_tr(list, shift, [])

  defp _caesar_shift_tr([], _shift, accumulator), 
    do: accumulator
  defp _caesar_shift_tr([char | tail], shift, accumulator) do 
    shifted = _shift(char, shift)
    _caesar_shift_tr(tail, shift, accumulator ++ [shifted])
  end

  @doc """
  Dave Thomas' caesar shift solution using body recursion, which is much cleaner than mine.
  I wired it into my handling for upper and mixed case but that part of it is still somewhat clumsy.
  """
  def caesar_shift([], _shift), do: []
  def caesar_shift([head | tail], shift), 
    do: [_shift(head, shift) | caesar_shift_tr(tail, shift)]

  @doc """
  Caesar shift using map instead of recursion. Submitted by a user at forums.pragprog.com. I 
  wired it into my handling for upper and mixed case.
  """
  def caesar_shift_map(list, shift),
    do: Enum.map(list, &(_shift(&1, shift)))
  
  defp _shift(char, shift) do
    if _should_wrap(char, shift),
      do: (char - 26) + shift,
      else: char + shift
  end

  defp _should_wrap(char, shift) when char in (?A..?Z),
    do: char + shift > ?Z
  defp _should_wrap(char, shift) when char in (?a..?z),
    do: char + shift > ?z
  
end