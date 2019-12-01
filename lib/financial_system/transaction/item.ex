defmodule FinancialSystem.Transaction.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :value, :integer
    belongs_to :transfer, FinancialSystem.Transaction.Transfer
    belongs_to :account_received, FinancialSystem.Transaction.Account

    timestamps()
  end

  def changeset(item, params \\ %{}) do
    item
    |> cast(params, [:value, :account_received_id, :transfer_id])
    |> validate_required([:value, :account_received_id, :transfer_id])
    |> foreign_key_constraint(:account_received_id, message: "account received invalid")
  end

end
