# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :financial_system,
      ecto_repos: [FinancialSystem.Repo]

import_config "#{Mix.env}.exs"
