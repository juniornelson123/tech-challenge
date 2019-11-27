defmodule FinancialSystem.Repo.Migrations.CreateTransfer do
  use Ecto.Migration

  def change do
    create table(:transfers) do
      add :value, :integer
      add :currency, :string

      timestamps()
    end
  end
end
