defmodule FinancialSystem.Mixfile do
  use Mix.Project

  def project do
    [
      app: :financial_system,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env()),
      aliases: aliases(),
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {FinancialSystem.Application, []},
      extra_applications: [:logger, :httpotion]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"},
      {:httpotion, "~> 3.1.0"},
      {:poison, "~> 3.1"}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp aliases do
    [
     "test": ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
