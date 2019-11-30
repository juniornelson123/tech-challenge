use Mix.Config

config :financial_system, FinancialSystem.Repo,
  database: "financial_prod",
  username: "mac",
  password: "123456",
  hostname: "localhost"
