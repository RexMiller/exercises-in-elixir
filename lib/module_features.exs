defmodule Exercises.Math.Util do
  def add(a, b) do
    a + b
  end
end

defmodule Exercises.ModuleFeatures do
@moduledoc """
Demonstrates some features of module implementation
"""

  # Import only the specified functions from a module
  import IO, only: [puts: 1]
  # Import everything from the module except the specified functions
  import Kernel, except: [inspect: 1]

  # Require makes macros from a module available
  require Integer

  # Alias an external module for the scope of this module
  alias Exercises.Math.Util, as: MyMath

  def say_here do
    inspect "I'm Here"
  end

  def inspect(param1) do
    puts "starting output"
    puts param1
    puts "ending output"
  end

  def print_sum do
    MyMath.add(1, 2)
  end

  def print_is_even(num) do
    puts "Is #{num} even? #{Integer.is_even(num)}"
  end
end
