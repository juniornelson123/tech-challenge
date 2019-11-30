defmodule FinancialSystem.Repo.Migrations.CreateItem do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :value, :integer
      add :account_received_id, references(:accounts)
      add :transfer_id, references(:transfers)

      timestamps()
    end
  end
end
