use Mix.Config

config :financial_system, FinancialSystem.Repo,
  database: "financial_test",
  username: "mac",
  password: "123456",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
