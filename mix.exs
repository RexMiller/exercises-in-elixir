defmodule GettingStarted.Mixfile do
  use Mix.Project

  def project do
    [app: :getting_started,
     version: "0.0.1",
     elixir: "~> 1.3",
     deps: deps()]
  end

  def application, do: [applications: [:logger]]

  defp deps do
    [
      {:mix_test_watch, "~> 0.2.6"},
      {:credo, "~> 0.5.3"}
    ]
  end
end