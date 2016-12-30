defmodule Exercises.Calendar do
@moduledoc """
Demonstrates guard clauses, control flow with cond and case, and case with pattern matching
"""
  @doc """
  Example of guard clauses. Given a year, will return true if it is a leap year, false if not.

  ## Example
  iex>Exercises.Calendar.is_leap_year(2016)
  true
  """
  def is_leap_year(year) when (rem(year, 400) == 0), do: true
  def is_leap_year(year) when (rem(year, 100) == 0), do: false
  def is_leap_year(year) when (rem(year, 4) == 0), do: true
  def is_leap_year(_year), do: false

  @doc """
  Example of control flow with cond. Given a weekday atom will return the abbreviation.

  ## Example
  iex>Exercises.Calendar.day_abbr(:Tuesday)
  "Tu"
  """
  def day_abbr(day) do
    cond do
      day == :Monday -> "M"
      day == :Tuesday -> "Tu"
      day == :Wednesday -> "W"
      day == :Thursday -> "Th"
      day == :Friday -> "F"
      day == :Saturday -> "Sa"
      day == :Sunday -> "Su"
    end
  end

  @doc """
  Example of control flow with case. Given a weekday atom will return the abbreviation.

  ## Example
  iex>Exercises.Calendar.day_abbr2(:Tuesday)
  "Tu"
  """
  def day_abbr2(day) do
    case day do
      :Monday -> "M"
      :Tuesday -> "Tu"
      :Wednesday -> "W"
      :Thursday -> "Th"
      :Friday -> "F"
      :Saturday -> "Sa"
      :Sunday -> "Su"
      _ -> "Invalid day"
    end
  end

  @doc """
  Example of control flow with case using pattern matching. Given a date tuple will return something descriptive about that date.

  ## Example
  iex>Exercises.Calendar.describe_date({ 31, 10, 2017 })
  "Happy halloween"
  """
  def describe_date(date) do
    case date do
      {1, _, _} -> "Brand new month!"
      {25, 12, _} -> "Merry Christmas!"
      {25, month, _} -> "Only #{12 - month} months til Christmas"
      {31, 10, 1517} -> "The reformation is starting"
      {31, 10, _} -> "Happy halloween"
      {_, month, _} when month <= 12 -> "Just an average day"
      {_, _, _} -> "Invalid month"
    end
  end

end