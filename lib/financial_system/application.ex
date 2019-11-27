defmodule FinancialSystem.Application do
  @moduledoc false
  use Application

  def start(_type, _args) do
    children = [
      FinancialSystem.Repo
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: FinancialSystem.Supervisor)
  end
end
