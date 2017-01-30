defmodule StringsAndBinariesTest do
  use ExUnit.Case

  test "anagrams" do
    anagram?('cat', 'act') |> assert()
    anagram?('repl', 'perl') |> assert()
    anagram?('your mom', 'hey now') |> refute()
  end
  
  def anagram?(s1, s2), 
    do: Enum.sort(s1) == Enum.sort(s2)

  test "center words" do
    result = center(["cat", "lemur", "orangatan"])
    assert(["   cat   ", "  lemur  ", "orangatan"] == result)    
  end

  def center(words) do
    line_width = words |> Enum.max_by(&(String.length(&1))) |> String.length()
    Enum.map(words, &(center_line(&1, line_width)))
  end

  defp center_line(content, width) do
    padding = div((width - String.length(content)), 2)
    String.duplicate(" ", padding) <> content <> String.duplicate(" ", padding)
  end

  test "capitalize sentances" do
    result = capitalize_sentances("oh. a DOG. woof.")
    expected = "Oh. A dog. Woof."
    assert(expected == result)
  end

  defp capitalize_sentances(string) do
    string 
    |> String.split(". ", trim: true) 
    |> Enum.map(fn(sentance) -> String.capitalize(sentance) end) 
    |> Enum.join(". ")
  end
end