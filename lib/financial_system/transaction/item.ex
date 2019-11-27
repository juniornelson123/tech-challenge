defmodule FinancialSystem.Transaction.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :value, :integer
    belongs_to :transfer, FinancialSystem.Transaction.Transfer
    belongs_to :account, FinancialSystem.Transaction.Account

    timestamps()
  end

  def changeset(item, params \\ %{}) do
    item
    |> cast(params, [:value, :account_id, :transfer_id])
    |> validate_required([:value, :account_id, :transfer_id])
  end

end
