defmodule FinancialSystem.RepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias FinancialSystem.Repo

      import Ecto
      import Ecto.Query
      import FinancialSystem.RepoCase

      # and any other stuff
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(FinancialSystem.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(FinancialSystem.Repo, {:shared, self()})
    end

    :ok
  end
end
